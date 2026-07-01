<template>
  <div id="App">
    <div style="position: relative" class="width width-100">
      <div class="width width-100">
        <div
          class="image image-padding image-circle bg-white box-shadow"
          :style="`
                        background-image: url(${invitationCover});
                        text-align: center;
                        border: 2px #fff solid;
                    `"
        >
          <i
            v-if="invitationData && !invitationData.profile"
            class="post-middle-absolute fonts fonts-48 light-grey fa fa-lg fa-image"
          />
        </div>
      </div>
      <div style="position: absolute; bottom: 0; right: 0">
        <button class="btn btn-sekunder btn-icon" @click="onCloseUpdateCover">
          <i class="icn fa fa-lg fa-camera"></i>
        </button>
      </div>
    </div>

    <AppFileUpload
      v-if="visibleUpdateCover"
      @onClose="onCloseUpdateCover"
      @onUpload="onUploadCover"
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
import { mapActions, mapGetters } from 'vuex'
import VueCountdown from '@chenfengyuan/vue-countdown'
import AppPopupConfirmed from '../../modules/AppPopupConfirmed'
import AppPopupAlert from '../../modules/AppPopupAlert'
import AppPopupLoader from '../../modules/AppPopupLoader'
import AppFileUpload from '../../modules/AppFileUpload'

export default {
  name: 'App',
  data() {
    return {
      selectedCover: null,
      visibleUpdateCover: false,
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: 'Update cover undangan ?',
      titleAlert: 'Data undangan berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
    }
  },
  methods: {
    ...mapActions({
      getCustomerInvitationById: 'customerInvitation/getByID',
      invitationUpdateProfile: 'customerInvitation/uploadProfile',
    }),
    onChangeTabs(data) {
      this.selectedIndex = data
    },
    onClickNo() {
      this.visibleConfirmed = false
    },
    onClickYes() {
      this.visibleConfirmed = false
      this.updateCover()
    },
    onClickOk() {
      this.visibleAlert = false
      this.getDataCustomerInvitation()
    },
    onCloseUpdateCover() {
      this.visibleUpdateCover = !this.visibleUpdateCover
    },
    onUploadCover(value) {
      this.selectedCover = value
      this.visibleConfirmed = true
      this.titleConfirmed = 'Update profile undangan ?'
    },
    getDataCustomerInvitation() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerInvitationById({
        id: this.invitationId,
        token: token,
      })
    },
    updateCover() {
      this.visibleLoader = true
      this.visibleUpdateCover = false
      const token = `Bearer ${this.$cookies.get('token')}`
      this.invitationUpdateProfile({
        id: this.invitationId,
        profile: this.selectedCover,
        token: token,
      }).then((res) => {
        if (res.data.status === 'ok') {
          this.visibleAlert = true
          this.titleAlert = 'Profile undangan berhasil di simpan !'
          this.iconAlert = 'far fa-4x fa-check-circle'
        } else {
          this.visibleAlert = true
          this.titleAlert = 'Profile undangan gagal di simpan !'
          this.iconAlert = 'far fa-4x fa-times-circle'
        }
        this.visibleLoader = false
      })
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
      const image = this.invitationData ? this.invitationData.profile : ''
      return this.invitationImageThumbnailUrl + image
    },
  },
  components: {
    VueCountdown,
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppFileUpload,
  },
}
</script>
