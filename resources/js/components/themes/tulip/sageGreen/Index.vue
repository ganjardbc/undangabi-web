<template>
  <div id="App" class="theme" :style="`background-color: ${backgroundColor};`">
    <div
      class="theme-header theme-cover-flex"
      id="lavender-theme-header"
      :style="`background-color: ${mainColor};`"
    >
      <div class="theme-cover-left"></div>
      <div class="theme-cover-right">
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
          <div class="theme-transparent theme-inner-shadow"></div>
        </div>
      </div>
      <div class="theme-single-caption">
        <div class="theme-container post-center-absolute">
          <div
            class="fonts fonts-14 fonts-mobile-12 Lora theme-invitation-animate"
            :style="`color: ${whiteColor}; margin-bottom: 15px;`"
          >
            UNDANGAN PERNIKAHAN
          </div>
          <h1
            class="fonts fonts-42 fonts-mobile-34 white white-mobile weight-normal Gistesy theme-invitation-animate"
            :style="`color: ${primaryColor}; line-height: 1.3;`"
          >
            {{ selectedData.invitation.title }}
          </h1>
          <div v-if="guestName" style="margin-top: 15px">
            <div
              class="fonts fonts-14 fonts-mobile-12 Lora capitalize theme-invitation-animate margin margin-bottom-15px"
              :style="`color: ${whiteColor};`"
            >
              Kepada Yth, Bapak/Ibu/Saudara/i :
            </div>
            <div
              class="fonts fonts-18 fonts-mobile-16 Lora capitalize theme-invitation-animate"
              :style="`color: ${whiteColor};`"
            >
              {{ guestName }}
            </div>
            <div
              v-if="guestAddress"
              class="fonts fonts-14 fonts-mobile-12 Lora capitalize theme-invitation-animate"
              :style="`color: ${whiteColor};`"
            >
              {{ guestAddress }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="theme-counter-container">
      <div class="theme-counter-content" id="lavender-theme-countdown">
        <div
          class="theme-body theme-container"
          :style="`background-color: ${backgroundColor}; padding-bottom: 50px;`"
        >
          <div class="theme-padding" style="text-align: center">
            <h2
              class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Menuju Hari Bahagia
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 black Lora theme-invitation-animate"
            >
              {{ selectedData.invitation.date | moment('dddd, Do MMMM YYYY') }}
            </div>
          </div>
          <VueCountdown
            :time="selectedTime"
            v-slot="{ days, hours, minutes, seconds }"
          >
            <div class="theme-time">
              <div
                class="time-2 theme-invitation-animate"
                :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
              >
                <div class="post-middle">
                  <h4
                    class="fonts fonts-28 fonts-mobile-24 black Gistesy"
                    :style="`color: ${primaryColor};`"
                  >
                    {{ days }}
                  </h4>
                  <p class="fonts fonts-14 fonts-mobile-12 white Lora">Hari</p>
                </div>
              </div>
              <div
                class="time-2 theme-invitation-animate"
                :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
              >
                <div class="post-middle">
                  <h4
                    class="fonts fonts-28 fonts-mobile-24 black Gistesy"
                    :style="`color: ${primaryColor};`"
                  >
                    {{ hours }}
                  </h4>
                  <p class="fonts fonts-14 fonts-mobile-12 white Lora">Jam</p>
                </div>
              </div>
              <div
                class="time-2 theme-invitation-animate"
                :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
              >
                <div class="post-middle">
                  <h4
                    class="fonts fonts-28 fonts-mobile-24 black Gistesy"
                    :style="`color: ${primaryColor};`"
                  >
                    {{ minutes }}
                  </h4>
                  <p class="fonts fonts-14 fonts-mobile-12 white Lora">Menit</p>
                </div>
              </div>
              <div
                class="time-2 theme-invitation-animate"
                :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
              >
                <div class="post-middle">
                  <h4
                    class="fonts fonts-28 fonts-mobile-24 black Gistesy"
                    :style="`color: ${primaryColor};`"
                  >
                    {{ seconds }}
                  </h4>
                  <p class="fonts fonts-14 fonts-mobile-12 white Lora">Detik</p>
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
              class="btn btn-main btn-small-radius fonts fonts-11 Lora"
              :style="`border-color: ${primaryColor}; background-color: ${primaryColor};`"
            >
              Tambah ke Google Calendar
              <i class="icn icn-right fa fa-lw fa-calendar-alt" />
            </a>
          </div>
        </div>
      </div>
    </div>

    <div
      class="theme-background-white"
      :style="`background-color: ${mainColor};`"
    >
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-top: 100px"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Bismillahirahmanirahim
          </div>
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Assalamuallaikum Warahmatullahi Wabarakatuh
          </div>
          <div class="width width-500px width-center width-mobile">
            <div
              class="fonts fonts-14 fonts-mobile-12 Lora theme-invitation-animate margin margin-top-15px"
              :style="`color: ${whiteColor};`"
            >
              Dengan memohon Rahmat dan Ridho Allah SWT kami mengharapkan
              kehadiran Bapak/Ibu/Saudara/i pada acara pernikahan kami.
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="theme-background-white" id="lavender-theme-bride">
      <div v-for="(dt, i) in dataBrides" :key="i" class="width width-100">
        <div
          :class="`theme-header theme-cover-flex theme-cover-profile ${i % 2 === 0 ? 'row-reverse' : ''}`"
        >
          <div class="theme-cover-left"></div>
          <div class="theme-cover-right">
            <div class="theme-cover">
              <div
                class="theme-image bg-white-grey"
                :style="
                  'background-image: url(' +
                  (dt.bride.image ? brideImageCoverUrl + dt.bride.image : '') +
                  ')'
                "
              ></div>
              <div class="theme-transparent theme-inner-shadow"></div>
            </div>
          </div>
          <div class="theme-single-caption theme-single-position">
            <div class="theme-container theme-single-position-bottom-mobile">
              <h1
                class="fonts fonts-42 fonts-mobile-34 black white-mobile weight-normal Gistesy text-shadow-mobile theme-invitation-animate"
                :style="`color: ${mainColor};`"
              >
                {{ dt.bride.name }}
              </h1>
              <div
                class="fonts fonts-14 fonts-mobile-12 black white-mobile Lora text-shadow-mobile theme-invitation-animate"
                v-html="dt.bride.parent"
              ></div>
              <div
                v-if="dt.bride.instagram_link"
                class="theme-single-socmed-button display-flex center theme-bride-socmed theme-invitation-animate"
              >
                <a
                  :href="dt.bride.instagram_link"
                  target="_blank"
                  class="btn btn-main btn-small-radius fonts fonts-11 Lora"
                  :style="`border-color: ${primaryColor}; background-color: ${primaryColor};`"
                >
                  <i class="icn icn-left fab fa-lw fa-instagram"></i>
                  Instagram
                </a>
              </div>
            </div>
          </div>
        </div>
        <div
          v-if="i % 2 === 0"
          class="theme-background-white"
          :style="`background-color: ${mainColor};`"
        >
          <div class="theme-body theme-container">
            <div class="theme-padding" style="text-align: center">
              <div
                class="fonts fonts-24 fonts-mobile-22 white Gistesy weight-normal theme-invitation-animate"
              >
                Dengan
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleEvent"
      class="theme-background-white"
      :style="`background-color: ${mainColor};`"
      id="lavender-theme-ceremony"
    >
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Daftar Acara
          </div>
        </div>
        <div class="theme-container-small">
          <div class="theme-padding">
            <AppCardEvent
              :data.sync="dataEvents"
              :enableAnimation="true"
              :customIconColor="mainColor"
              :customMainColor="mainColor"
              :customMainFont="'Gistesy'"
              :customMainFontSize="'fonts-24 fonts-mobile-22'"
              :customPrimaryFont="'Lora'"
              :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
              :customMainFontWeight="'weight-normal'"
              :customBorderRadius="'0px'"
            />
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleMap"
      class="theme-background-white"
      id="lavender-theme-map"
    >
      <div :style="`background-color: ${mainColor};`">
        <div class="theme-body theme-container">
          <div class="theme-padding" style="text-align: center">
            <div
              class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
              :style="`color: ${primaryColor};`"
            >
              Lokasi Acara
            </div>
            <div
              class="fonts fonts-14 fonts-mobile-12 white Lora theme-invitation-animate"
            >
              {{ selectedData.invitation.description }}
            </div>
          </div>
        </div>
      </div>
      <div class="theme-map theme-invitation-animate" style="height: 400px">
        <GmapMap
          ref="mapRef"
          :center="{ lat: dataLatitude, lng: dataLongitude }"
          :zoom="19"
          style="width: 100%; height: 400px"
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
        style="
          position: relative;
          width: 100%;
          padding-top: 30px;
          padding-bottom: 50px;
        "
      >
        <a
          :href="`http://maps.google.com/maps?q=${dataLatitude},${dataLongitude}`"
          target="_blank"
          class="btn btn-main btn-small-radius fonts fonts-11 Lora"
          :style="`border-color: ${primaryColor}; background-color: ${primaryColor};`"
        >
          Lihat Alamat pada Google-map
          <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
        </a>
      </div>
    </div>

    <div
      v-if="visibleGallery"
      class="theme-background-white"
      id="lavender-theme-moment"
    >
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Galeri Foto
          </div>
        </div>
        <div style="padding: 45px 0">
          <AppGridGallery
            :data.sync="dataGalleries"
            :paginationActiveColor="mainColor"
            :paginationColor="'#555'"
            :paginationPosition="'#ff0000'"
          />
        </div>
      </div>
    </div>

    <div v-if="visibleVideo" class="theme-background-white">
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Video
          </div>
        </div>
        <div class="theme-padding theme-container-small">
          <div
            class="image youtube-video background-grey theme-invitation-animate"
          >
            <AppCardVideo :data="selectedData.invitation" height="300" />
          </div>
        </div>
      </div>
    </div>

    <div v-if="visibleLoveStory" class="theme-background-white">
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Our Love Stories
          </div>
        </div>
        <div class="theme-padding theme-container-small">
          <AppCardLoveStory
            :data.sync="dataLoveStories"
            :enableAnimation="true"
            :customMainColor="mainColor"
            :customPrimaryColor="blackColor"
            :customIconColor="whiteColor"
            :customMainFont="'Gistesy'"
            :customMainFontSize="'fonts-24 fonts-mobile-22'"
            :customPrimaryFont="'Lora'"
            :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
            :customMainFontWeight="'weight-normal'"
            :customBorderRadius="'0px'"
          />
        </div>
      </div>
    </div>

    <div
      class="theme-background-white"
      :style="`background-color: ${mainColor};`"
      id="lavender-theme-guest"
    >
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Reservasi
          </div>
        </div>
        <div class="theme-padding">
          <AppReservation
            innerClass="width width-100"
            :backgroundChatColor="primaryColor"
            :backgroundButtonColor="mainColor"
            textButtonColor="#fff"
            :mainColor="mainColor"
          />
        </div>
      </div>
      <div v-if="visibleComment" class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Kado Digital
          </div>
        </div>
        <div class="theme-container-small">
          <div class="theme-padding">
            <AppCardDigitalGift
              :data.sync="dataGifts"
              :enableAnimation="true"
              :customMainFont="'Lora'"
              :customButton="'fonts fonts-12 Lora'"
            />
          </div>
        </div>
      </div>
    </div>

    <div class="theme-body width width-100">
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="300px"
        :enableSizeMobile="true"
        customImageBottomLeft="/images/tulip-left.png"
      />

      <div v-if="visibleSpecialThanks" class="theme-background-white">
        <div class="theme-body theme-container">
          <div
            class="theme-padding"
            style="text-align: center; padding-bottom: 0"
          >
            <div
              class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Special Thanks
            </div>
          </div>
          <div class="theme-padding">
            <AppCardSpecialThanks
              :data="dataSpecialThanks"
              :customBorderRadius="'0px'"
              :enableAnimation="true"
              :customMainFont="'Lora'"
            />
          </div>
        </div>
      </div>

      <div v-if="visibleNote" class="theme-background-white">
        <div class="theme-body theme-container">
          <div
            class="theme-padding"
            style="text-align: center; padding-bottom: 0"
          >
            <div
              class="fonts fonts-24 fonts-mobile-22 black Gistesy weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Catatan
            </div>
          </div>
          <div class="theme-padding theme-container">
            <div
              class="fonts fonts-14 fonts-mobile-12 black Lora align-center theme-invitation-animate"
              v-html="selectedData.invitation.note"
            />
          </div>
        </div>
      </div>

      <div class="theme-background-white">
        <div class="theme-body theme-container">
          <div
            class="theme-padding theme-container"
            style="padding-bottom: 10px"
          >
            <div
              class="fonts fonts-24 fonts-mobile-22 black Gistesy align-center weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Kami Yang Berbahagia
            </div>
          </div>
          <div class="width width-250-px width-center theme-invitation-animate">
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
          <div
            class="fonts fonts-42 fonts-mobile-34 white weight-normal Gistesy align-center theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            {{ selectedData.invitation.title }}
          </div>
          <div class="theme-padding theme-container" style="padding-bottom: 0">
            <div class="width width-500px width-center width-mobile">
              <div
                v-if="visibleClosingQuotes"
                class="fonts fonts-14 fonts-mobile-12 grey Lora align-center theme-invitation-animate"
                v-html="selectedData.invitation.closing_quotes"
              />
              <div
                v-else
                class="fonts fonts-14 fonts-mobile-12 grey Lora align-center theme-invitation-animate"
              >
                Merupakan suatu kehormatan dan kebahagiaan bagi kami apabila
                Bapak/Ibu/Saudara/i berkenan hadir untuk memberikan do' a restu
                kepada kami.
              </div>
            </div>
          </div>
          <div class="theme-padding theme-container" style="padding-bottom: 0">
            <div
              class="fonts fonts-14 fonts-mobile-12 grey Lora align-center theme-invitation-animate"
            >
              Atas kehadiran dan do' a restunya <br />
              kami ucapkan terima kasih.
            </div>
          </div>
          <div class="theme-padding theme-container">
            <div
              class="fonts fonts-24 fonts-mobile-22 black Gistesy align-center weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Wassalamuallaikum Warahmatullahi Wabarakatuh
            </div>
          </div>
        </div>
      </div>
    </div>

    <FooterSecondComponent
      :backgroundColor="mainColor"
      textColor="#fff"
      buttonBackgroundColor="#fff"
      :buttonBorderColor="mainColor"
      :textButtonColor="mainColor"
    />

    <AppGustGreetings
      :customBackgroundColor="whiteColor"
      :customMainColor="mainColor"
      :customMainFont="'Gistesy'"
      :visible="visibleGreeting"
      :onClick="closeGuestGreeting"
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

    <div
      class="theme-navigation theme-2"
      :style="`background-color: ${mainColor};`"
    >
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-theme-header')"
      >
        <i class="fa fa-lg fa-clock" :style="`color: ${whiteColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-theme-bride')"
      >
        <i
          class="fa fa-lg fa-user-friends"
          :style="`color: ${whiteColor};`"
        ></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-theme-ceremony')"
      >
        <i
          class="fa fa-lg fa-calendar-alt"
          :style="`color: ${whiteColor};`"
        ></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-theme-map')"
      >
        <i
          class="fa fa-lg fa-map-marker-alt"
          :style="`color: ${whiteColor};`"
        ></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-theme-moment')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${whiteColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-theme-guest')"
      >
        <i
          class="fa fa-lg fa-calendar-check"
          :style="`color: ${whiteColor};`"
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
import AppCardDigitalGift from '../../../modules/AppCardDigitalGift'
import AppCardSpecialThanks from '../../../modules/AppCardSpecialThanks'
import AppGridGallery from '../../../modules/AppGridGallery'
import AppCardEvent from '../../../modules/AppCardEvent'
import AppCardLoveStory from '../../../modules/AppCardLoveStory'
import AppCardVideo from '../../../modules/AppCardVideo'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import AppGustGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  name: 'App',
  data() {
    return {
      mainColor: '#9CAE87',
      primaryColor: '#EDD4AA',
      backgroundColor: '#FFFFFF',
      whiteColor: '#FFFFFF',
      blackColor: '#1A1507',
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
    visibleClosingQuotes() {
      return this.selectedData && this.selectedData.invitation.closing_quotes
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
    AppCardLoveStory,
    AppGridGallery,
    AppCardDigitalGift,
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
      this.scrollToTarget('lavender-theme-header')
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
.javanese-time-container {
  border-color: rgba($color: #000, $alpha: 0) !important;
  background-color: rgba($color: #000, $alpha: 0.3) !important;
  width: 90px !important;
  height: 90px !important;
}
.javanese-button-date {
  background-color: rgba($color: #000, $alpha: 0.5) !important;
  border-color: rgba($color: #000, $alpha: 0.5) !important;
  color: #38470b !important;
}
.javanese-button-date-reverse {
  background-color: #f1d6ab !important;
  border-color: #f1d6ab !important;
  color: #38470b !important;
}
.javanese-button-date-content {
  background-color: #38470b !important;
  border-color: #38470b !important;
  color: #fff !important;
}
</style>
