<template>
  <div id="App">
    <AppBreadCrumb title="Pengantin" />

    <div v-if="!invitationCategory" class="width width-100">
      <AppEmpty title="Fitur ini hanya untuk undangan Pernikahan." />
    </div>

    <div v-if="invitationCategory">
      <div class="width width-100 padding padding-top-15px padding-bottom-15px">
        <el-input
          placeholder="Cari pengantin"
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

    <div v-if="invitationCategory" class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white box-shadow display-flex align-center flex-end"
      >
        <button class="btn btn-main btn-full" @click="openFormPopup('create')">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Tambah Pengantin
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
import AppPopupConfirmed from '../../modules/AppPopupConfirmed'
import AppPopupAlert from '../../modules/AppPopupAlert'
import AppPopupLoader from '../../modules/AppPopupLoader'
import AppFileUpload from '../../modules/AppFileUpload'
import AppEmpty from '../../modules/AppEmpty'
import AppBreadCrumb from '../../modules/AppBreadCrumb'
import Form from './Form'
import Card from './Card'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan - Pengantin',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      selectedCover: null,
      selectedData: null,
      currentPage: 0,
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
    AppBreadCrumb,
  },
  computed: {
    ...mapState({
      form: (state) => state.customerBrides.form,
      formFilter: (state) => state.customerBrides.filter,
      isGridView: (state) => state.customerBrides.isGridView,
      data: (state) => state.customerBrides.data,
      totalRecord: (state) => state.customerBrides.totalRecord,
      limit: (state) => state.customerBrides.limit,
      offset: (state) => state.customerBrides.offset,
      visibleLoading: (state) => state.customerBrides.loading,
      visibleLoadMore: (state) => state.customerBrides.loadMore,
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
    invitationCategory() {
      const category = this.invitationData && this.invitationData.category_id
      return category === 1 || category === 9
    },
  },
  methods: {
    ...mapActions({
      getBrides: 'customerBrides/getData',
      createData: 'customerBrides/createData',
      updateData: 'customerBrides/updateData',
      deleteData: 'customerBrides/deleteData',
      uploadCover: 'customerBrides/uploadCover',
      setPagination: 'customerBrides/setPagination',
      setFormData: 'customerBrides/setFormData',
      resetFormData: 'customerBrides/resetFormData',
      resetFilter: 'customerBrides/resetFilter',
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
              this.$message('Data pengantin berhasil di simpan !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data pengantin gagal di simpan !',
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
              this.$message('Data pengantin berhasil di update !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data pengantin gagal di simpan !',
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
              this.$message('Data pengantin berhasil di hapus !')
              this.onClickOk()
            } else {
              this.isAlertSuccess = false
              this.openAlertPopup(
                'Data pengantin gagal di hapus !',
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
      this.getBrides({
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
      this.openConfirmedPopup('Hapus data pengantin ?')
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
      this.openConfirmedPopup('Simpan data pengantin ?')
    },

    // COVER
    saveCover() {
      this.visibleConfirmedUpdateCover = false
      this.visibleLoader = true

      const data = this.selectedData
      const image = this.selectedCover
      const token = `Bearer ${this.$cookies.get('token')}`
      const params = {
        bride_id: data.bride_id,
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
