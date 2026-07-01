<template>
  <div id="App">
    <AppBreadCrumb title="Daftar Paket" />

    <Form v-loading="invitationLoading" />

    <div class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white shadow-sm flex items-center justify-end"
      >
        <button class="btn btn-main btn-full" @click="submitData">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Simpan Paket
        </button>
      </div>
    </div>

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
import { mapActions, mapGetters } from 'vuex'
import AppTabs from '../../../components/modules/AppTabs'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import AppBreadCrumb from '../../../components/modules/AppBreadCrumb'
import Form from './Form'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      visibleUpdateCover: false,
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: 'Simpan paket ?',
      titleAlert: 'Paket berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
      selectedIndex: 0,
      tabs: [
        { id: 1, label: 'Informasi', status: 'active' },
        { id: 2, label: 'Paket', status: '' },
        { id: 3, label: 'Tema', status: '' },
        { id: 4, label: 'Lagu Latar', status: '' },
      ],
    }
  },
  mounted() {
    this.getDataCategory()
  },
  methods: {
    ...mapActions({
      getCustomerInvitationById: 'customerInvitation/getByID',
      invitationUpdateData: 'customerInvitation/updateData',
      getCategory: 'customerCategory/getData',
    }),
    onChangeTabs(data) {
      this.selectedIndex = data
    },
    onClickNo() {
      this.visibleConfirmed = false
    },
    onClickYes() {
      this.visibleConfirmed = false
      this.updateDataCustomerInvitation()
    },
    onClickOk() {
      this.visibleAlert = false
      this.getDataCustomerInvitation()
    },
    submitData() {
      this.visibleConfirmed = true
      this.titleConfirmed = 'Simpan paket ?'
    },
    onCloseUpdateCover() {
      this.visibleUpdateCover = !this.visibleUpdateCover
    },
    updateDataCustomerInvitation() {
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      this.invitationUpdateData({ token })
        .then((res) => {
          if (res.data.status === 'ok') {
            this.$message('Paket berhasil di simpan !')
          } else {
            this.visibleAlert = true
            this.titleAlert = 'Paket gagal di simpan !'
            this.iconAlert = 'far fa-4x fa-times-circle'
          }
        })
        .finally(() => {
          this.visibleLoader = false
        })
    },
    getDataCustomerInvitation() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerInvitationById({
        id: this.invitationId,
        token: token,
      })
    },
    getDataCategory() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCategory({ token: token, status: 'active' })
    },
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
      invitationLoading: 'customerInvitation/loading',
    }),
    invitationId() {
      return this.$route.params.id
    },
    invitationCover() {
      const image = this.invitationData ? this.invitationData.cover : ''
      return this.invitationImageThumbnailUrl + image
    },
  },
  components: {
    AppTabs,
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppBreadCrumb,
    Form,
  },
}
</script>
