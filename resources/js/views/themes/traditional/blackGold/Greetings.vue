<template>
  <div id="App">
    <div
      :class="`display-popup bg-image theme-greeting-popup ${visible ? 'show' : 'hide'}`"
      :style="`
                background-color: ${backgroundColor}; 
                background-image: url(${'/images/traditional/cream/background.png'});
                background-repeat: repeat;
                background-size: contain;
            `"
    >
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="120px"
        :enableSizeMobile="false"
        customImageBottomLeft="/images/traditional/cream/left-bottom-border.png"
      />
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="120px"
        :enableSizeMobile="false"
        customImageBottomRight="/images/traditional/cream/right-bottom-border.png"
      />

      <div style="position: absolute; left: 0; bottom: 0; width: 100%">
        <div
          class="image image-100px image-center bg-transparent"
          style="height: 71px"
        >
          <img src="/images/traditional/cream/bottom-center.png" alt="" />
        </div>
      </div>

      <div class="post-middle-absolute content-center">
        <div class="padding padding-bottom-15px">
          <div
            class="image image-300px image-center bg-transparent"
            style="height: 191px"
          >
            <img src="/images/traditional/cream/top.png" alt="" />
          </div>
        </div>
        <div
          class="fonts fonts-14 fonts-mobile-12 white center capitalize normal VisiaPro"
          :style="`color: #fff;`"
        >
          THE WEDDING OF
        </div>
        <h1
          :class="`fonts fonts-32 fonts-mobile-26 white center weight-normal ${customMainFont ? customMainFont : ''}`"
          :style="`color: ${mainColor};`"
        >
          {{ data.invitation.title }}
        </h1>
        <div v-if="guestName">
          <div
            class="fonts fonts-14 fonts-mobile-12 white center capitalize normal VisiaPro"
            :style="`color: #fff; margin-bottom: 5px; margin-top: 20px;`"
          >
            Kepada
          </div>
          <div
            class="fonts fonts-16 fonts-mobile-14 white center capitalize normal VisiaPro"
            :style="`color: #fff;`"
          >
            {{ guestName }}
          </div>
        </div>
        <div class="display-flex center padding padding-top-30px">
          <button
            class="btn btn-main fonts fonts-12 VisiaPro"
            @click="onClick"
            :style="`background-color: ${mainColor ? mainColor : ''}; border-color: ${mainColor ? mainColor : ''}; color: ${primaryColor};`"
          >
            Lihat Undangan <i class="icn icn-right fa fa-lw fa-envelope-open" />
          </button>
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
      mainColor: '#F1D6AB',
      primaryColor: '#1A1507',
      backgroundColor: '#1A1507',
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
