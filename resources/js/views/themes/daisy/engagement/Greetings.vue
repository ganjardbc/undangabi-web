<template>
  <div id="App" v-if="data">
    <div class="display-popup bg-white">
      <div
        class="display-popup bg-image"
        :style="`background-color: ${customBackgroundColor ? customBackgroundColor : '#fff'}; background-image: url(${'/images/flower-banner-top-5.jpeg'})`"
      >
        <div
          class="display-popup bg-image"
          :style="`background-image: url(${'/images/flower-banner-top-6.png'}); background-color: rgba(0, 0, 0, 0);`"
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
                      padding-top: 30px;
                      padding-bottom: 30px;
                    "
                  >
                    <div style="padding: 15px">
                      <div class="content-center" style="padding-bottom: 10px">
                        <p
                          class="fonts fonts-12 black center"
                          style="margin-bottom: 20px"
                        >
                          Undangan Pertunangan
                        </p>
                        <h1
                          :class="`fonts fonts-32 white center semibold ${customMainFont ? customMainFont : ''}`"
                          :style="`margin-bottom: 30px; line-height: 1.2; color: ${customMainColor ? customMainColor : '#1A1507'};`"
                          v-html="generateTitle"
                        ></h1>
                        <p
                          class="fonts fonts-12 black center"
                          style="margin-bottom: 30px"
                        >
                          {{
                            data.invitation.date | moment('dddd, Do MMMM YYYY')
                          }}
                        </p>
                        <div
                          v-if="guestName"
                          class="fonts fonts-12 black center"
                        >
                          Kepada:
                        </div>
                      </div>
                      <div
                        v-if="guestName"
                        class="width width-50 width-mobile width-center border-full content-center"
                        style="border-color: #1a1507"
                      >
                        <div style="padding: 15px; height: 60px">
                          <div
                            class="post-top fonts fonts-18 blck semibold ViaodaLibre"
                          >
                            {{ guestName }}
                          </div>
                        </div>
                      </div>
                    </div>
                    <div
                      class="display-flex center"
                      style="padding-bottom: 30px"
                    >
                      <button
                        class="btn btn-main"
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
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import logo from '../../../../../img/logo.png'
import AppCardProKes from '../../../../components/modules/AppCardProKes'
import AppImageBorder from '../../../../components/modules/AppImageBorder'
import AppImageBanner from '../../../../components/modules/AppImageBanner'
import AppBorderTop from '../../../../components/modules/AppBorderTop'
import AppBorderCircle from '../../../../components/modules/AppBorderCircle'

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
