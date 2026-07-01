<template>
  <div id="App">
    <div style="position: relative" class="width width-100">
      <div class="width width-100">
        <div
          class="image image-half-padding bg-white box-shadow ci-image-cover"
          :style="`
                        background-image: url(${invitationCover});
                        text-align: center;
                    `"
        >
          <i
            v-if="invitationData && !invitationData.cover"
            class="post-middle-absolute fonts fonts-48 light-grey fa fa-lg fa-image"
          />
        </div>
      </div>
      <div style="position: absolute; top: 15px; right: 15px">
        <button class="btn btn-sekunder" @click="onCloseUpdateCover">
          <i class="icn icn-left fa fa-lg fa-camera"></i> Update Cover
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
      invitationUpdateCover: 'customerInvitation/uploadCover',
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
      this.titleConfirmed = 'Update cover undangan ?'
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
      this.invitationUpdateCover({
        id: this.invitationId,
        cover: this.selectedCover,
        token: token,
      }).then((res) => {
        if (res.data.status === 'ok') {
          this.visibleAlert = true
          this.titleAlert = 'Cover undangan berhasil di simpan !'
          this.iconAlert = 'far fa-4x fa-check-circle'
        } else {
          this.visibleAlert = true
          this.titleAlert = 'Cover undangan gagal di simpan !'
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
      const image = this.invitationData ? this.invitationData.cover : ''
      return this.invitationImageCoverUrl + image
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
