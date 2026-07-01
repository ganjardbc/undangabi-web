<template>
  <div id="App">
    <div
      :class="`display-popup bg-image theme-greeting-popup ${visible ? 'show' : 'hide'}`"
      :style="`background-image: url(${data.invitation.cover ? invitationImageCoverUrl + data.invitation.cover : ''})`"
    >
      <div class="theme-transparent bg-3"></div>
      <div class="theme-greeting-cover">
        <div class="theme-greeting-caption">
          <div class="theme-greeting-left">
            <div
              class="fonts fonts-14 fonts-mobile-12 white center capitalize normal VisiaPro"
              :style="`color: #fff;`"
            >
              Wedding Invitation
            </div>
            <h1
              :class="`fonts fonts-44 fonts-mobile-34 white center weight-normal ${customMainFont ? customMainFont : ''}`"
              :style="`color: #fff;`"
            >
              {{ data.invitation.title }}
            </h1>
            <div
              v-if="guestName"
              class="fonts fonts-14 fonts-mobile-12 white center capitalize normal VisiaPro"
              :style="`color: #fff;`"
            >
              To {{ guestName }}
            </div>
          </div>
          <div class="theme-greeting-right">
            <button
              class="btn btn-main fonts fonts-11 fonts-mobile-10 VisiaPro"
              @click="onClick"
              :style="`background-color: ${customMainColor ? customMainColor : ''}; border-color: ${customMainColor ? customMainColor : ''}; color: #fff;`"
            >
              Open Invitation
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
