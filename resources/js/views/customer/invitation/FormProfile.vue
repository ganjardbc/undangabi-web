<template>
  <div id="App">
    <div style="position: relative" class="w-[100px] h-[100px]">
      <div class="w-full h-full">
        <div
          class="image image-padding image-circle bg-canvas shadow-sm border-4 border-canvas overflow-hidden flex items-center justify-center"
          :style="`
                        background-image: url(${invitationCover});
                        text-align: center;
                        width: 100px;
                        height: 100px;
                    `"
        >
          <i
            v-if="invitationData && !invitationData.profile"
            class="el-icon-picture text-muted text-3xl"
          />
        </div>
      </div>
      <div style="position: absolute; bottom: 0; right: 0">
        <el-button
          icon="el-icon-camera"
          size="small"
          class="bg-canvas hover:bg-surface-card border border-hairline text-ink rounded-full w-8 h-8 flex items-center justify-center transition-colors duration-300"
          @click="onCloseUpdateCover"
        ></el-button>
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
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import AppFileUpload from '../../../components/modules/AppFileUpload'

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
