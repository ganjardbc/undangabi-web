<template>
  <div id="App">
    <div class="width width-100">
      <div class="display-flex space-between align-center">
        <div class="fonts fonts-22 semibold black">Reservasi</div>
        <div class="display-flex flex-end">
          <button
            class="btn btn-white btn-icon"
            @click="onShowHideBulkDownload"
          >
            <i class="fa fa-lw fa-cloud-download-alt" />
          </button>
          <button
            v-if="isPrivateInvitation"
            class="btn btn-white btn-icon"
            @click="onShowHideBulkUpload"
          >
            <i class="fa fa-lw fa-cloud-upload-alt" />
          </button>
        </div>
      </div>
      <div class="display-flex padding padding-top-15px padding-bottom-15px">
        <div
          v-for="(dt, i) in dataGuestMetrics"
          :key="i"
          class="width width-row-3"
        >
          <div
            :class="`${i !== dataGuestMetrics.length - 1 && 'border-right'}`"
          >
            <div class="padding padding-10px content-center">
              <div class="fonts fonts-22 semibold primary">
                {{ dt.quantity }}
              </div>
              <div class="fonts fonts-9 normal black">{{ dt.label }}</div>
            </div>
          </div>
        </div>
      </div>
      <div class="width width-100 display-flex space-between display-mobile">
        <div class="width width-300px width-mobile padding padding-bottom-15px">
          <el-input
            placeholder="Cari reservasi"
            v-model="formFilter.search"
            class="subject-input-with-select"
            @input="handleFilterSearch"
            clearable
          >
            <el-button
              slot="append"
              icon="el-icon-search"
              @click="getData"
            ></el-button>
          </el-input>
        </div>
        <div
          class="width width-400px width-mobile display-flex flex-end display-mobile"
        >
          <div
            v-if="dataBride && dataBride.length > 0"
            class="width width-195px width-mobile padding padding-bottom-15px margin margin-left-15px margin-mobile"
          >
            <el-select
              v-model="selectedBride"
              placeholder="Filter pengantin"
              :disabled="false"
              clearable
              style="width: 100%"
              @change="onChangeTabs(0)"
            >
              <el-option
                v-for="(item, index) in dataBride"
                :key="index"
                :label="item.bride.name"
                :value="item.bride.id"
              >
              </el-option>
            </el-select>
          </div>
          <div
            v-if="dataSchedule && dataSchedule.length > 0"
            class="width width-195px width-mobile padding padding-bottom-15px margin margin-left-15px margin-mobile"
          >
            <el-select
              v-model="selectedSchedule"
              placeholder="Filter jadwal"
              :disabled="false"
              clearable
              style="width: 100%"
              @change="onChangeTabs(0)"
            >
              <el-option
                v-for="(item, index) in dataSchedule"
                :key="index"
                :label="`${item.reservationSchedule.title} (${item.reservationSchedule.schedule_time} ${item.reservationSchedule.schedule_timezone})`"
                :value="item.reservationSchedule.id"
              >
              </el-option>
            </el-select>
          </div>
        </div>
      </div>
      <div
        class="width width-100 width width-mobile margin margin-bottom-20-px"
      >
        <AppTabs
          :selectedIndex="selectedIndex"
          :data="tabs"
          :isScrollable="true"
          :isFull="true"
          :path="'guest-list-tabs'"
          :onChange="(data) => onChangeTabs(data)"
        />
      </div>
      <div v-loading="visibleLoading">
        <AppEmpty v-if="data.length === 0" />
        <Card
          :data.sync="data"
          @onDetail="onDetail"
          @onEdit="onEdit"
          @onDelete="onDelete"
          @onUpdateCover="openUpdateCover"
          @onQrCode="onOpenQrCode"
        />
      </div>
      <div
        class="width width-100 display-flex flex-end align-center padding padding-top-15px"
      >
        <div class="fonts fonts-10 normal black">Total {{ totalRecord }}</div>
        <el-pagination
          background
          @current-change="handleCurrentChange"
          :current-page.sync="currentPage"
          :page-size.sync="limit"
          :pager-count="5"
          layout="prev, pager, next"
          :total="totalRecord"
        >
        </el-pagination>
      </div>
    </div>

    <div v-if="isPrivateInvitation" class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white box-shadow display-flex align-center flex-end"
      >
        <button class="btn btn-main btn-full" @click="openFormPopup('create')">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Tambah Reservasi
        </button>
      </div>
    </div>

    <Form
      :visibleForm="visibleForm"
      :typeForm="typeForm"
      @onSave="saveFormPopup"
      @onClose="closeFormPopup"
      @onUpdateCover="openUpdateCover"
    />

    <AppPopupConfirmed
      v-if="visibleConfirmedUpdateCover"
      :title="titleConfirmedUpdateCover"
      @onClickNo="onClickNoUpdateCover"
      @onClickYes="onClickYesUpdateCover"
    />

    <AppPopupConfirmed
      v-if="visibleConfirmed"
      :title="titleConfirmed"
      @onClickNo="onClickNo"
      @onClickYes="onClickYes"
    />

    <AppPopupAlert
      v-if="visibleAlert"
      :title="titleAlert"
      :icon="iconAlert"
      @onClickOk="onClickOk"
    />

    <AppPopupLoader v-if="visibleLoader" title="Mohon Tunggu ..." />

    <AppPopupQrCode
      v-if="visibleQrCode"
      :code="`${initUrl}/${invitation.short_link}/${form.guest_id}`"
      @onClose="onCloseQrCode"
    />

    <FormBulkUpload
      v-if="visibleBulkUpload"
      @onClose="onShowHideBulkUpload"
      @onSuccess="onChangeTabs(0)"
    />

    <FormBulkDownload
      v-if="visibleBulkDownload"
      @onClose="onShowHideBulkDownload"
    />
  </div>
</template>
<script>
import { mapState, mapActions, mapGetters } from 'vuex'
import AppPopupConfirmed from '../../../modules/AppPopupConfirmed'
import AppPopupAlert from '../../../modules/AppPopupAlert'
import AppPopupLoader from '../../../modules/AppPopupLoader'
import AppTabs from '../../../modules/AppTabs'
import AppEmpty from '../../../modules/AppEmpty'
import AppPopupQrCode from '../../../modules/AppPopupQrCode'
import Form from './Form'
import Card from './Card'
import FormBulkUpload from './FormBulkUpload'
import FormBulkDownload from './FormBulkDownload'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan - Buku Tamu',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      selectedCover: null,
      selectedData: null,
      typeForm: 'create',
      visibleBulkUpload: false,
      visibleBulkDownload: false,
      visibleQrCode: false,
      visibleUpdateCover: false,
      visibleConfirmedUpdateCover: false,
      titleConfirmedUpdateCover: '',
      isAlertSuccess: false,
      visibleForm: false,
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: '',
      titleAlert: '',
      iconAlert: '',
      currentPage: 0,
      selectedIndex: 0,
      selectedBride: '',
      selectedSchedule: '',
      tabs: [
        { id: 1, label: 'Semua', status: 'active' },
        { id: 2, label: 'Akan Hadir', status: '' },
        { id: 3, label: 'Tidak Hadir', status: '' },
        { id: 4, label: 'Menunggu', status: '' },
      ],
    }
  },
  mounted() {
    this.resetFilter()
    this.getDataQuantity()
    this.getDataBride()
    this.getDataSchedule()
    this.getData()
  },
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppTabs,
    AppEmpty,
    AppPopupQrCode,
    Form,
    Card,
    FormBulkUpload,
    FormBulkDownload,
  },
  computed: {
    ...mapState({
      form: (state) => state.customerReservationLists.form,
      formFilter: (state) => state.customerReservationLists.filter,
      isGridView: (state) => state.customerReservationLists.isGridView,
      dataGuestMetrics: (state) =>
        state.customerReservationLists.dataGuestMetrics,
      data: (state) => state.customerReservationLists.data,
      dataBride: (state) => state.customerReservationLists.bride.data,
      dataSchedule: (state) => state.customerReservationLists.schedule.data,
      totalRecord: (state) => state.customerReservationLists.totalRecord,
      limit: (state) => state.customerReservationLists.limit,
      offset: (state) => state.customerReservationLists.offset,
      visibleLoading: (state) => state.customerReservationLists.loading,
      visibleLoadMore: (state) => state.customerReservationLists.loadMore,
    }),
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
    invitationId() {
      return this.$route.params.id
    },
    invitationStoreId() {
      return this.invitationData.id
    },
    invitation() {
      return this.invitationData
    },
    isPrivateInvitation() {
      return this.invitation.privacy === 'private'
    },
    isGoldInvitation() {
      return (
        this.invitation.type === 'diamond' ||
        this.invitation.type === 'platinum'
      )
    },
    isPresent() {
      let rest = 'present'
      switch (this.selectedIndex) {
        case 0:
          rest = ''
          break
        case 1:
          rest = 'will-present'
          break
        case 2:
          rest = 'not-present'
          break
        case 3:
          rest = 'waiting-response'
          break
      }
      return rest
    },
    totalGuest() {
      let total = 0
      this.dataGuestMetrics.map((item) => {
        total += parseInt(item.quantity)
      })
      return total
    },
    titleWaringTotalGuest() {
      let title = ''
      let type = this.invitation.type
      if (type === 'silver') {
        title =
          'Limit pencatatan tamu undangan untuk paket "Silver" hanya 200 orang. Lakukan upgrade paket untuk memasukan lebih banyak tamu undangan.'
      }
      if (type === 'bronze') {
        title =
          'Limit pencatatan tamu undangan untuk paket "Bronze" hanya 50 orang. Lakukan upgrade paket untuk memasukan lebih banyak tamu undangan.'
      }
      return title
    },
    enableWaringTotalGuest() {
      let status = false
      let type = this.invitation.type
      if (type === 'silver' || type === 'bronze') {
        status = true
      }
      return status
    },
  },
  methods: {
    ...mapActions({
      getGuests: 'customerReservationLists/getData',
      getBrides: 'customerReservationLists/getDataBride',
      getSchedules: 'customerReservationLists/getDataSchedule',
      getQuantity: 'customerReservationLists/getQuantity',
      createData: 'customerReservationLists/createData',
      updateData: 'customerReservationLists/updateData',
      deleteData: 'customerReservationLists/deleteData',
      uploadCover: 'customerReservationLists/uploadCover',
      setPagination: 'customerReservationLists/setPagination',
      setFormData: 'customerReservationLists/setFormData',
      resetFormData: 'customerReservationLists/resetFormData',
      resetFilter: 'customerReservationLists/resetFilter',
    }),
    changeGridView() {
      this.onChangeGridView(!this.isGridView)
    },
    onShowHideBulkUpload() {
      this.visibleBulkUpload = !this.visibleBulkUpload
    },
    onShowHideBulkDownload() {
      this.visibleBulkDownload = !this.visibleBulkDownload
    },

    // SAVE DATA
    saveData() {
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      const params = {
        ...this.form,
        invitation_id: this.invitationStoreId,
        token: token,
      }
      if (this.typeForm === 'create') {
        this.createData(params)
          .then((res) => {
            const data = res.data
            if (data.status === 'ok') {
              this.isAlertSuccess = true
              this.$message('Data tamu berhasil di simpan !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data tamu gagal di simpan !',
                'far fa-4x fa-times-circle'
              )
            }
          })
          .finally(() => {
            this.visibleLoader = false
            this.onClickNo()
          })
      }
      if (this.typeForm === 'edit') {
        this.updateData(params)
          .then((res) => {
            const data = res.data
            if (data.status === 'ok') {
              this.isAlertSuccess = true
              this.$message('Data tamu berhasil di update !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data tamu gagal di simpan !',
                'far fa-4x fa-times-circle'
              )
            }
          })
          .finally(() => {
            this.visibleLoader = false
            this.onClickNo()
          })
      }
      if (this.typeForm === 'delete') {
        this.deleteData(params)
          .then((res) => {
            const data = res.data
            if (data.status === 'ok') {
              this.isAlertSuccess = true
              this.$message('Data tamu berhasil di hapus !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data tamu gagal di hapus !',
                'far fa-4x fa-times-circle'
              )
            }
          })
          .finally(() => {
            this.visibleLoader = false
            this.onClickNo()
          })
      }
    },

    // LIST DATA
    getDataBride() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getBrides({
        token: token,
        id: this.invitationId,
      })
    },
    getDataSchedule() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getSchedules({
        token: token,
        id: this.invitationId,
      })
    },
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getGuests({
        token: token,
        id: this.invitationId,
        present_type: this.isPresent,
        bride_id: this.selectedBride,
        reservation_schedule_id: this.selectedSchedule,
      })
    },
    getDataQuantity() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getQuantity({
        token: token,
        id: this.invitationId,
      })
    },
    handleCurrentChange(value) {
      this.setPagination(value)
      this.getData()
    },
    handleFilterSearch() {
      this.currentPage = 1
      this.handleCurrentChange(1)
    },
    onChangeTabs(data) {
      this.selectedIndex = data
      this.currentPage = 1
      this.handleCurrentChange(1)
    },

    // EDIT
    onEdit(data) {
      this.openFormPopup('edit', data)
    },

    // DETAIL
    onDetail(data) {
      this.openFormPopup('detail', data)
    },

    // DELETE
    onDelete(data) {
      this.typeForm = 'delete'
      this.openConfirmedPopup('Hapus data tamu ?')
      this.setFormData(data)
    },

    // ALERT POPUP
    openAlertPopup(title = '', icon = '') {
      this.visibleAlert = true
      this.titleAlert = title
      this.iconAlert = icon
    },
    onClickNo() {
      this.visibleConfirmed = false
    },

    // CONFIRMED POPUP
    openConfirmedPopup(title = '') {
      this.visibleConfirmed = true
      this.titleConfirmed = title
    },
    onClickYes() {
      this.onClickNo()
      this.saveData()
    },
    onClickOk() {
      this.visibleAlert = false
      if (this.isAlertSuccess) {
        this.closeFormPopup()
        this.getDataQuantity()
        this.getData()
      }
    },

    // FORM
    openFormPopup(type = '', data = '') {
      this.visibleForm = true
      this.typeForm = type
      this.resetFormData()
      this.setFormData(data)
    },
    closeFormPopup() {
      this.visibleForm = false
    },
    saveFormPopup() {
      this.openConfirmedPopup('Simpan data tamu ?')
    },

    // COVER
    openUpdateCover() {
      console.log('openUpdateCover')
    },

    // QR CODE
    onOpenQrCode(data) {
      this.setFormData(data)
      this.visibleQrCode = true
    },
    onCloseQrCode() {
      this.visibleQrCode = false
    },
  },
}
</script>
