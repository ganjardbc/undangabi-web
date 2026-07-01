<template>
  <div id="App">
    <div v-if="isBronzeInvitation" class="width w-full">
      <div
        class="flex justify-between items-center p-4 padding-bottom-10px"
      >
        <div class="text-[22px] font-semibold text-black">Buku Tamu</div>
      </div>
      <AppEmpty
        title="Upgrade paket ke 'Gold' atau 'Silver' agar dapat menggunakan fitur ini."
      />
    </div>
    <div v-if="isGoldInvitation || isSilverInvitation" class="width w-full">
      <div
        class="flex justify-between items-center p-4 padding-bottom-10px"
      >
        <div class="text-[22px] font-semibold text-black">Buku Tamu</div>
        <div class="flex justify-end">
          <button
            class="btn btn-white btn-icon"
            @click="onShowHideBulkDownload"
          >
            <i class="fa fa-lw fa-cloud-download-alt" />
          </button>
          <button
            v-if="isPrivateInvitation"
            class="btn btn-sekunder margin margin-left-10px"
            @click="onCloseScannerDialog"
          >
            <i class="icn icn-left fa fa-lg fa-qrcode"></i> Scan
          </button>
        </div>
      </div>
      <div
        class="width w-full flex justify-between p-4 pb-[15px]"
      >
        <div class="text-[11px] font-semibold text-black">Tamu Hadir</div>
        <div class="text-[11px] font-semibold text-black">
          {{ dataGuestMetrics.totalPresent }} Orang
        </div>
      </div>
      <div class="width w-full p-4 pb-[15px]">
        <el-input
          placeholder="Cari buku tamu"
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
        class="width w-full flex justify-end items-center p-4 pt-[15px]"
      >
        <div class="text-[10px] normal text-black">Total {{ totalRecord }}</div>
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

    <div
      v-if="isGoldInvitation || isSilverInvitation"
      class="invitation-main-footer"
    >
      <div
        class="invitation-main-footer-container bg-white shadow-sm flex items-center justify-end"
      >
        <button class="btn btn-main btn-full" @click="openFormPopup('create')">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Tambah Buku Tamu
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

    <ScannerDialog
      v-if="visibleScannerDialog"
      @onSuccess="onSuccesScannerDialog"
      @onClose="onCloseScannerDialog"
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

    <FormBulkDownload
      v-if="visibleBulkDownload"
      @onClose="onShowHideBulkDownload"
    />
  </div>
</template>
<script>
import { mapState, mapActions, mapGetters } from 'vuex'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import AppEmpty from '../../../components/modules/AppEmpty'
import AppPopupQrCode from '../../../components/modules/AppPopupQrCode'
import Form from './Form'
import Card from './Card'
import ScannerDialog from './ScannerDialog'
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
      visibleBulkDownload: false,
      visibleQrCode: false,
      visibleScannerDialog: false,
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
    }
  },
  mounted() {
    this.resetFilter()
    this.getDataQuantity()
    this.getData()
  },
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppEmpty,
    AppPopupQrCode,
    Form,
    Card,
    ScannerDialog,
    FormBulkDownload,
  },
  computed: {
    ...mapState({
      form: (state) => state.customerGuestBook.form,
      formFilter: (state) => state.customerGuestBook.filter,
      isGridView: (state) => state.customerGuestBook.isGridView,
      dataGuestMetrics: (state) => state.customerGuestBook.dataGuestMetrics,
      data: (state) => state.customerGuestBook.data,
      totalRecord: (state) => state.customerGuestBook.totalRecord,
      limit: (state) => state.customerGuestBook.limit,
      offset: (state) => state.customerGuestBook.offset,
      visibleLoading: (state) => state.customerGuestBook.loading,
      visibleLoadMore: (state) => state.customerGuestBook.loadMore,
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
    isBronzeInvitation() {
      return this.invitation.type === 'bronze'
    },
    isSilverInvitation() {
      return this.invitation.type === 'silver'
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
          rest = 'present'
          break
        case 2:
          rest = 'will-present'
          break
        case 3:
          rest = 'not-present'
          break
        case 4:
          rest = 'waiting-response'
          break
      }
      return rest
    },
    totalGuest() {
      return this.totalRecord
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
    enableCreateButton() {
      let total = this.totalGuest
      let status = false
      let type = this.invitation.type
      if (type === 'diamond' || type === 'platinum') {
        status = true
      } else {
        if (type === 'silver') {
          if (total >= 200) {
            status = false
          } else {
            status = true
          }
        }
        if (type === 'bronze') {
          if (total >= 50) {
            status = false
          } else {
            status = true
          }
        }
      }
      return status
    },
  },
  methods: {
    ...mapActions({
      getGuests: 'customerGuestBook/getData',
      getQuantity: 'customerGuestBook/getQuantity',
      createData: 'customerGuestBook/createData',
      updateData: 'customerGuestBook/updateData',
      deleteData: 'customerGuestBook/deleteData',
      uploadCover: 'customerGuestBook/uploadCover',
      setPagination: 'customerGuestBook/setPagination',
      setFormData: 'customerGuestBook/setFormData',
      resetFormData: 'customerGuestBook/resetFormData',
      resetFilter: 'customerGuestBook/resetFilter',
    }),
    changeGridView() {
      this.onChangeGridView(!this.isGridView)
    },
    onShowHideBulkDownload() {
      this.visibleBulkDownload = !this.visibleBulkDownload
    },

    // SCANNER DIALOG
    onCloseScannerDialog() {
      this.visibleScannerDialog = !this.visibleScannerDialog
    },
    onSuccesScannerDialog() {
      this.getDataQuantity()
      this.getData()
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
              this.$message('Data buku tamu berhasil di simpan !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data buku tamu gagal di simpan !',
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
              this.$message('Data buku tamu berhasil di update !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data buku tamu gagal di simpan !',
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
              this.$message('Data buku tamu berhasil di hapus !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data buku tamu gagal di hapus !',
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
    getDataQuantity() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getQuantity({
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
      this.openConfirmedPopup('Hapus data buku tamu ?')
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
      this.openConfirmedPopup('Simpan data buku tamu ?')
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
