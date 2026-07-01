<template>
  <div id="App" v-loading="invitationLoading">
    <div class="width w-full width-mobile margin margin-bottom-20-px">
      <AppTabs
        :selectedIndex="selectedIndex"
        :data="tabs"
        :isFull="true"
        :onChange="(data) => onChangeTabs(data)"
      />
    </div>
    <div
      v-if="selectedIndex === 0"
      class="flex justify-between display-mobile"
    >
      <div
        class="width width-30 width-mobile p-4 padding-bottom-20px"
      >
        <FormCover />
      </div>
      <div
        class="width width-70 width-mobile p-4 padding-left-20px padding-mobile"
      >
        <Form />
      </div>
    </div>

    <FormPacket v-if="selectedIndex === 1" />
    <FormTheme v-if="selectedIndex === 2" />
    <FormSong v-if="selectedIndex === 3" />

    <div class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white shadow-sm flex items-center justify-end"
      >
        <button class="btn btn-main btn-full" @click="submitData">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Simpan Undangan
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
import Form from './Form'
import FormPacket from './FormPacket'
import FormTheme from './FormTheme'
import FormSong from './FormSong'
import FormCover from './FormCover'

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
      titleConfirmed: 'Simpan data undangan ?',
      titleAlert: 'Data undangan berhasil di simpan !',
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
      this.titleConfirmed = 'Simpan data undangan ?'
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
            this.$message('Data undangan berhasil di simpan !')
          } else {
            this.visibleAlert = true
            this.titleAlert = 'Data undangan gagal di simpan !'
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
    Form,
    FormPacket,
    FormTheme,
    FormSong,
    FormCover,
  },
}
</script>
