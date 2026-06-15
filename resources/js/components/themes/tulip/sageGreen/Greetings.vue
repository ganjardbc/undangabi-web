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
        customImageBottomRight="/images/tulip-right.png"
      />
      <div class="theme-greeting-cover">
        <div class="theme-greeting-caption">
          <div class="theme-greeting-left">
            <div
              class="fonts fonts-14 fonts-mobile-12 white center normal Lora margin margin-bottom-15px"
              :style="`color: #fff;`"
            >
              UNDANGAN PERNIKAHAN
            </div>
            <h1
              :class="`fonts fonts-42 fonts-mobile-34 white center weight-normal ${customMainFont ? customMainFont : ''}`"
              :style="`color: #E7DBB6;`"
            >
              {{ data.invitation.title }}
            </h1>
            <div v-if="guestName" class="margin margin-top-15px">
              <div
                class="fonts fonts-14 fonts-mobile-12 white center capitalize normal Lora margin margin-bottom-15px"
                :style="`color: #fff;`"
              >
                Kepada Yth, Bapak/Ibu/Saudara/i :
              </div>
              <div
                class="fonts fonts-18 fonts-mobile-16 white center capitalize normal Lora"
                :style="`color: #fff;`"
              >
                {{ guestName }}
              </div>
              <div
                v-if="guestAddress"
                class="fonts fonts-14 fonts-mobile-12 white center capitalize normal Lora"
                :style="`color: #fff;`"
              >
                {{ guestAddress }}
              </div>
            </div>
          </div>
          <div class="theme-greeting-right">
            <button
              @click="onClick"
              class="btn btn-main fonts fonts-12 Lora"
              :style="`background-color: #808F6D; border-color: #808F6D; color: #fff;`"
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
import AppCardProKes from '../../../modules/AppCardProKes'
import AppImageBorder from '../../../modules/AppImageBorder'
import AppBorderTop from '../../../modules/AppBorderTop'
import AppBorderCircle from '../../../modules/AppBorderCircle'
import AppCardVideo from '../../../modules/AppCardVideo'

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
    customMainColor: {
      default: null,
    },
    customMainTextColor: {
      default: null,
    },
    customBackgroundColor: {
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
