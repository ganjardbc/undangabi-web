<template>
  <div id="App">
    <AppBreadCrumb title="Youtube Video" />

    <div v-if="!isGoldInvitation" class="width width-100">
      <AppEmpty
        title="Upgrade paket ke 'Gold' agar dapat menggunakan fitur ini."
      />
    </div>

    <div v-if="isGoldInvitation" class="width width-100">
      <div
        class="card bg-white box-shadow margin margin-bottom-20px margin-top-20px"
      >
        <div class="fonts fonts-14 semibold black">Video</div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Youtube URL</div>
          <el-input v-model="form.video_link" placeholder=""></el-input>
          <div v-if="errorMessage.video_link" class="fonts fonts-12px red">
            {{ errorMessage.video_link }}
          </div>
        </div>
      </div>
      <div v-if="videoId" class="card bg-white box-shadow">
        <div class="fonts fonts-14 semibold black">Tampilan Video</div>
        <div class="width width-100 padding padding-top-15px">
          <youtube
            :video-id="videoId"
            player-width="100%"
            player-height="300"
          ></youtube>
        </div>
      </div>
    </div>

    <div v-if="isGoldInvitation" class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white box-shadow display-flex align-center flex-end"
      >
        <button class="btn btn-main btn-full" @click="submitData">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Simpan Data
          Youtube Video
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
import { getIdFromURL } from 'vue-youtube-embed'
import { mapState, mapActions, mapGetters } from 'vuex'
import AppPopupConfirmed from '../../modules/AppPopupConfirmed'
import AppPopupAlert from '../../modules/AppPopupAlert'
import AppPopupLoader from '../../modules/AppPopupLoader'
import AppEmpty from '../../modules/AppEmpty'
import AppBreadCrumb from '../../modules/AppBreadCrumb'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan - Youtube Video',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: 'Simpan data undangan ?',
      titleAlert: 'Data undangan berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
    }
  },
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppEmpty,
    AppBreadCrumb,
  },
  computed: {
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
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
    visibleMap() {
      return this.invitation.latitude && this.invitation.longitude
    },
    videoId() {
      let video = ''
      if (this.invitation.video_link) {
        video = getIdFromURL(this.invitation.video_link)
      }
      return video
    },
  },
  methods: {
    ...mapActions({
      getCustomerInvitationById: 'customerInvitation/getByID',
      invitationUpdateData: 'customerInvitation/updateData',
    }),
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
      this.titleConfirmed = 'Simpan data Youtube Video ?'
    },
    updateDataCustomerInvitation() {
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      this.invitationUpdateData({ token })
        .then((res) => {
          if (res.data.status === 'ok') {
            this.$message('Data Youtube Video berhasil di simpan !')
          } else {
            this.visibleAlert = true
            this.titleAlert = 'Data Youtube Video gagal di simpan !'
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
  },
}
</script>
