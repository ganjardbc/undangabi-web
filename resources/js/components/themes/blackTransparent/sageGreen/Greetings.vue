<template>
  <div id="App">
    <div
      :class="`display-popup bg-white bg-image theme-greeting-popup ${visible ? 'show' : 'hide'}`"
      :style="`background-image: url(${coverImage});`"
    >
      <div class="theme-transparent theme-inner-shadow">
        <div class="theme-greeting-cover bottom-fixed">
          <div
            class="theme-greeting-caption border-radius"
            :style="`background-color: ${customBackgroundColor};`"
          >
            <div class="theme-greeting-left">
              <div
                class="fonts fonts-14 fonts-mobile-12 white center normal QuicksandRegular"
              >
                THE WEDDING OF
              </div>
              <h1
                class="fonts fonts-34 fonts-mobile-28 white center weight-normal CormorantGaramondRegular"
                :style="`color: ${customMainTextColor};`"
              >
                {{ data.invitation.title }}
              </h1>
              <div v-if="guestName" class="margin margin-top-10px">
                <div
                  class="fonts fonts-14 fonts-mobile-12 white center capitalize normal QuicksandRegular"
                  :style="`color: ${customPrimaryTextColor};`"
                >
                  Kepada Yth, Bapak/Ibu/Saudara/i :
                </div>
                <div>
                  <span
                    class="fonts fonts-14 fonts-mobile-12 white center capitalize normal QuicksandRegular"
                    :style="`color: ${customPrimaryTextColor};`"
                    >{{ guestName }}</span
                  >
                  <span
                    v-if="guestAddress"
                    class="fonts fonts-14 fonts-mobile-12 white center capitalize normal QuicksandRegular"
                    :style="`color: ${customPrimaryTextColor};`"
                    >, {{ guestAddress }}</span
                  >
                </div>
              </div>
            </div>
            <div class="theme-greeting-right">
              <button
                @click="onClick"
                class="btn btn-main fonts fonts-12 QuicksandRegular"
                :style="`background-color: ${customButtonColor}; border-color: ${customButtonColor}; color: ${customButtonTextColor};`"
              >
                Lihat Undangan
                <i class="icn icn-right fa fa-lw fa-envelope-open" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import axios from 'axios'
import AppCardProKes from '../../../modules/AppCardProKes'
import AppImageBorder from '../../../modules/AppImageBorder'
import AppBorderTop from '../../../modules/AppBorderTop'
import AppBorderCircle from '../../../modules/AppBorderCircle'
import AppCardVideo from '../../../modules/AppCardVideo'

export default {
  name: 'App',
  data() {
    return {
      dataBizpar: [],
    }
  },
  mounted() {
    if (this.invitationType !== 'bronze') {
      document.body.style.overflowY = 'hidden'
    }
    if (this.data.guest) {
      this.getDataBizpar()
    }
  },
  components: {
    AppCardProKes,
    AppImageBorder,
    AppBorderTop,
    AppBorderCircle,
    AppCardVideo,
  },
  props: {
    onClick: {
      type: Function,
      required: true,
    },
    customMainColor: {
      default: null,
    },
    customMainTextColor: {
      default: '#50607D',
    },
    customPrimaryTextColor: {
      default: '#50607D',
    },
    customBackgroundColor: {
      default: '#fff',
    },
    customPrimaryColor: {
      default: '#fff',
    },
    customButtonColor: {
      default: '#fff',
    },
    customButtonTextColor: {
      default: '#50607D',
    },
    visible: {
      default: true,
    },
  },
  computed: {
    ...mapState({
      data: (state) => state.guestInvitation.data,
    }),
    guestName() {
      return this.data && this.data.guest && this.data.guest.name
    },
    guestAddress() {
      return this.data && this.data.guest && this.data.guest.address
    },
    invitationType() {
      return this.data.invitation.type
    },
    coverImage() {
      return this.data.invitation.cover
        ? this.invitationImageCoverUrl + this.data.invitation.cover
        : ''
    },
  },
  methods: {
    async getDataBizpar() {
      const payload = {
        limit: 1000,
        offset: 0,
        type: 'rsvp',
      }

      const rest = await axios.post('/api/public/getBizparByType', payload)

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.dataBizpar = data
      }
    },
  },
}
</script>
