<template>
  <div id="App">
    <AppBreadCrumb title="Cover & Galeri Foto" />
    <div v-if="isBronzeInvitation" class="width w-full">
      <AppEmpty
        title="Upgrade paket ke 'Gold' atau 'Silver' agar dapat menggunakan fitur ini."
      />
    </div>
    <div v-if="isGoldInvitation || isSilverInvitation" class="width w-full">
      <div class="width w-full p-4 pt-[15px] pb-[15px]">
        <el-input
          placeholder="Cari cover atau galeri"
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
      <div class="width w-full margin margin-bottom-20px">
        <AppTabs
          :selectedIndex="selectedIndex"
          :data="tabs"
          :isFull="true"
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
        />
      </div>
      <div
        class="width w-full flex justify-end items-center p-4 pt-[15px]"
      >
        <div class="text-[10px] normal text-black">Total {{ totalRecord }}</div>
        <el-pagination
          background
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-size="limit"
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
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Tambah Cover atau
          Galeri Foto
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

    <AppFileUpload
      v-if="visibleUpdateCover"
      @onClose="openUpdateCover"
      @onUpload="onUpdateCover"
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
  </div>
</template>
<script>
import { mapState, mapActions, mapGetters } from 'vuex'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import AppFileUpload from '../../../components/modules/AppFileUpload'
import AppTabs from '../../../components/modules/AppTabs'
import AppEmpty from '../../../components/modules/AppEmpty'
import AppBreadCrumb from '../../../components/modules/AppBreadCrumb'
import Form from './Form'
import Card from './Card'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan - Cover & Galeri',
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
      tabs: [
        { id: 1, label: 'Semua', status: 'active' },
        { id: 2, label: 'Cover', status: '' },
        { id: 3, label: 'Galeri Foto', status: '' },
      ],
    }
  },
  mounted() {
    this.resetFilter()
    this.getData()
  },
  components: {
    Form,
    Card,
    AppEmpty,
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppFileUpload,
    AppTabs,
    AppBreadCrumb,
  },
  computed: {
    ...mapState({
      formFilter: (state) => state.customerGallery.filter,
      form: (state) => state.customerGallery.form,
      formFilter: (state) => state.customerGallery.filter,
      isGridView: (state) => state.customerGallery.isGridView,
      data: (state) => state.customerGallery.data,
      totalRecord: (state) => state.customerGallery.totalRecord,
      limit: (state) => state.customerGallery.limit,
      offset: (state) => state.customerGallery.offset,
      visibleLoading: (state) => state.customerGallery.loading,
      visibleLoadMore: (state) => state.customerGallery.loadMore,
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
    galleryType() {
      let rest = ''
      switch (this.selectedIndex) {
        case 0:
          rest = ''
          break
        case 1:
          rest = 'cover'
          break
        case 2:
          rest = 'gallery'
          break
      }
      return rest
    },
  },
  methods: {
    ...mapActions({
      getGalleries: 'customerGallery/getData',
      createData: 'customerGallery/createData',
      updateData: 'customerGallery/updateData',
      deleteData: 'customerGallery/deleteData',
      uploadCover: 'customerGallery/uploadCover',
      setPagination: 'customerGallery/setPagination',
      setFormData: 'customerGallery/setFormData',
      resetFormData: 'customerGallery/resetFormData',
      resetFilter: 'customerGallery/resetFilter',
    }),

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
              this.$message('Data cover atau galeri berhasil di simpan !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data cover atau galeri gagal di simpan !',
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
              this.$message('Data cover atau galeri berhasil di update !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data cover atau galeri gagal di simpan !',
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
              this.$message('Data cover atau galeri berhasil di hapus !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data cover atau galeri gagal di hapus !',
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
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getGalleries({
        token: token,
        id: this.invitationId,
        type: this.galleryType,
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
      this.openConfirmedPopup('Hapus data cover atau galeri ?')
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
      this.openConfirmedPopup('Simpan data cover atau galeri ?')
    },

    // COVER
    saveCover() {
      this.visibleConfirmedUpdateCover = false
      this.visibleLoader = true

      const data = this.selectedData
      const image = this.selectedCover
      const token = `Bearer ${this.$cookies.get('token')}`
      const params = {
        gallery_id: data.gallery_id,
        image: image,
        token: token,
      }

      this.uploadCover(params)
        .then((res) => {
          if (res.data.status === 'ok') {
            this.visibleUpdateCover = false
            this.isAlertSuccess = true
            this.$message('Cover berhasil di simpan !')
            this.onClickOk()
          } else {
            this.isAlertSuccess = false
            this.openAlertPopup(
              'Cover gagal di simpan !',
              'far fa-4x fa-times-circle'
            )
          }
        })
        .finally(() => {
          this.visibleLoader = false
        })
    },
    openConfirmedPopupUpdateCover(title = '') {
      this.visibleConfirmedUpdateCover = true
      this.titleConfirmedUpdateCover = title
    },
    openUpdateCover(data = '') {
      this.selectedData = data
      this.visibleUpdateCover = !this.visibleUpdateCover
    },
    onUpdateCover(value) {
      this.selectedCover = value
      this.openConfirmedPopupUpdateCover('Update cover ?')
    },
    onClickNoUpdateCover() {
      this.visibleConfirmedUpdateCover = false
    },
    onClickYesUpdateCover() {
      this.saveCover()
    },
  },
}
</script>
