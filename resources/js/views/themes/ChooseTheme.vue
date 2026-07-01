<template>
  <div id="App">
    <!-- ROSE -->
    <div v-if="selectedID === 'TH-1642216393849'">
      <RoseTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1651838345001'">
      <RoseSageGreenTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1659160482827'">
      <RoseCustomOneTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1749133795904'">
      <RoseCreamTheme :data.sync="selectedData" />
    </div>

    <!-- LILY -->
    <div v-if="selectedID === 'TH-1642824330599'">
      <LilyTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1651199175700'">
      <LilySageGreenTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1693491074353'">
      <LilyLightBlueTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1752071808462'">
      <BlackWhiteTheme :data.sync="selectedData" />
    </div>

    <!-- CLOVER -->
    <div v-if="selectedID === 'TH-1645775387363'">
      <CloverTheme :data.sync="selectedData" />
    </div>

    <!-- DAISY -->
    <div v-if="selectedID === 'TH-1642732027932'">
      <DaisyTheme :data.sync="selectedData" />
    </div>

    <!-- DIVIA -->
    <div v-if="selectedID === 'TH-1677307603023'">
      <DiviaTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1677553230053'">
      <DiviaSageGreenTheme :data.sync="selectedData" />
    </div>

    <!-- TRADITIONAL -->
    <div v-if="selectedID === 'TH-1685962308305'">
      <TraditionalBlackGoldTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1686036860211'">
      <TraditionalRedGoldTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1686190608591'">
      <TraditionalTheme :data.sync="selectedData" />
    </div>

    <!-- TULIP -->
    <div v-if="selectedID === 'TH-1694234919026'">
      <TulipSageGreenTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1695100119192'">
      <TulipLightBlueTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1697771133884'">
      <TulipBurgundyTheme :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1766297808359'">
      <TulipCreamTheme :data.sync="selectedData" />
    </div>

    <!-- BLACK TRANSPARENT -->
    <div v-if="selectedID === 'TH-1699092166434'">
      <BlackTransparent :data.sync="selectedData" />
    </div>
    <div v-if="selectedID === 'TH-1699165004349'">
      <BlackTransparentSageGreen :data.sync="selectedData" />
    </div>

    <!-- OTHER THEME -->
    <div v-if="selectedID === 'TH-1644142260684'">
      <AlamandaTheme :data.sync="selectedData" />
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'
import { gsap, ScrollTrigger } from 'gsap/all'
import { traditionalSageGreen } from './configTheme.js'

// ROSE
import RoseTheme from './rose/original/Index.vue'
import RoseSageGreenTheme from './rose/sageGreen/Index.vue'
import RoseCustomOneTheme from './rose/customOne/Index.vue'
import RoseCreamTheme from './rose/cream/Index.vue'

// DAISY
import DaisyTheme from './daisy/original/Index.vue'

// LILY
import LilyTheme from './lily/original/Index.vue'
import LilySageGreenTheme from './lily/sageGreen/Index.vue'
import LilyLightBlueTheme from './lily/lightBlue/Index.vue'
import BlackWhiteTheme from './lily/blackWhite/Index.vue'

// CLOVER
import CloverTheme from './clover/original/Index.vue'

// DIVIA
import DiviaTheme from './divia/original/Index.vue'
import DiviaSageGreenTheme from './divia/sageGreen/Index.vue'

// TRADITIONAL
import TraditionalBlackGoldTheme from './traditional/blackGold/Index.vue'
import TraditionalRedGoldTheme from './traditional/redGold/Index.vue'
import TraditionalTheme from './traditional/original/Index.vue'

// TULIP
import TulipSageGreenTheme from './tulip/sageGreen/Index.vue'
import TulipLightBlueTheme from './tulip/lightBlue/Index.vue'
import TulipBurgundyTheme from './tulip/burgundy/Index.vue'
import TulipCreamTheme from './tulip/cream/Index.vue'

// BLACK TRANSPARENT
import BlackTransparent from './blackTransparent/original/Index.vue'
import BlackTransparentSageGreen from './blackTransparent/sageGreen/Index.vue'

// OTHER
import AlamandaTheme from './alamanda/Index.vue'

export default {
  name: 'App',
  data() {
    return {
      traditionalSageGreen,
    }
  },
  components: {
    RoseTheme,
    RoseSageGreenTheme,
    RoseCustomOneTheme,
    RoseCreamTheme,
    DaisyTheme,
    LilyTheme,
    LilySageGreenTheme,
    LilyLightBlueTheme,
    BlackWhiteTheme,
    CloverTheme,
    DiviaTheme,
    DiviaSageGreenTheme,
    TraditionalTheme,
    TraditionalBlackGoldTheme,
    TraditionalRedGoldTheme,
    TulipSageGreenTheme,
    TulipLightBlueTheme,
    TulipBurgundyTheme,
    TulipCreamTheme,
    AlamandaTheme,
    BlackTransparent,
    BlackTransparentSageGreen,
  },
  computed: {
    ...mapState({
      data: (state) => state.guestInvitation.data,
    }),
    selectedData() {
      return this.data
    },
    selectedID() {
      return this.data && this.data.theme && this.data.theme.theme_id
    },
  },
  mounted() {
    this.enableAnimation()
  },
  methods: {
    enableAnimation() {
      const val = this
      gsap.registerPlugin(ScrollTrigger)
      gsap.utils.toArray('.theme-invitation-animate').forEach(function (elm) {
        val.hide(elm)
        ScrollTrigger.create({
          trigger: elm,
          onEnter: function () {
            val.animateFrom(elm)
          },
          onEnterBack: function () {
            val.animateFrom(elm, -1)
          },
          onLeave: function () {
            val.hide(elm)
          },
        })
      })
    },
    animateFrom(elem, direction) {
      direction = direction || 1
      var x = 0,
        y = direction * 100
      if (elem.classList.contains('theme-invitation-animate-fromLeft')) {
        x = -100
        y = 0
      }
      if (elem.classList.contains('theme-invitation-animate-fromRight')) {
        x = 100
        y = 0
      }
      elem.style.transform = 'translate(' + x + 'px, ' + y + 'px)'
      elem.style.opacity = '0'
      gsap.fromTo(
        elem,
        { x: x, y: y, autoAlpha: 0 },
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
    hide(elem) {
      gsap.set(elem, { autoAlpha: 0 })
    },
  },
  watch: {
    data(props, prevProps) {
      const invitationId = props && props.invitation && props.invitation.id
      const prevInvitationId =
        prevProps && prevProps.invitation && prevProps.invitation.id
      if (invitationId !== prevInvitationId) {
        setTimeout(() => {
          this.enableAnimation()
        }, 500)
      }
    },
  },
}
</script>
