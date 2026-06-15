<template>
  <div id="App">
    <div class="card bg-white box-shadow">
      <div class="width width-100">
        <div class="width width-100">
          <div
            class="image image-padding"
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
        <div style="position: absolute; top: 30px; right: 30px">
          <div
            v-if="invitationData.is_free_trial"
            :class="`card-capsule ${invitationData.is_free_trial ? 'wip' : 'active'}`"
          >
            {{ invitationData.is_free_trial ? 'Free Trial' : 'Pro' }}
            <span v-if="invitationData.exp_free_trial_date > 0">
              <VueCountdown
                :time="invitationData.exp_free_trial_date"
                v-slot="{ days }"
              >
                <span> - {{ days }} Hari</span>
              </VueCountdown>
            </span>
          </div>
          <div
            v-else
            :class="`card-capsule ${invitationData.status === 'active' ? 'active' : ''}`"
            style="text-transform: capitalize"
          >
            {{ invitationData.status }}
          </div>
        </div>
      </div>
      <div class="width width-100 padding padding-top-15px padding-bottom-15px">
        <div class="display-flex">
          <div class="width width-40">
            <div class="fonts fonts-10 black">Paket</div>
          </div>
          <div class="width width-60">
            <div class="fonts fonts-10 black capitalize">
              :
              {{
                invitationData.type === 'diamond' ? 'Gold' : invitationData.type
              }}
            </div>
          </div>
        </div>
        <div class="display-flex">
          <div class="width width-40">
            <div class="fonts fonts-10 black">Status</div>
          </div>
          <div class="width width-60">
            <div class="fonts fonts-10 black capitalize">
              : {{ invitationData.status }}
            </div>
          </div>
        </div>
        <div class="display-flex">
          <div class="width width-40">
            <div class="fonts fonts-10 black">Pembayaran</div>
          </div>
          <div class="width width-60">
            <div class="fonts fonts-10 black capitalize">
              :
              {{
                invitationData.payment_status ? 'Sudah Bayar' : 'Belum Bayar'
              }}
            </div>
          </div>
        </div>
        <div v-if="invitationData.is_free_trial" class="display-flex">
          <div class="width width-40">
            <div class="fonts fonts-10 black">Free Trial</div>
          </div>
          <div class="width width-60">
            <div v-if="invitationData.exp_free_trial_date > 0">
              <VueCountdown
                :time="invitationData.exp_free_trial_date"
                v-slot="{ days }"
              >
                <div class="fonts fonts-10 black">: {{ days }} Hari</div>
              </VueCountdown>
            </div>
            <div v-else class="fonts fonts-10 black">: 0 Hari</div>
          </div>
        </div>
      </div>
      <button class="btn btn-sekunder btn-full" @click="onCloseUpdateCover">
        <i class="icn icn-left fa fa-lg fa-camera"></i> Ubah Cover
      </button>
      <div class="margin margin-top-15px">
        <AppPopupQrCodeSmall
          :code="`${initUrl}/${invitationData.short_link}`"
          :fileName="`qr-code-${invitationData.short_link}`"
          label="Undangan Digital"
          buttonLabel="QR Undangan"
        />
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
import AppPopupQrCodeSmall from '../../modules/AppPopupQrCodeSmall'

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
      return this.invitationImageThumbnailUrl + image
    },
  },
  components: {
    VueCountdown,
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppFileUpload,
    AppPopupQrCodeSmall,
  },
}
</script>
