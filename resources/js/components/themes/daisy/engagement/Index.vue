<template>
  <div id="App" class="theme" style="background-color: #f7f8f7">
    <div id="daisy-theme-bride">
      <div
        class="theme-body theme-container"
        style="padding-top: 30px; padding-bottom: 0px"
      >
        <div class="theme-padding">
          <div class="theme-container-small" style="text-align: center">
            <div
              class="width width-200-px width-center theme-invitation-animate"
              style="padding-bottom: 15px"
            >
              <div
                class="image image-padding"
                :style="`background-image: url(${'/images/custom-cover-top.png'}); background-color: rgba(0,0,0,0)`"
              ></div>
            </div>
            <div
              class="width width-80 width-mobile width-center content-center"
              style="padding-bottom: 30px"
            >
              <div
                class="theme-invitation-animate"
                style="padding-bottom: 20px; padding-top: 20px"
              >
                <h2
                  class="fonts fonts-16 black semibold RoxboroughCF"
                  style="color: #5c786d"
                >
                  Bismillahirrahmanirrahim
                </h2>
              </div>
              <div class="theme-invitation-animate">
                <div class="fonts fonts-14 black ViaodaLibre">
                  Assalamu`alaikum Warahmatullaahi Wabarakaatuh
                </div>
                <div class="fonts fonts-14 black ViaodaLibre">
                  Dengan memohon rahmat dan ridho Allah SWT, kami bermaksud
                  mengundang Bapak/Ibu/Saudara/i untuk menghadiri pertunangan
                  putra-putri kami.
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body theme-container">
        <div class="theme-padding" style="padding-top: 0">
          <div
            v-for="(dt, i) in dataBrides"
            :key="i"
            class="width width-full content-center"
          >
            <div
              class="content-center"
              style="width: calc(100% - 30px); margin: auto"
            >
              <div
                class="fonts fonts-32 black semibold RoxboroughCF theme-invitation-animate"
                style="color: #5c786d"
              >
                {{ dt.bride.name }}
              </div>
              <div class="fonts fonts-12 black theme-invitation-animate">
                {{ dt.bride.nick_name }}
              </div>
              <div
                class="fonts fonts-11 black theme-invitation-animate"
                style="margin-top: 2px"
                v-html="dt.bride.parent"
              ></div>
              <div
                v-if="dt.bride.instagram_link"
                style="
                  padding-top: 20px;
                  text-align: center;
                  width: 40px;
                  margin: auto;
                "
              >
                <a :href="dt.bride.instagram_link" target="_blank">
                  <button
                    class="btn btn-icon btn-sekunder btn-small-radius theme-invitation-animate"
                  >
                    <i
                      class="fab fa-lg fa-instagram"
                      style="color: #5c786d"
                    ></i>
                  </button>
                </a>
              </div>
            </div>
            <div v-if="i < dataBrides.length - 1">
              <div
                class="theme-invitation-animate"
                style="padding-top: 30px; padding-bottom: 30px"
              >
                <span class="fonts fonts-12 black semibold">dengan</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="theme-body theme-container" id="daisy-theme-ceremony">
      <div class="theme-padding">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-bottom: 30px"
        >
          <h2 class="post-middle fonts fonts-12 black">
            ~ Hari & Acara Pertunangan ~
          </h2>
        </div>
        <VueCountdown
          :time="selectedTime"
          v-slot="{ days, hours, minutes, seconds }"
        >
          <div class="theme-time theme-wrap">
            <div
              class="width width-row-4 width-row-mobile-2 display-flex center"
            >
              <div
                class="time-3 box-shadow theme-invitation-animate"
                style="border-color: #5c786d; background-color: #cbd3bf"
              >
                <div class="post-middle">
                  <h2 class="fonts fonts-28 black RoxboroughCF">{{ days }}</h2>
                  <p class="fonts fonts-11 black">Hari</p>
                </div>
              </div>
            </div>
            <div
              class="width width-row-4 width-row-mobile-2 display-flex center"
            >
              <div
                class="time-3 box-shadow theme-invitation-animate"
                style="border-color: #5c786d; background-color: #cbd3bf"
              >
                <div class="post-middle">
                  <h2 class="fonts fonts-28 black RoxboroughCF">{{ hours }}</h2>
                  <p class="fonts fonts-11 black">Jam</p>
                </div>
              </div>
            </div>
            <div
              class="width width-row-4 width-row-mobile-2 display-flex center"
            >
              <div
                class="time-3 box-shadow theme-invitation-animate"
                style="border-color: #5c786d; background-color: #cbd3bf"
              >
                <div class="post-middle">
                  <h2 class="fonts fonts-28 black RoxboroughCF">
                    {{ minutes }}
                  </h2>
                  <p class="fonts fonts-11 black">Menit</p>
                </div>
              </div>
            </div>
            <div
              class="width width-row-4 width-row-mobile-2 display-flex center"
            >
              <div
                class="time-3 box-shadow theme-invitation-animate"
                style="border-color: #5c786d; background-color: #cbd3bf"
              >
                <div class="post-middle">
                  <h2 class="fonts fonts-28 black RoxboroughCF">
                    {{ seconds }}
                  </h2>
                  <p class="fonts fonts-11 black">Detik</p>
                </div>
              </div>
            </div>
          </div>
        </VueCountdown>
        <div
          class="display-flex center theme-invitation-animate"
          style="padding-top: 60px"
        >
          <a
            :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan Pertunangan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
            target="_blank"
          >
            <button
              class="btn btn-main"
              :style="`background-color: #5C786D; border-color: #5C786D; color: #fff;`"
            >
              Tambah ke Google Calendar
              <i class="icn icn-right fa fa-lw fa-calendar-alt" />
            </button>
          </a>
        </div>
      </div>
    </div>

    <div v-if="visibleEvent" class="theme-body theme-container">
      <div class="theme-padding">
        <AppCardEventTimeline
          :data.sync="selectedData.events"
          :enableAnimation="true"
          :customIconColor="'#5C786D'"
          :customMainColor="'#5C786D'"
          :customMainFont="'RoxboroughCF'"
        />
      </div>

      <div style="padding-bottom: 30px"></div>
    </div>

    <div
      v-if="visibleMap"
      class="theme-body theme-container"
      id="daisy-theme-map"
    >
      <div style="padding-bottom: 60px"></div>

      <div class="theme-body theme-container">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-bottom: 30px"
        >
          <h2 class="post-middle fonts fonts-12 black">
            ~ Lokasi Pertunangan ~
          </h2>
        </div>
      </div>

      <div
        class="theme-map border-radius theme-invitation-animate"
        style="height: 500px"
      >
        <GmapMap
          ref="mapRef"
          :center="{
            lat: selectedData.invitation.latitude,
            lng: selectedData.invitation.longitude,
          }"
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
              google &&
              new google.maps.LatLng(
                selectedData.invitation.latitude,
                selectedData.invitation.longitude
              )
            "
          />
        </GmapMap>
      </div>

      <div style="padding-bottom: 30px"></div>

      <div class="display-flex center theme-invitation-animate">
        <a
          :href="`http://maps.google.com/maps?q=${selectedData.invitation.latitude},${selectedData.invitation.longitude}`"
          target="_blank"
        >
          <button
            class="btn btn-main"
            :style="`background-color: #5C786D; border-color: #5C786D; color: #fff;`"
          >
            Lihat Alamat pada Google-map
            <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
          </button>
        </a>
      </div>

      <div style="padding-bottom: 30px"></div>
    </div>

    <div class="theme-body theme-container" id="daisy-theme-guest">
      <div style="padding-bottom: 60px"></div>

      <div class="theme-body">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-bottom: 30px"
        >
          <h2 class="post-middle fonts fonts-12 black">~ Reservasi ~</h2>
        </div>
        <div class="width width-full theme-invitation-animate-disable">
          <AppReservation
            :innerClass="'width width-full'"
            :disableRSVPField="false"
            :enableEnglish="false"
            :guest="guest"
            :data.sync="selectedData.guest"
            :invID.sync="selectedData.invitation.id"
            :invStringID.sync="selectedData.invitation.invitation_id"
            :invitation.sync="selectedData.invitation"
            backgroundChatColor="#F7F8F7"
            backgroundButtonColor="#5C786D"
            textButtonColor="#fff"
            mainColor="#5C786D"
          />
        </div>
      </div>

      <div style="padding-bottom: 30px"></div>
    </div>

    <div v-if="visibleComment" class="theme-body" id="daisy-theme-gift">
      <div class="theme-container theme-padding">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-bottom: 15px"
        >
          <h2 class="post-middle fonts fonts-12 black">~ Kado Digital ~</h2>
        </div>
        <div class="theme-container-small">
          <AppCardDigitalGift
            :customBorderRadius="'0px'"
            :data.sync="selectedData.comments"
            :enableAnimation="true"
          />
        </div>
      </div>
    </div>

    <div class="theme-body theme-container">
      <div class="theme-padding">
        <div class="theme-container-small" style="text-align: center">
          <div class="width width-80 width-mobile width-center content-center">
            <div
              class="fonts fonts-14 black ViaodaLibre theme-invitation-animate"
              style="margin-bottom: 10px"
            >
              Merupakan suatu kerhormatan bagi kami apabila Bapak/Ibu/Saudara/i
              berkenan hadir untuk memberikan do'a restu.
            </div>
            <div
              class="fonts fonts-14 black ViaodaLibre theme-invitation-animate"
            >
              Wassalamualaikum Warahmatullaahi Wabarakaatuh
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="selectedData" class="theme-body theme-container">
      <div class="theme-padding">
        <div class="theme-container-small" style="text-align: center">
          <div
            class="width width-200-px width-center theme-invitation-animate"
            style="padding-bottom: 15px"
          >
            <div
              class="image image-padding"
              :style="`background-image: url(${'/images/custom-cover-top.png'}); background-color: rgba(0,0,0,0)`"
            ></div>
          </div>
          <div
            class="width width-80 width-mobile width-center content-center"
            style="padding-bottom: 30px"
          >
            <div class="fonts fonts-12 black theme-invitation-animate">
              See You on Our Big Day
            </div>
            <div
              class="theme-invitation-animate"
              style="padding-bottom: 20px; padding-top: 20px"
            >
              <h2
                class="fonts fonts-32 black semibold RoxboroughCF"
                style="color: #5c786d"
                v-html="generateTitle"
              ></h2>
            </div>
          </div>
          <div class="display-flex center theme-invitation-animate">
            <a
              :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan Pertunangan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
              target="_blank"
            >
              <button
                class="btn btn-main"
                :style="`background-color: #5C786D; border-color: #5C786D; color: #fff;`"
              >
                Tambah ke Google Calendar
                <i class="icn icn-right fa fa-lw fa-calendar-alt" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div v-if="visibleSpecialThanks" class="theme-body theme-container">
      <div class="theme-padding">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-top: 0; padding-bottom: 40px"
        >
          <h2
            class="fonts fonts-16 black semibold RoxboroughCF"
            style="color: #5c786d"
          >
            Special Thanks
          </h2>
        </div>
        <AppCardSpecialThanks
          :data="selectedData.specialthanks"
          :customBorderRadius="'0px'"
          :enableAnimation="true"
        />
      </div>
    </div>

    <div style="position: relative">
      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="
              width: 80%;
              margin: auto;
              text-align: center;
              padding-bottom: 20px;
              padding-top: 10px;
            "
          >
            <div class="display-flex center" style="padding-bottom: 32px">
              <div class="card-value red">COVID-19</div>
            </div>
            <h2
              class="post-middle fonts fonts-16 black semibold RoxboroughCF"
              style="color: #5c786d"
            >
              Protokol Kesehatan
            </h2>
            <div
              class="post-middle fonts fonts-11 black"
              style="margin-bottom: 10px"
            >
              Stop penyebaran Covid-19 dengan menerapkan protokol kesehatan
            </div>
          </div>
          <AppCardProkesGrid
            customBackground="#CBD3BF"
            :enableAnimation="true"
          />
        </div>

        <div style="padding-bottom: 60px"></div>
      </div>
    </div>

    <AppGustGreetings
      v-if="visibleGreeting"
      :customBackgroundColor="'#F8F9F5'"
      :customMainColor="'#5C786D'"
      :customMainFont="'RoxboroughCF'"
      :onClick="closeGuestGreeting"
    />

    <FooterSecondComponent
      backgroundColor="#CBD3BF"
      textColor="rgb(26, 21, 7)"
      buttonBackgroundColor="#5C786D"
      buttonBorderColor="#5C786D"
      textButtonColor="#fff"
      :enableBlackLogo="true"
    />

    <div class="theme-play-song">
      <button
        v-if="!isPlayed"
        class="btn btn-radius btn-black btn-small-radius"
        @click="playAudio"
      >
        <i class="icn icn-left fa fa-lw fa-play"></i> Play
      </button>
      <button
        v-else
        class="btn btn-radius btn-black btn-small-radius"
        @click="pauseAudio"
      >
        <i class="icn icn-left fa fa-lw fa-pause"></i> Pause
      </button>
    </div>

    <div class="theme-navigation">
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('daisy-theme-bride')"
      >
        <i class="fa fa-lg fa-user-friends" style="color: #5c786d"></i>
      </button>
      <button
        v-if="!visibleBronze"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('daisy-theme-ceremony')"
      >
        <i class="fa fa-lg fa-calendar-alt" style="color: #5c786d"></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('daisy-theme-map')"
      >
        <i class="fa fa-lg fa-map-marker-alt" style="color: #5c786d"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('daisy-theme-guest')"
      >
        <i class="fa fa-lg fa-calendar-check" style="color: #5c786d"></i>
      </button>
      <button
        v-if="visibleComment"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('daisy-theme-gift')"
      >
        <i class="fa fa-lg fa-gift" style="color: #5c786d"></i>
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
import AppImageBanner from '../../../modules/AppImageBanner'
import AppBorderCircle from '../../../modules/AppBorderCircle'
import AppCardProkesGrid from '../../../modules/AppCardProkesGrid'
import AppCardDigitalGift from '../../../modules/AppCardDigitalGift'
import AppCardSpecialThanks from '../../../modules/AppCardSpecialThanks'
import AppCardEventTimeline from '../../../modules/AppCardEventTimeline'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import AppGustGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  name: 'App',
  data() {
    return {
      show: false,
      showSecond: false,
      visibleGift: false,
      visibleGreeting: true,
      isPlayed: false,
      counting: false,
      guest: null,
      audio: null,
    }
  },
  mounted() {
    const pathSong = this.data ? this.songUrl + this.data.song.song : ''
    this.audio = new Audio(pathSong)
    this.$moment.locale('id')
  },
  computed: {
    google: gmapApi,
    generateTitle() {
      return this.selectedData.invitation.title.replace(/[ ]/g, '<br>')
    },
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
    dataBrides() {
      return this.selectedData && this.selectedData.brides
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
    AppCardEventTimeline,
    AppCardSpecialThanks,
    AppCardDigitalGift,
    AppCardProkesGrid,
    AppGustGreetings,
    AppBorderCircle,
    AppImageBanner,
    AppBorderTop,
    AppImageBorder,
    AppImageCover,
    AppPopupComment,
    AppReservation,
    VueCountdown,
    FooterComponent,
    FooterSecondComponent,
  },
  methods: {
    onShowTheme() {
      setTimeout(() => {
        this.show = true
      }, 0)
    },

    closeGuestGreeting() {
      document.body.style.overflowY = 'auto'
      this.visibleGreeting = false
      this.scrollToTarget('daisy-theme-bride')
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
