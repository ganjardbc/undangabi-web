<template>
  <div id="App" class="theme">
    <div class="theme-header theme-header-second" id="divia-theme-header">
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

        <div class="theme-transparent bg-3"></div>

        <div class="post-middle-absolute content-center" style="width: 100%">
          <div>
            <div
              class="fonts text-shadow VisiaPro theme-invitation-animate theme-font-content"
              :style="`color: ${primaryColor};`"
            >
              Undangan Pernikahan
            </div>
            <h1
              class="fonts weight-normal CreattionDemo text-shadow theme-invitation-animate theme-font-second-title"
              :style="`color: ${primaryColor}; line-height: 1.3; margin-top: 10px;`"
            >
              {{ selectedData.invitation.title }}
            </h1>
          </div>
        </div>
      </div>
    </div>

    <div class="theme-body" id="divia-theme-bride">
      <div
        class="theme-body theme-container"
        style="padding-top: 20px; padding-bottom: 0px"
      >
        <div class="theme-padding">
          <div class="theme-container-small" style="text-align: center">
            <div
              class="width width-100 width-center"
              style="padding-bottom: 30px"
            >
              <h2
                class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
                :style="`color: ${mainColor};`"
              >
                Assalamu`alaikum Warahmatullaahi Wabarakaatuh
              </h2>
              <div
                class="fonts black VisiaPro theme-invitation-animate theme-font-content"
                style="margin-top: 10px"
              >
                Maha Suci Allah yang telah menciptakan makhluk-Nya
                berpasang-pasangan. Ya Allah semoga ridho-Mu tercurah mengiringi
                pernikahan putra putri kami.
              </div>
            </div>
          </div>
        </div>
      </div>

      <div
        class="theme-body theme-container display-flex display-mobile space-between"
        style="padding-top: 0; padding-bottom: 35px"
      >
        <div
          v-for="(dt, i) in dataBrides"
          :key="i"
          class="width width-row-2 content-center"
        >
          <div class="width width-100 width-center">
            <div
              class="width width-200-px width-center theme-invitation-animate"
            >
              <AppBorderCircle
                :image="
                  dt.bride.image ? brideImageThumbnailUrl + dt.bride.image : ''
                "
                :cover="
                  dt.bride.image ? brideImageCoverUrl + dt.bride.image : ''
                "
                :disableBorder="true"
              />
            </div>
            <div class="content-center" style="padding-bottom: 35px">
              <div>
                <h2
                  class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
                  :style="`color: ${mainColor};`"
                >
                  {{ dt.bride.name }}
                </h2>
                <div
                  class="fonts black VisiaPro theme-invitation-animate theme-font-content"
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
                  class="btn btn-sekunder btn-small-radius divia-button-date-content"
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

    <div
      class="theme-body"
      :style="`background-color: ${primaryColor}; padding-bottom: 50px;`"
      id="divia-theme-countdown"
    >
      <div class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <h2
              class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
            >
              Menuju Hari Bahagia
            </h2>
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
            >
              {{ selectedData.invitation.date | moment('dddd, Do MMMM YYYY') }}
            </div>
          </div>
        </div>
        <VueCountdown
          :time="selectedTime"
          v-slot="{ days, hours, minutes, seconds }"
        >
          <div class="theme-time">
            <div class="time theme-invitation-animate">
              <div class="post-middle">
                <h4
                  class="fonts black CreattionDemo theme-font-second-title"
                  :style="`color: ${mainColor};`"
                >
                  {{ days }}
                </h4>
                <p class="fonts grey VisiaPro theme-font-content">Hari</p>
              </div>
            </div>
            <div class="time theme-invitation-animate">
              <div class="post-middle">
                <h4
                  class="fonts black CreattionDemo theme-font-second-title"
                  :style="`color: ${mainColor};`"
                >
                  {{ hours }}
                </h4>
                <p class="fonts grey VisiaPro theme-font-content">Jam</p>
              </div>
            </div>
            <div class="time theme-invitation-animate">
              <div class="post-middle">
                <h4
                  class="fonts black CreattionDemo theme-font-second-title"
                  :style="`color: ${mainColor};`"
                >
                  {{ minutes }}
                </h4>
                <p class="fonts grey VisiaPro theme-font-content">Menit</p>
              </div>
            </div>
            <div class="time theme-invitation-animate">
              <div class="post-middle">
                <h4
                  class="fonts black CreattionDemo theme-font-second-title"
                  :style="`color: ${mainColor};`"
                >
                  {{ seconds }}
                </h4>
                <p class="fonts grey VisiaPro theme-font-content">Detik</p>
              </div>
            </div>
          </div>
        </VueCountdown>

        <div
          class="display-flex center theme-invitation-animate"
          style="position: relative; width: 100%; padding-top: 30px"
        >
          <a
            :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
            target="_blank"
            class="btn btn-main divia-button-date-content"
          >
            Tambah ke Google Calendar
            <i class="icn icn-right fa fa-lw fa-calendar-alt" />
          </a>
        </div>
      </div>
    </div>

    <div
      v-if="visibleMap"
      class="theme-body"
      :style="`padding-bottom: 50px;`"
      id="divia-theme-map"
    >
      <div class="theme-body">
        <div class="width width-100" style="height: 300px">
          <GmapMap
            ref="mapRef"
            :center="{ lat: dataLatitude, lng: dataLongitude }"
            :zoom="19"
            style="width: 100%; height: 300px"
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

        <div style="text-align: center; padding: 30px 0">
          <div
            class="fonts VisiaPro theme-invitation-animate theme-font-content"
          >
            {{ selectedData.invitation.description }}
          </div>
        </div>

        <div
          class="display-flex center theme-invitation-animate"
          style="position: relative; width: 100%"
        >
          <a
            :href="`http://maps.google.com/maps?q=${dataLatitude},${dataLongitude}`"
            target="_blank"
            class="btn btn-main divia-button-date-content"
          >
            Lihat Alamat pada Google-map
            <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
          </a>
        </div>
      </div>
    </div>

    <div
      v-if="visibleEvent"
      class="theme-body theme-container"
      style="padding-bottom: 50px"
      id="divia-theme-ceremony"
    >
      <div class="theme-padding">
        <div style="text-align: center">
          <h2
            class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
            :style="`color: ${mainColor};`"
          >
            Daftar Acara
          </h2>
        </div>
      </div>

      <div class="theme-container-small">
        <AppCardEvent
          :data.sync="dataEvents"
          :enableAnimation="true"
          :customIconColor="mainColor"
          :customMainColor="mainColor"
          :customMainFont="'CreattionDemo'"
          :customMainFontSize="'fonts-26'"
          :customPrimaryFont="'VisiaPro'"
          :customMainFontWeight="'weight-normal'"
          :customBorderRadius="'0px'"
        />
      </div>
    </div>

    <div
      v-if="visibleGallery"
      class="theme-body"
      style="padding-bottom: 60px"
      id="divia-theme-moment"
    >
      <div class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <h2
              class="fonts CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Galeri Foto
            </h2>
          </div>
        </div>
      </div>
      <div class="theme-container">
        <AppGridGallery :data.sync="dataGalleries" />
      </div>
    </div>

    <div v-if="visibleVideo" class="theme-body" style="padding-bottom: 60px">
      <div class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <h2
              class="fonts CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Video
            </h2>
          </div>
        </div>
        <div class="theme-container-small">
          <div
            class="image youtube-video background-grey theme-invitation-animate"
            style="border-radius: 0"
          >
            <AppCardVideo :data="selectedData.invitation" height="300" />
          </div>
        </div>
      </div>
    </div>

    <div
      class="theme-body theme-container"
      style="padding-bottom: 60px"
      id="divia-theme-guest"
    >
      <div class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <h2
              class="fonts CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Reservasi
            </h2>
          </div>
        </div>
      </div>
      <div class="theme-invitation-animate-disable">
        <AppReservation
          innerClass="width width-100"
          :backgroundChatColor="primaryColor"
          :backgroundButtonColor="mainColor"
          textButtonColor="#fff"
          :mainColor="mainColor"
        />
      </div>
    </div>

    <div
      v-if="visibleComment"
      class="theme-body theme-container"
      style="padding-bottom: 60px"
    >
      <div class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <h2
              class="fonts CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Kado Digital
            </h2>
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
            >
              Kirim kado berharga kepada
              {{ selectedData.invitation.title }} jika tidak bisa menghadiri
              pernikahan ini.
            </div>
          </div>
        </div>
      </div>
      <div class="theme-container-small">
        <AppCardDigitalGift
          :data.sync="dataGifts"
          :enableAnimation="true"
          :customMainFont="'VisiaPro'"
          :customButton="'fonts fonts-12 VisiaPro'"
        />
      </div>
    </div>

    <div
      v-if="visibleNote"
      class="theme-body theme-container"
      style="padding-bottom: 60px"
    >
      <div class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <h2
              class="fonts CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Catatan
            </h2>
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
            >
              {{ selectedData.invitation.note }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleSpecialThanks"
      class="theme-body theme-container"
      style="padding-bottom: 60px"
    >
      <div class="theme-padding">
        <div style="text-align: center">
          <h2
            class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
            :style="`color: ${mainColor};`"
          >
            Special Thanks
          </h2>
        </div>
      </div>
      <div class="theme-container">
        <AppCardSpecialThanks
          :data="dataSpecialThanks"
          :customBorderRadius="'0px'"
          :enableAnimation="true"
          :customMainFont="'VisiaPro'"
        />
      </div>
    </div>

    <div
      v-if="selectedData"
      class="theme-body"
      :style="`background-color: ${primaryColor}; padding: 50px 0;`"
    >
      <div class="theme-container">
        <div style="text-align: center">
          <h2
            class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
            :style="`color: ${mainColor};`"
          >
            Kami Bersama
          </h2>
        </div>

        <div class="theme-container-small">
          <div
            style="padding-left: 15px; padding-right: 15px; text-align: center"
          >
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
              style="margin-bottom: 10px"
            >
              Dan di antara tanda-tanda (kebesaran)-Nya ialah Dia menciptakan
              pasangan-pasangan untukmu dari jenismu sendiri, agar kamu
              cenderung dan merasa tenteram kepadanya, dan Dia menjadikan di
              antaramu rasa kasih dan sayang.
            </div>
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
            >
              (Ar-Rum : 21)
            </div>
          </div>
        </div>

        <div class="theme-container-small" style="text-align: center">
          <div
            class="width width-250-px width-center theme-invitation-animate"
            style="padding-top: 50px"
          >
            <AppBorderCircle
              :disableBorder="true"
              :image="
                selectedData.invitation.profile
                  ? invitationImageThumbnailUrl +
                    selectedData.invitation.profile
                  : ''
              "
              :cover="
                selectedData.invitation.profile
                  ? invitationImageCoverUrl + selectedData.invitation.profile
                  : ''
              "
            />
          </div>
          <div class="width width-80 width-mobile width-center content-center">
            <div
              class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
            >
              See You on Our Big Day
            </div>
            <div style="padding-top: 10px">
              <h2
                class="fonts weight-normal CreattionDemo theme-invitation-animate theme-font-second-title"
                :style="`color: ${mainColor};`"
              >
                {{ selectedData.invitation.title }}
              </h2>
            </div>
          </div>
        </div>

        <div class="theme-container-small">
          <div
            style="
              padding-left: 15px;
              padding-right: 15px;
              padding-top: 50px;
              text-align: center;
            "
          >
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
              style="margin-bottom: 15px"
            >
              Merupakan suatu kerhormatan bagi kami apabila Bapak/Ibu/Saudara/i
              berkenan hadir untuk memberikan do'a restu.
            </div>
            <div
              class="fonts black CreattionDemo theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Wassalamualaikum Warahmatullaahi Wabarakaatuh
            </div>
          </div>
        </div>
      </div>

      <div v-if="data.invitation.is_prokes_enable" class="theme-container">
        <div class="theme-padding">
          <div style="text-align: center">
            <div
              class="display-flex center theme-invitation-animate"
              style="padding-bottom: 15px"
            >
              <div class="card-value red">COVID-19</div>
            </div>
            <h2
              class="fonts black CreattionDemo weight-normal theme-invitation-animate theme-font-second-subtitle"
              :style="`color: ${mainColor};`"
            >
              Protokol Kesehatan
            </h2>
            <div
              class="fonts black VisiaPro theme-invitation-animate theme-font-content"
            >
              Stop penyebaran Covid-19 dengan menerapkan protokol kesehatan
            </div>
          </div>
        </div>
        <div class="width width-100">
          <AppCardProkesGrid
            :customMainFont="'VisiaPro'"
            :customBackground="primaryColor"
            :enableAnimation="true"
          />
        </div>
      </div>
    </div>

    <AppGustGreetings
      v-if="visibleGreeting"
      :customMainFont="'CreattionDemo'"
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
        @click="scrollToTarget('divia-theme-header')"
      >
        <i class="fa fa-lg fa-user-friends" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('divia-theme-countdown')"
      >
        <i class="fa fa-lg fa-clock" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('divia-theme-ceremony')"
      >
        <i class="fa fa-lg fa-calendar-alt" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('divia-theme-moment')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('divia-theme-guest')"
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
import AppReservation from '../../../modules/AppReservation'
import AppPopupComment from '../../../modules/AppPopupComment'
import AppImageBorder from '../../../modules/AppImageBorder'
import AppImageCover from '../../../modules/AppImageCover'
import AppBorderTop from '../../../modules/AppBorderTop'
import AppBorderCircle from '../../../modules/AppBorderCircle'
import AppCardProkesGrid from '../../../modules/AppCardProkesGrid'
import AppCardDigitalGift from '../../../modules/AppCardDigitalGift'
import AppCardSpecialThanks from '../../../modules/AppCardSpecialThanks'
import AppGridGallery from '../../../modules/AppGridGallery'
import AppCardEvent from '../../../modules/AppCardEvent'
import AppCardVideo from '../../../modules/AppCardVideo'
import AppPopupComponent from '../../../modules/AppPopupComponent'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import AppGustGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  name: 'App',
  data() {
    return {
      mainColor: '#B6886A',
      primaryColor: '#EDDAD3',
      tertiaryColor: '#E5DAD0',
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
    this.$moment.locale('id')
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
    guestName() {
      return (
        this.selectedData &&
        this.selectedData.guest &&
        this.selectedData.guest.name
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
    AppPopupComponent,
    AppCardVideo,
    AppCardEvent,
    AppGridGallery,
    AppCardDigitalGift,
    AppCardProkesGrid,
    AppGustGreetings,
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
      this.scrollToTarget('divia-theme-header')
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
.divia-time-container {
  border-color: rgba($color: #000, $alpha: 0) !important;
  background-color: rgba($color: #000, $alpha: 0.3) !important;
  width: 90px !important;
  height: 90px !important;
}
.divia-button-date {
  background-color: rgba($color: #000, $alpha: 0.5) !important;
  border-color: rgba($color: #000, $alpha: 0.5) !important;
  color: #b6886a !important;
}
.divia-button-date-reverse {
  background-color: #fff !important;
  border-color: #fff !important;
  color: #b6886a !important;
}
.divia-button-date-content {
  background-color: #b6886a !important;
  border-color: #b6886a !important;
  color: #fff !important;
}
</style>
