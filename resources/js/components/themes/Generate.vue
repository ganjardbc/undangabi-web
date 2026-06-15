<template>
  <div id="App">
    <div v-if="loading" class="display-popup bg-main">
      <div class="card-alert box-shadow post-middle" style="padding: 0">
        <div style="padding: 15px">
          <div class="width width-80 width-center">
            <div
              class="image image-half-padding"
              style="background-color: #fff; padding-bottom: 40%"
            >
              <img :src="logo" alt="" />
            </div>
          </div>
          <AppLoader />
        </div>
      </div>
    </div>
    <div v-else>
      <div v-if="!isCanViewTheme" class="display-popup bg-main">
        <div class="post-middle-absolute width width-600px width-mobile">
          <div class="padding padding-15px">
            <div class="card box-shadow bg-white">
              <AppEmpty
                title="Undangan Private"
                description="Undangan ini untuk tamu private, hubungi pemilik Undangan untuk mendaftarkan tamu."
              />
            </div>
          </div>
        </div>
      </div>

      <div v-if="isCanViewTheme">
        <ChooseTheme v-if="data" />

        <div v-else class="display-popup bg-main">
          <div class="post-middle-absolute width width-600px width-mobile">
            <div class="padding padding-15px">
              <div class="card box-shadow bg-white">
                <AppEmpty title="404" description="Undangan tidak ditemukan." />
              </div>
            </div>
          </div>
        </div>

        <div v-if="!isPaymented && visiblePopup" class="display-popup">
          <div class="post-middle-absolute width width-600px width-mobile">
            <div class="padding padding-15px">
              <div class="card box-shadow bg-white">
                <div class="display-flex space-between align-center">
                  <div class="fonts fonts-11 semibold black">Pemberitahuan</div>
                  <button
                    class="btn btn-white btn-icon"
                    @click="visiblePopup = false"
                  >
                    <i class="fa fa-lg fa-times"></i>
                  </button>
                </div>
                <div class="width width-100">
                  <AppEmpty
                    title="Undangan Belum Dibayar"
                    description="Segera lakukan pembayaran untuk undangan ini sebelum di Non-Aktifkan oleh Admin."
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions, mapState } from 'vuex'
import VueCountdown from '@chenfengyuan/vue-countdown'
import ChooseTheme from './ChooseTheme'
import AppLoader from '../modules/AppLoader'
import AppEmpty from '../modules/AppEmpty'
import AppCardFreeTrial from '../modules/AppCardFreeTrial'
import logo from '../../../img/logo.png'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
      visiblePopup: true,
    }
  },
  created() {
    window.onerror = null
  },
  mounted() {
    const short_link = this.$route.params.id
    const guest_id = this.$route.params.guestId
    this.getData(short_link, guest_id)
    this.$gtag.event(`invitation-${short_link}`, { method: 'Google' })
  },
  components: {
    ChooseTheme,
    AppLoader,
    AppEmpty,
    AppCardFreeTrial,
    VueCountdown,
  },
  computed: {
    ...mapState({
      loading: (state) => state.guestInvitation.loading,
      data: (state) => state.guestInvitation.data,
      guest: (state) => state.guestInvitation.data.guest,
    }),
    isFreeTrial() {
      return (
        this.data && this.data.invitation && this.data.invitation.is_free_trial
      )
    },
    isPaymented() {
      return (
        this.data && this.data.invitation && this.data.invitation.payment_status
      )
    },
    isPrivateInvitation() {
      return (
        this.data &&
        this.data.invitation &&
        this.data.invitation.privacy === 'private'
      )
    },
    isPublicInvitation() {
      return (
        this.data &&
        this.data.invitation &&
        this.data.invitation.privacy === 'public'
      )
    },
    isThereGuestInPrivate() {
      let status = false
      const guest_id = this.$route.params.guestId
      if (this.isPrivateInvitation && guest_id) {
        status = true
      }
      return status
    },
    isCanViewTheme() {
      let status = true
      if (this.isPrivateInvitation) {
        status = this.isThereGuestInPrivate
      }
      return status
    },
    expFreeTrialDate() {
      return (
        this.data &&
        this.data.invitation &&
        this.data.invitation.exp_free_trial_date
      )
    },
  },
  methods: {
    ...mapActions({
      getInvitation: 'guestInvitation/getData',
    }),
    setGuest() {
      const guestName = this.$route.query.to
      if (guestName) {
        this.guest.name = guestName
        this.guest.present_type = 'not-present'
      }
    },
    getData(short_link, guest_id) {
      let payload = {
        short_link: short_link,
        guest_id: guest_id,
      }
      this.getInvitation(payload)
        .then((res) => {
          const data = res.data.data
          if (!data.guest) {
            this.setGuest()
          }
        })
        .catch((e) => {
          this.$router.push({ name: '404WEB' })
        })
    },
  },
}
</script>
