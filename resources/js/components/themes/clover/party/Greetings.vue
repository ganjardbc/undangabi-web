<template>
  <div id="App" v-if="data">
    <div class="display-popup bg-image" :style="`background-color: #fff;`">
      <AppImageBorder
        position="top-right"
        scaleX="1"
        customWidth="500px"
        :enableSizeMobile="true"
        customImageTopRight="/images/cloverEvent/top-right.png"
      />
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="500px"
        :enableSizeMobile="true"
        customImageBottomLeft="/images/cloverEvent/bottom-left.png"
      />

      <div class="post-center">
        <div class="padding padding-10-px">
          <div
            class="card-alert big card-alert-mobile"
            :style="`
                            padding: 0; 
                            margin: auto; 
                            box-shadow: 0 0 0 #fff; 
                            border-radius: 0; 
                            background-color: ${customBackgroundColor ? customBackgroundColor : 'rgba(225, 225, 225, 0.54)'};`"
          >
            <div
              style="
                position: relative;
                width: 100%;
                padding-top: 30px;
                padding-bottom: 30px;
              "
            >
              <div style="padding: 15px">
                <div class="content-center" style="padding-bottom: 10px">
                  <p
                    class="fonts fonts-12 black center theme-greetings-animate"
                    :style="`margin-bottom: 20px; color: ${customPrimaryColor ? customPrimaryColor : '#1A1507'}`"
                  >
                    ~ Undangan Acara ~
                  </p>
                  <h1
                    :class="`fonts fonts-28 black center semibold ${customMainFont ? customMainFont : ''} theme-greetings-animate`"
                    :style="`margin-bottom: 20px; line-height: 1.2; color: ${customMainColor ? customMainColor : '#1A1507'};`"
                    v-html="generateTitle"
                  ></h1>
                  <p
                    class="fonts fonts-12 black center theme-greetings-animate"
                    :style="`margin-bottom: 15px; color: ${customPrimaryColor ? customPrimaryColor : '#1A1507'}`"
                  >
                    {{ data.invitation.date | moment('dddd, Do MMMM YYYY') }}
                  </p>
                  <div
                    v-if="guestName"
                    class="fonts fonts-12 black center theme-greetings-animate"
                    :style="`color: ${customPrimaryColor ? customPrimaryColor : '#1A1507'}`"
                  >
                    Kepada:
                  </div>
                </div>
                <div
                  v-if="guestName"
                  class="width width-70 width-mobile width-center content-center"
                >
                  <div style="padding: 15px" class="theme-greetings-animate">
                    <div
                      class="fonts fonts-18 black semibold ViaodaLibre"
                      :style="`color: ${customPrimaryColor ? customPrimaryColor : '#1A1507'}`"
                    >
                      {{ guestName }}
                    </div>
                  </div>
                </div>
              </div>
              <div
                class="display-flex center theme-greetings-animate"
                style="padding-bottom: 30px"
              >
                <button
                  class="btn btn-main"
                  @click="onClick"
                  :style="`
                                        background-color: ${customButtonBackgroundColor ? customButtonBackgroundColor : ''}; 
                                        border-color: ${customButtonBackgroundColor ? customButtonBackgroundColor : ''}; 
                                        color: ${customButtonTextColor ? customButtonTextColor : ''};
                                    `"
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
import logo from '../../../../../img/logo.png'
import AppCardProKes from '../../../modules/AppCardProKes'
import AppImageBorder from '../../../modules/AppImageBorder'
import AppImageBanner from '../../../modules/AppImageBanner'
import AppBorderTop from '../../../modules/AppBorderTop'
import AppBorderCircle from '../../../modules/AppBorderCircle'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
      show: false,
      showSecond: false,
      showThrid: false,
    }
  },
  mounted() {
    if (this.invitationType !== 'bronze') {
      document.body.style.overflowY = 'hidden'
    }
    setTimeout(() => {
      this.show = true
    }, 500)

    setTimeout(() => {
      this.showSecond = true
    }, 1000)

    setTimeout(() => {
      this.showThrid = true
    }, 1500)
  },
  computed: {
    ...mapState({
      data: (state) => state.guestInvitation.data,
    }),
    guestName() {
      return this.data && this.data.guest && this.data.guest.name
    },
    generateTitle() {
      return this.data.invitation.title
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
    customPrimaryColor: {
      default: null,
    },
    customBackgroundColor: {
      default: null,
    },
    customMainFont: {
      default: null,
    },
    customButtonBackgroundColor: {
      default: null,
    },
    customButtonTextColor: {
      default: null,
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
