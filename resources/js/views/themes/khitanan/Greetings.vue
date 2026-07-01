<template>
  <div id="App">
    <div
      :class="`display-popup bg-image theme-greeting-popup ${visible ? 'show' : 'hide'}`"
      :style="`background-color: ${customBackgroundColor ? customBackgroundColor : '#fff'}; background-image: url(${'/images/alamanda/cover-image.jpeg'})`"
    >
      <div
        class="card-alert card-alert-mobile full"
        style="
          background-color: rgba(0, 0, 0, 0);
          padding: 0;
          margin: auto;
          box-shadow: 0 0 0 #fff;
          border-radius: 0;
        "
      >
        <div class="post-center">
          <div class="width width-700-px width-mobile width-center">
            <div class="padding padding-10-px">
              <div
                style="
                  position: relative;
                  width: 100%;
                  padding-top: 20px;
                  padding-bottom: 20px;
                "
              >
                <div style="padding: 15px">
                  <div class="content-center" style="padding-bottom: 10px">
                    <div
                      class="fonts fonts-14 fonts-mobile-12 black center VisiaPro"
                      style="margin-bottom: 20px"
                    >
                      ~ Undangan Walimatul Khitan ~
                    </div>
                    <div
                      :class="`fonts fonts-42 fonts-mobile-34 black center semibold ${customMainFont ? customMainFont : ''}`"
                      :style="`margin-bottom: 20px; line-height: 1.2; color: ${customMainColor ? customMainColor : '#1A1507'};`"
                    >
                      {{ data.invitation.title }}
                    </div>
                    <div
                      class="fonts fonts-14 fonts-mobile-12 black center VisiaPro"
                    >
                      {{ data.invitation.date | moment('dddd, Do MMMM YYYY') }}
                    </div>
                    <div v-if="guestName" class="margin margin-top-20px">
                      <div
                        class="fonts fonts-14 fonts-mobile-12 black center capitalize normal VisiaPro"
                      >
                        Kepada :
                      </div>
                      <div
                        class="fonts fonts-18 fonts-mobile-16 black center capitalize normal VisiaPro"
                      >
                        {{ guestName }}
                      </div>
                    </div>
                  </div>
                </div>
                <div class="display-flex center" style="padding-bottom: 20px">
                  <button
                    class="btn btn-main fonts fonts-12 VisiaPro"
                    @click="onClick"
                    :style="`background-color: ${customMainColor ? customMainColor : ''}; border-color: ${customMainColor ? customMainColor : ''}; color: #fff;`"
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
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import logo from '../../../../img/logo.png'
import AppCardProKes from '../../../components/modules/AppCardProKes'
import AppImageBorder from '../../../components/modules/AppImageBorder'
import AppImageBanner from '../../../components/modules/AppImageBanner'
import AppBorderTop from '../../../components/modules/AppBorderTop'
import AppBorderCircle from '../../../components/modules/AppBorderCircle'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
    }
  },
  mounted() {
    if (this.invitationType !== 'bronse') {
      document.body.style.overflowY = 'hidden'
    }
  },
  computed: {
    ...mapState({
      data: (state) => state.guestInvitation.data,
    }),
    guestName() {
      return this.data && this.data.guest && this.data.guest.name
    },
    generateTitle() {
      return this.data.invitation.title.replace(/[ ]/g, '<br>')
    },
    invitationType() {
      return this.data.invitation.type
    },
  },
  components: {
    AppCardProKes,
    AppImageBorder,
    AppImageBanner,
    AppBorderTop,
    AppBorderCircle,
  },
  props: {
    onClick: {
      type: Function,
      required: true,
    },
    customMainColor: {
      default: null,
    },
    customBackgroundColor: {
      default: null,
    },
    customMainFont: {
      default: null,
    },
    visible: {
      default: true,
    },
  },
}
</script>

<style lang="scss">
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.8s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.slide-fade-enter-active {
  transition: all 0.3s ease;
}
.slide-fade-leave-active {
  transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter,
.slide-fade-leave-to {
  transform: translateX(10px);
  opacity: 0;
}
</style>
