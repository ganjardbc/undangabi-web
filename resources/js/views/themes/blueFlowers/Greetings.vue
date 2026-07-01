<template>
  <div id="App">
    <div
      :class="`display-popup bg-transparent-white-60 theme-greeting-popup ${visible ? 'show' : 'hide'}`"
    >
      <div class="post-center">
        <div class="width width-100 display-flex row center">
          <div
            class="card-alert bg-image box-shadow"
            :style="`background-color: ${customBackgroundColor ? customBackgroundColor : '#fff'}; background-image: url(${backgroundImage})`"
          >
            <AppImageBorder
              position="top-right"
              scaleX="1"
              customWidth="100px"
              :customImageTopRight="topRightImage"
            />
            <AppImageBorder
              position="top-left"
              scaleX="1"
              customWidth="100px"
              :customImageTopLeft="topLeftImage"
            />
            <AppImageBorder
              position="bottom-left"
              scaleX="1"
              customWidth="100%"
              :customImageBottomLeft="bottomImage"
            />
            <div style="padding: 50px 0">
              <div class="padding padding-15px">
                <div class="content-center" style="padding-bottom: 10px">
                  <div
                    class="fonts fonts-14 fonts-mobile-12 black center Ovo"
                    style="margin-bottom: 20px"
                  >
                    THE WEDDING OF
                  </div>
                  <div
                    :class="`fonts fonts-38 fonts-mobile-34 black center semibold FeelingPassionate`"
                    :style="`margin-bottom: 20px; line-height: 1.2; color: ${customMainColor ? customMainColor : '#1A1507'};`"
                  >
                    {{ data.invitation.title }}
                  </div>
                  <div class="fonts fonts-14 fonts-mobile-12 black center Ovo">
                    {{ data.invitation.date | moment('dddd, Do MMMM YYYY') }}
                  </div>
                  <div v-if="guestName" class="margin margin-top-20px">
                    <div
                      class="fonts fonts-14 fonts-mobile-12 black center capitalize normal Ovo"
                    >
                      Kepada :
                    </div>
                    <div
                      class="fonts fonts-18 fonts-mobile-16 black center capitalize normal Ovo"
                    >
                      {{ guestName }}
                    </div>
                  </div>
                </div>
              </div>
              <div class="display-flex center" style="padding-bottom: 20px">
                <button
                  class="btn btn-main fonts fonts-12 Ovo"
                  @click="onClick"
                  :style="`background-color: ${customButtonColor ? customButtonColor : ''}; border-color: ${customButtonColor ? customButtonColor : ''}; color: ${customButtonTextColor ? customButtonTextColor : '#FFF'};`"
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
</template>
<script>
import { mapState } from 'vuex'
import AppCardProKes from '../../../components/modules/AppCardProKes'
import AppImageBorder from '../../../components/modules/AppImageBorder'
import AppImageBanner from '../../../components/modules/AppImageBanner'
import AppBorderTop from '../../../components/modules/AppBorderTop'
import AppBorderCircle from '../../../components/modules/AppBorderCircle'
import backgroundImage from './assets/background-blue.png'
import bottomImage from './assets/bottom-blue.png'
import topRightImage from './assets/top-right-blue.png'
import topLeftImage from './assets/top-left-blue.png'

export default {
  name: 'App',
  data() {
    return {
      backgroundImage,
      bottomImage,
      topRightImage,
      topLeftImage,
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
    customButtonColor: {
      default: null,
    },
    customButtonTextColor: {
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
