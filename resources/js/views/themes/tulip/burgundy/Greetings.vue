<template>
  <div id="App">
    <div
      :class="`display-popup theme-greeting-popup ${visible ? 'show' : 'hide'}`"
      :style="`background-color: ${customMainColor};`"
    >
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="300px"
        :enableSizeMobile="true"
        customImageBottomRight="/images/tulip-right-gold.png"
      />
      <div class="theme-greeting-cover">
        <div class="theme-greeting-caption">
          <div class="theme-greeting-left">
            <div
              :class="`fonts fonts-14 fonts-mobile-12 white center normal ${customPrimaryFont ? customPrimaryFont : ''} margin margin-bottom-15px`"
            >
              UNDANGAN PERNIKAHAN
            </div>
            <h1
              :class="`fonts fonts-42 fonts-mobile-34 white center weight-normal ${customMainFont ? customMainFont : ''}`"
              :style="`color: ${customPrimaryColor ? customPrimaryColor : '#fff'};`"
            >
              {{ data.invitation.title }}
            </h1>
            <div v-if="guestName" class="margin margin-top-15px">
              <div
                :class="`fonts fonts-14 fonts-mobile-12 white center capitalize normal ${customPrimaryFont ? customPrimaryFont : ''} margin margin-bottom-15px`"
              >
                Kepada Yth, Bapak/Ibu/Saudara/i :
              </div>
              <div
                :class="`fonts fonts-18 fonts-mobile-16 white center capitalize normal ${customPrimaryFont ? customPrimaryFont : ''}`"
              >
                {{ guestName }}
              </div>
              <div
                v-if="guestAddress"
                :class="`fonts fonts-14 fonts-mobile-12 white center capitalize normal ${customPrimaryFont ? customPrimaryFont : ''}`"
              >
                {{ guestAddress }}
              </div>
            </div>
          </div>
          <div class="theme-greeting-right">
            <button
              @click="onClick"
              :class="`btn btn-main fonts fonts-12 ${customPrimaryFont ? customPrimaryFont : ''}`"
              :style="`
                background-color: ${customPrimaryColor ? customPrimaryColor : '#50607D'}; 
                border-color: ${customPrimaryColor ? customPrimaryColor : '#50607D'}; 
                color: ${customMainColor ? customMainColor : '#fff'};`"
            >
              Lihat Undangan
              <i class="icn icn-right fa fa-lw fa-envelope-open" />
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import axios from 'axios'
import logo from '../../../../../img/logo.png'
import AppCardProKes from '../../../../components/modules/AppCardProKes'
import AppImageBorder from '../../../../components/modules/AppImageBorder'
import AppBorderTop from '../../../../components/modules/AppBorderTop'
import AppBorderCircle from '../../../../components/modules/AppBorderCircle'
import AppCardVideo from '../../../../components/modules/AppCardVideo'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
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
    customMainFont: {
      default: null,
    },
    customPrimaryFont: {
      default: null,
    },
    customMainColor: {
      default: null,
    },
    customMainTextColor: {
      default: null,
    },
    customBackgroundColor: {
      default: null,
    },
    customPrimaryColor: {
      default: null,
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
