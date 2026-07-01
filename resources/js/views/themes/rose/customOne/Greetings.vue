<template>
  <div id="App">
    <div
      class="display-popup bg-image"
      :style="`background-image: url(${data.invitation.cover ? invitationImageCoverUrl + data.invitation.cover : ''})`"
    >
      <div class="post-center">
        <div class="padding padding-10-px">
          <div
            class="card-alert big card-alert-mobile"
            :style="`padding: 0; margin: auto; box-shadow: 0 0 0 #fff; border-radius: 0; background-color: ${customBackgroundColor ? customBackgroundColor : 'rgba(225, 225, 225, 0.54)'};`"
          >
            <div>
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
                      style="margin-bottom: 20px"
                    >
                      ~ Virtual Wedding Invitation ~
                    </p>
                    <h1
                      :class="`fonts fonts-32 black center semibold ${customMainFont ? customMainFont : ''} theme-greetings-animate`"
                      :style="`margin-bottom: 20px; line-height: 1.2; color: ${customMainColor ? customMainColor : '#1A1507'};`"
                      v-html="generateTitle"
                    ></h1>
                    <p
                      class="fonts fonts-12 black center theme-greetings-animate"
                      style="margin-bottom: 15px"
                    >
                      {{ data.invitation.date | moment('dddd, Do MMMM YYYY') }}
                    </p>
                    <div
                      v-if="guest"
                      class="fonts fonts-12 black center theme-greetings-animate"
                    >
                      To:
                    </div>
                  </div>
                  <div
                    v-if="guest"
                    class="width width-70 width-mobile width-center content-center"
                  >
                    <div style="padding: 15px" class="theme-greetings-animate">
                      <div class="fonts fonts-18 black semibold ViaodaLibre">
                        {{ guest }}
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
                    :style="`background-color: ${customMainColor ? customMainColor : ''}; border-color: ${customMainColor ? customMainColor : ''}; color: #fff;`"
                  >
                    View Invitation
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
import { gsap, ScrollTrigger } from 'gsap/all'
import logo from '../../../../../img/logo.png'
import AppCardProKes from '../../../modules/AppCardProKes'
import AppImageBorder from '../../../modules/AppImageBorder'
import AppBorderTop from '../../../modules/AppBorderTop'
import AppBorderCircle from '../../../modules/AppBorderCircle'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
    }
  },
  mounted() {
    if (this.invitationType !== 'bronze') {
      document.body.style.overflowY = 'hidden'
    }
    this.animateFromGreetings('.theme-greetings-animate')
  },
  methods: {
    animateFromGreetings(elem) {
      var tl = gsap.timeline()
      tl.fromTo(
        elem,
        {
          x: 0,
          y: -20,
          autoAlpha: 0,
        },
        {
          duration: 1.25,
          x: 0,
          y: 0,
          autoAlpha: 1,
          ease: 'expo',
          overwrite: 'auto',
        }
      )
    },
  },
  computed: {
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
    AppBorderTop,
    AppBorderCircle,
  },
  props: {
    guest: {
      required: true,
    },
    data: {
      required: true,
    },
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
  },
  watch: {
    data(props, prevProps) {
      if (props !== prevProps) {
        if (this.invitationType !== 'bronze') {
          document.body.style.overflowY = 'hidden'
        }
      }
    },
  },
}
</script>
