<template>
  <div class="width width-100">
    <div
      class="theme-scroll-snap__content bg-white display-flex column space-between"
    >
      <div
        class="padding padding-left-15px padding-right-15px padding-top-30px"
      >
        <div
          class="fonts VisiaPro fonts-18px fonts-mobil-12px theme-invitation-animate"
          :style="`color: ${blackColor}`"
        >
          THE WEDDING OF
        </div>
        <div
          class="fonts Gistesy fonts-128px fonts-mobile-78px margin margin-top-60px pre-wrap theme-invitation-animate"
          :style="`color: ${greyColor}; line-height: 1`"
          v-html="generateTitle"
        />
      </div>
      <div
        class="padding padding-left-15px padding-right-15px padding-bottom-30px"
      >
        <div
          class="fonts VisiaPro fonts-18px fonts-mobil-12px align-right theme-invitation-animate"
          :style="`color: ${blackColor}`"
        >
          Kepada Yth.
        </div>
        <div
          class="fonts VisiaProBold fonts-48px fonts-mobile-32px align-right margin margin-top-15px theme-invitation-animate"
          :style="`color: ${blackColor}`"
        >
          Asep Sumpena
        </div>
      </div>
      <div
        class="float-top-right padding padding-right-15px padding-top-15px display-flex column align-center"
      >
        <div
          class="fonts VisiaProBold fonts-48px fonts-mobile-32px align-center theme-invitation-animate"
          :style="`color: ${blackColor}`"
        >
          {{ selectedData.invitation.date | moment('DD') }}
        </div>
        <div
          class="fonts VisiaProBold fonts-48px fonts-mobile-32px align-center theme-invitation-animate"
          :style="`color: ${blackColor}`"
        >
          {{ selectedData.invitation.date | moment('MM') }}
        </div>
        <div
          class="fonts VisiaProBold fonts-48px fonts-mobile-32px align-center theme-invitation-animate"
          :style="`color: ${blackColor}`"
        >
          {{ selectedData.invitation.date | moment('YY') }}
        </div>
      </div>
    </div>
    <div class="theme-scroll-snap__content bg-red">BANNERS</div>
    <div class="theme-scroll-snap__content bg-green">INFO GREETING</div>
    <div class="theme-scroll-snap__content bg-grey">BRIDES</div>
  </div>
</template>
<script>
import { gmapApi } from 'vue2-google-maps'
import { Carousel, Slide } from 'vue-carousel'
import AppReservation from '../../../../components/modules/AppReservation'
import AppPopupComment from '../../../../components/modules/AppPopupComment'
import AppImageBorder from '../../../../components/modules/AppImageBorder'
import AppImageCover from '../../../../components/modules/AppImageCover'
import AppBorderTop from '../../../../components/modules/AppBorderTop'
import AppBorderCircle from '../../../../components/modules/AppBorderCircle'
import AppCardDigitalGift from '../../../../components/modules/AppCardDigitalGift'
import AppCardSpecialThanks from '../../../../components/modules/AppCardSpecialThanks'
import AppGridGallery from '../../../../components/modules/AppGridGallery'
import AppCardEvent from '../../../../components/modules/AppCardEvent'
import AppCardLoveStory from '../../../../components/modules/AppCardLoveStory'
import AppCardVideo from '../../../../components/modules/AppCardVideo'
import AppPlaySong from '../../../../components/modules/AppPlaySong'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'
import moment from 'moment'

export default {
  name: 'App',
  data() {
    return {
      mainColor: '#000000',
      primaryColor: '#FFFFFF',
      backgroundColor: '#FFFFFF',
      whiteColor: '#FFFFFF',
      blackColor: '#282828',
      greyColor: '#484745',
      transparentMainColor: 'rgba(227, 216, 184, 0.4)',
      transparentPrimaryColor: 'rgba(0, 0, 0, 0.4)',
      visibleGreeting: true,
      isPlayed: false,
      counting: false,
      guest: null,
      audio: null,
    }
  },
  mounted() {
    this.setScrollMandatory()
    const url = this.$route.query
    if (url && url.kepada) {
      this.guest = url.kepada
    }
    const pathSong = this.data ? this.songUrl + this.data.song.song : ''
    this.audio = new Audio(pathSong)
    this.$moment.locale('id')

    console.log('data', this.data)
  },
  computed: {
    google: gmapApi,
    selectedData() {
      return {
        ...this.data,
        invitation: {
          ...this.data.invitation,
          latitude: parseFloat(this.data.invitation.latitude),
          longitude: parseFloat(this.data.invitation.longitude),
        },
      }
    },
    selectedTime() {
      const now = new Date()
      const time = new Date(this.selectedData.invitation.date)
      const result =
        time != 'Invalid Date' ? time.getTime() - now.getTime() : null
      return result > 0 ? result : null
    },
    selectedDate() {
      const time = new Date(this.selectedData.invitation.date).getTime()
      return M(time).format('YYYYMMDDT080000/YYYYMMDDT170000')
    },
    songName() {
      return (
        this.selectedData &&
        this.selectedData.song &&
        this.selectedData.song.name
      )
    },
    guestName() {
      return (
        this.selectedData &&
        this.selectedData.guest &&
        this.selectedData.guest.name
      )
    },
    guestAddress() {
      return (
        this.selectedData &&
        this.selectedData.guest &&
        this.selectedData.guest.address
      )
    },
    dataLatitude() {
      return (
        this.selectedData &&
        this.selectedData.invitation &&
        this.selectedData.invitation.latitude
      )
    },
    dataLongitude() {
      return (
        this.selectedData &&
        this.selectedData.invitation &&
        this.selectedData.invitation.longitude
      )
    },
    dataSpecialThanks() {
      return this.selectedData && this.selectedData.specialthanks
    },
    dataGifts() {
      return this.selectedData && this.selectedData.comments
    },
    dataEvents() {
      return this.selectedData && this.selectedData.events
    },
    dataLoveStories() {
      return this.selectedData && this.selectedData.loveStories
    },
    dataCovers() {
      return this.selectedData && this.selectedData.covers
    },
    dataVideo() {
      return this.selectedData && this.selectedData.invitation.video
    },
    dataGalleries() {
      return this.selectedData && this.selectedData.galleries
    },
    dataBrides() {
      return this.selectedData && this.selectedData.brides
    },
    generateTitle() {
      return this.selectedData.invitation.title.replace(
        ' & ',
        '&nbsp;&\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
      )
    },
    visibleDiamon() {
      return (
        this.selectedData && this.selectedData.invitation.type === 'diamond'
      )
    },
    visibleSilver() {
      return this.selectedData && this.selectedData.invitation.type === 'silver'
    },
    visibleBronze() {
      return this.selectedData && this.selectedData.invitation.type === 'bronze'
    },
    visibleMap() {
      return (
        (this.visibleSilver || this.visibleDiamon) &&
        this.selectedData.invitation.latitude &&
        this.selectedData.invitation.longitude
      )
    },
    visibleEvent() {
      return this.selectedData.events.length > 0
    },
    visibleLoveStory() {
      return !this.visibleBronze && this.selectedData.loveStories.length > 0
    },
    visibleLoveStory() {
      return !this.visibleBronze && this.selectedData.loveStories.length > 0
    },
    visibleComment() {
      return !this.visibleBronze && this.selectedData.comments.length > 0
    },
    visibleNote() {
      return this.selectedData && this.selectedData.invitation.note
    },
    visibleGallery() {
      return !this.visibleBronze && this.selectedData.galleries.length > 0
    },
    visibleVideo() {
      return this.visibleDiamon && this.selectedData.invitation.video_link
    },
    visibleSpecialThanks() {
      return this.visibleDiamon && this.selectedData.specialthanks.length > 0
    },
  },
  components: {
    Carousel,
    Slide,
    AppPlaySong,
    AppCardVideo,
    AppCardEvent,
    AppCardLoveStory,
    AppGridGallery,
    AppCardDigitalGift,
    AppBorderCircle,
    AppBorderTop,
    AppImageBorder,
    AppImageCover,
    AppPopupComment,
    AppReservation,
    AppCardSpecialThanks,
    VueCountdown,
    FooterComponent,
    FooterSecondComponent,
  },
  methods: {
    closeGuestGreeting() {
      document.body.style.overflowY = 'auto'
      this.visibleGreeting = false
      this.scrollToTarget('lavender-header')
      this.playAudio()
    },
    playAudio() {
      this.audio.play()
      this.isPlayed = true
    },
    pauseAudio() {
      this.audio.pause()
      this.isPlayed = false
    },
    scrollToTarget(id) {
      const data = document.getElementById(id).offsetTop
      document.documentElement.scrollTop = data
    },
    setScrollMandatory() {
      document.getElementsByTagName('html')[0].style.scrollSnapType =
        'y mandatory'
    },
  },
  props: {
    data: {
      required: true,
    },
  },
  watch: {
    data: function (props) {
      if (props) {
        const pathSong = props ? this.songUrl + props.song.song : ''
        this.audio = new Audio(pathSong)
      }
    },
  },
}
</script>
