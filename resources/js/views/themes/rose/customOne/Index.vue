<template>
  <div id="App" class="theme">
    <div class="theme-header" id="rose-classic-theme-header">
      <div v-if="selectedData" class="theme-cover">
        <carousel
          v-if="!visibleBronze"
          :per-page="1"
          :mouse-drag="false"
          :centerMode="true"
          :loop="true"
          :autoplay="true"
          :speed="2000"
          :autoplayTimeout="7000"
          :paginationEnabled="false"
          :paginationColor="'#fff'"
          :paginationPosition="'#ff0000'"
        >
          <slide v-for="(dt, i) in dataCovers" :key="i">
            <div
              class="theme-image"
              :style="
                'background-image: url(' +
                (dt.image ? galleryImageCoverUrl + dt.image : '') +
                ')'
              "
            ></div>
          </slide>
        </carousel>
        <div
          v-else
          class="theme-image"
          :style="
            'background-image: url(' +
            (selectedData.invitation.cover
              ? invitationImageCoverUrl + selectedData.invitation.cover
              : '') +
            ')'
          "
        ></div>

        <div class="theme-transparent bg-2"></div>

        <div class="post-middle-absolute content-center" style="width: 100%">
          <div>
            <h2
              class="fonts fonts-12 text-shadow theme-invitation-animate"
              :style="`color: ${primaryColor};`"
            >
              ~ Virtual Wedding Invitation ~
            </h2>
            <h1
              class="fonts fonts-38 Parisienne text-shadow theme-invitation-animate"
              :style="`color: ${primaryColor}; line-height: 1.3; margin-top: 10px; margin-bottom: 10px;`"
              v-html="generateTitle"
            ></h1>
            <h2
              class="fonts fonts-12 text-shadow theme-invitation-animate"
              :style="`color: ${primaryColor}; margin-bottom: 18px;`"
            >
              {{ selectedData.invitation.date | moment('dddd, Do MMMM YYYY') }}
            </h2>
          </div>
        </div>
      </div>
    </div>

    <div
      style="position: relative; top: -100px; width: 100%"
      id="rose-classic-theme-bride"
    >
      <div
        class="theme-body theme-container box-shadow"
        :style="`background-color: ${primaryColor};`"
      >
        <div
          class="theme-body theme-container"
          style="padding-top: 20px; padding-bottom: 0px"
        >
          <div class="theme-padding">
            <div class="theme-invitation-animate">
              <AppBorderTop />
            </div>
            <div class="theme-container-small" style="text-align: center">
              <h2
                class="fonts fonts-24 black Parisienne theme-invitation-animate"
                :style="`color: ${mainColor};`"
              >
                The Happy Couple
              </h2>
              <div
                class="theme-line theme-invitation-animate"
                style="margin-top: 20px"
              ></div>
            </div>
          </div>
        </div>

        <div
          style="padding-top: 0; padding-bottom: 35px"
          class="display-flex display-mobile space-between"
        >
          <div
            v-for="(dt, i) in dataBrides"
            :key="i"
            class="width width-row-2 content-center"
          >
            <div style="width: 100%">
              <div
                class="width width-200-px width-center theme-invitation-animate"
              >
                <AppBorderCircle
                  :image="
                    dt.bride.image
                      ? brideImageThumbnailUrl + dt.bride.image
                      : ''
                  "
                  :cover="
                    dt.bride.image ? brideImageCoverUrl + dt.bride.image : ''
                  "
                  :disableBorder="true"
                />
              </div>
              <div
                class="content-center"
                style="
                  width: calc(100% - 30px);
                  margin: auto;
                  padding-bottom: 35px;
                "
              >
                <div>
                  <h2
                    class="fonts fonts-20 black Parisienne theme-invitation-animate"
                  >
                    {{ dt.bride.name }}
                  </h2>
                  <div class="fonts fonts-12 black theme-invitation-animate">
                    {{ dt.bride.nick_name }}
                  </div>
                  <div
                    class="fonts fonts-12 black theme-invitation-animate"
                    style="margin-top: 15px"
                  >
                    {{ dt.bride.about }}
                  </div>
                  <div
                    class="fonts fonts-12 black theme-invitation-animate"
                    v-html="dt.bride.parent"
                  ></div>
                </div>
                <div
                  v-if="dt.bride.instagram_link"
                  class="display-flex center theme-bride-socmed theme-invitation-animate"
                  style="margin-top: 15px"
                >
                  <a
                    :href="dt.bride.instagram_link"
                    target="_blank"
                    class="btn btn-sekunder btn-small-radius rose-button-date-content"
                  >
                    <i
                      class="fab fa-lg fa-instagram"
                      style="margin-right: 5px"
                    ></i>
                    Instagram
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      class="theme-body theme-container"
      style="padding-bottom: 50px"
      id="rose-classic-theme-countdown"
    >
      <div class="theme-padding">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Wedding Countdown
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
      </div>
      <VueCountdown
        :time="selectedTime"
        v-slot="{ days, hours, minutes, seconds }"
      >
        <div class="theme-time">
          <div
            class="time-2 theme-invitation-animate"
            :style="`border-color: ${mainColor};`"
          >
            <div class="post-middle">
              <h4
                class="fonts fonts-28 black ViaodaLibre"
                :style="`color: ${mainColor};`"
              >
                {{ days }}
              </h4>
              <p class="fonts fonts-12 grey">Days</p>
            </div>
          </div>
          <div
            class="time-2 theme-invitation-animate"
            :style="`border-color: ${mainColor};`"
          >
            <div class="post-middle">
              <h4
                class="fonts fonts-28 black ViaodaLibre"
                :style="`color: ${mainColor};`"
              >
                {{ hours }}
              </h4>
              <p class="fonts fonts-12 grey">Hours</p>
            </div>
          </div>
          <div
            class="time-2 theme-invitation-animate"
            :style="`border-color: ${mainColor};`"
          >
            <div class="post-middle">
              <h4
                class="fonts fonts-28 black ViaodaLibre"
                :style="`color: ${mainColor};`"
              >
                {{ minutes }}
              </h4>
              <p class="fonts fonts-12 grey">Minutes</p>
            </div>
          </div>
          <div
            class="time-2 theme-invitation-animate"
            :style="`border-color: ${mainColor};`"
          >
            <div class="post-middle">
              <h4
                class="fonts fonts-28 black ViaodaLibre"
                :style="`color: ${mainColor};`"
              >
                {{ seconds }}
              </h4>
              <p class="fonts fonts-12 grey">Seconds</p>
            </div>
          </div>
        </div>
      </VueCountdown>

      <div
        class="display-flex center theme-invitation-animate"
        style="position: relative; width: 100%; padding-top: 30px"
      >
        <a
          :href="dataAddToCalendar"
          target="_blank"
          class="btn btn-main rose-button-date-content"
        >
          Add to Google Calendar
          <i class="icn icn-right fa fa-lw fa-calendar-alt" />
        </a>
      </div>
    </div>

    <div
      v-if="visibleEvent"
      class="theme-body theme-container"
      id="rose-classic-theme-ceremony"
    >
      <div class="theme-padding">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Wedding Event
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
        <div class="theme-container-small">
          <AppCardEvent
            :data.sync="dataEvents"
            :enableAnimation="true"
            :enableEnglish="true"
            :customIconColor="mainColor"
            :customMainColor="mainColor"
            :customMainFont="'Parisienne'"
            :customBorderRadius="'0px'"
          />
        </div>
      </div>

      <div style="padding-bottom: 0px"></div>
    </div>

    <div
      v-if="visibleMap"
      class="theme-body theme-container"
      id="rose-classic-theme-map"
    >
      <div class="theme-padding" style="padding-bottom: 0">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Wedding Location
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
      </div>

      <div class="theme-map theme-invitation-animate" style="height: 500px">
        <GmapMap
          ref="mapRef"
          :center="{ lat: dataLatitude, lng: dataLongitude }"
          :zoom="19"
          style="width: 100%; height: 500px"
          :options="{
            zoomControl: true,
            mapTypeControl: true,
            scaleControl: false,
            streetViewControl: true,
            rotateControl: true,
            fullscreenControl: true,
            disableDefaultUi: false,
          }"
        >
          <GmapMarker
            ref="myMarker"
            :position="
              google && new google.maps.LatLng(dataLatitude, dataLongitude)
            "
          />
        </GmapMap>
      </div>

      <div
        class="display-flex center theme-invitation-animate"
        style="position: relative; width: 100%; padding-top: 30px"
      >
        <a
          :href="`http://maps.google.com/maps?q=${dataLatitude},${dataLongitude}`"
          target="_blank"
          class="btn btn-main rose-button-date-content"
        >
          View Map on Google-map
          <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
        </a>
      </div>

      <div style="padding-bottom: 60px"></div>
    </div>

    <div
      v-if="visibleGallery"
      class="theme-body"
      id="rose-classic-theme-moment"
    >
      <div class="theme-padding theme-container-small">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Galleries
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
        <div
          style="width: calc(100% - 50px); margin: auto; padding-bottom: 10px"
        >
          <div class="theme-header small">
            <div class="theme-cover">
              <AppSlideGallery
                :data.sync="dataGalleries"
                :paginationActiveColor="mainColor"
                :paginationColor="'#555'"
                :paginationPosition="'#ff0000'"
              />
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="visibleVideo" class="theme-body theme-container">
      <div class="theme-padding" style="padding-bottom: 0">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Video
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
      </div>
      <div style="padding-bottom: 60px" class="theme-invitation-animate">
        <div
          class="image youtube-video background-grey theme-invitation-animate"
        >
          <AppCardVideo :data="selectedData.invitation" height="300" />
        </div>
      </div>
    </div>

    <div class="theme-body theme-container" id="rose-classic-theme-guest">
      <div class="theme-padding" style="padding-bottom: 0">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Reservations
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
      </div>
      <div class="theme-invitation-animate-disable">
        <AppReservation
          :enableEnglish="true"
          :guest="guest"
          :data.sync="selectedData.guest"
          :invID.sync="selectedData.invitation.id"
          :invStringID.sync="selectedData.invitation.invitation_id"
          :invitation.sync="selectedData.invitation"
          innerClass="width width-100"
          :backgroundChatColor="primaryColor"
          :backgroundButtonColor="mainColor"
          textButtonColor="#fff"
          :mainColor="mainColor"
        />
      </div>
      <div style="padding-bottom: 60px"></div>
    </div>

    <div v-if="visibleComment" class="theme-body theme-container">
      <div class="theme-padding">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Digital Gifts
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
        <div class="theme-container-small">
          <AppCardDigitalGift :data.sync="dataGifts" :enableAnimation="true" />
        </div>
      </div>
    </div>

    <div v-if="selectedData" class="theme-body theme-container">
      <div class="theme-padding">
        <div class="theme-container-small" style="text-align: center">
          <div style="width: 80%; margin: auto">
            <div
              class="fonts fonts-16 black ViaodaLibre theme-invitation-animate"
              style="margin-bottom: 10px"
            >
              Due to circumstances outside of our control, we are unable to
              celebrate with you in person. We appreciate your understanding
              during this difficult time and hope that you will be able to
              celebrate with us from afar.
            </div>
            <div
              class="fonts fonts-16 black ViaodaLibre theme-invitation-animate"
            >
              With all our love,
            </div>
            <div
              class="fonts fonts-16 black ViaodaLibre theme-invitation-animate"
            >
              {{ selectedData.invitation.title }}
            </div>
          </div>
        </div>

        <div
          class="width width-250-px width-center theme-invitation-animate"
          style="padding-top: 50px; padding-bottom: 0"
        >
          <AppBorderCircle
            :disableBorder="true"
            :image="
              selectedData.invitation.profile
                ? invitationImageThumbnailUrl + selectedData.invitation.profile
                : ''
            "
            :cover="
              selectedData.invitation.profile
                ? invitationImageCoverUrl + selectedData.invitation.profile
                : ''
            "
          />
        </div>
      </div>
    </div>

    <div v-if="visibleSpecialThanks" class="theme-body theme-container">
      <div class="theme-padding">
        <div class="theme-invitation-animate">
          <AppBorderTop />
        </div>
        <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
          <h2
            class="fonts fonts-24 black Parisienne theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Special Thanks
          </h2>
          <div
            class="theme-line theme-invitation-animate"
            style="margin-top: 20px"
          ></div>
        </div>
        <AppCardSpecialThanks
          :data="dataSpecialThanks"
          :customBorderRadius="'0px'"
          :enableAnimation="true"
        />
      </div>
    </div>

    <AppGuestGreetings
      v-if="visibleGreeting"
      :customMainFont="'Parisienne'"
      :guest="guest"
      :data.sync="selectedData"
      :customBackgroundColor="'rgba(225, 225, 225, 0.34)'"
      :customMainColor="mainColor"
      :onClick="closeGuestGreeting"
    />

    <FooterSecondComponent
      :backgroundColor="mainColor"
      textColor="#fff"
      buttonBackgroundColor="#fff"
      :buttonBorderColor="mainColor"
      :textButtonColor="mainColor"
    />

    <div class="theme-play-song">
      <button v-if="!isPlayed" class="theme-play-button" @click="playAudio">
        <div class="song-action">
          <i class="song-icon fa fa-lw fa-play"></i>
          <div class="song-caption">
            <div class="song-title">Play</div>
            <div class="song-name">
              {{ selectedData && selectedData.song && selectedData.song.name }}
            </div>
          </div>
        </div>
      </button>
      <button v-else class="theme-play-button" @click="pauseAudio">
        <div class="song-action">
          <i class="song-icon fa fa-lw fa-pause"></i>
          <div class="song-caption">
            <div class="song-title">Pause</div>
            <div class="song-name">
              {{ selectedData && selectedData.song && selectedData.song.name }}
            </div>
          </div>
        </div>
      </button>
    </div>

    <div class="theme-navigation">
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('rose-classic-theme-header')"
      >
        <i class="fa fa-lg fa-user-friends" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('rose-classic-theme-countdown')"
      >
        <i class="fa fa-lg fa-clock" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('rose-classic-theme-ceremony')"
      >
        <i class="fa fa-lg fa-calendar-alt" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('rose-classic-theme-map')"
      >
        <i
          class="fa fa-lg fa-map-marker-alt"
          :style="`color: ${mainColor};`"
        ></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('rose-classic-theme-moment')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('rose-classic-theme-guest')"
      >
        <i
          class="fa fa-lg fa-calendar-check"
          :style="`color: ${mainColor};`"
        ></i>
      </button>
    </div>
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
import AppSlideGallery from '../../../../components/modules/AppSlideGallery'
import AppCardEvent from '../../../../components/modules/AppCardEvent'
import AppCardVideo from '../../../../components/modules/AppCardVideo'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import AppGuestGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  name: 'App',
  data() {
    return {
      mainColor: '#C6ADAD',
      primaryColor: '#F6F0F3',
      tertiaryColor: '#E9EEE6',
      visibleGreeting: true,
      isPlayed: false,
      counting: false,
      guest: null,
      audio: null,
    }
  },
  mounted() {
    const url = this.$route.query
    if (url && url.kepada) {
      this.guest = url.kepada
    }
    const pathSong = this.data ? this.songUrl + this.data.song.song : ''
    this.audio = new Audio(pathSong)
    this.$moment.locale('en-in')
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
    dataAddToCalendar() {
      return `http://www.google.com/calendar/render?action=TEMPLATE&text=${this.selectedData.invitation.title.replace('&', '%26')}%20Wedding%20Live%20Streaming&dates=${this.selectedDate}&details=${this.selectedData.invitation.title.replace('&', '%26')}%20Wedding%20Live%20Streaming&location=${this.selectedData.invitation.description}&trp=false&sprop=&sprop=name:`
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
      return this.selectedData.invitation.title.replace(/[ ]/g, '<br>')
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
    visibleComment() {
      return !this.visibleBronze && this.selectedData.comments.length > 0
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
    AppCardVideo,
    AppCardEvent,
    AppSlideGallery,
    AppCardDigitalGift,
    AppGuestGreetings,
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
      this.scrollToTarget('rose-classic-theme-header')
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
<style lang="scss">
.rose-time-container {
  border-color: rgba($color: #000, $alpha: 0) !important;
  background-color: rgba($color: #000, $alpha: 0.3) !important;
  width: 90px !important;
  height: 90px !important;
}
.rose-button-date {
  background-color: rgba($color: #000, $alpha: 0.5) !important;
  border-color: rgba($color: #000, $alpha: 0.5) !important;
  color: #c6adad !important;
}
.rose-button-date-reverse {
  background-color: #fff !important;
  border-color: #fff !important;
  color: #c6adad !important;
}
.rose-button-date-content {
  background-color: #c6adad !important;
  border-color: #c6adad !important;
  color: #fff !important;
}
</style>
