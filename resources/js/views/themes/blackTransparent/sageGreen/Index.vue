<template>
  <div id="App" class="theme">
    <div
      class="display-flex center"
      style="position: fixed; top: 0; left: 0; z-index: 0"
    >
      <img
        :src="`${selectedData.invitation.profile ? invitationImageCoverUrl + selectedData.invitation.profile : ''}`"
        style="max-height: 100vh"
        alt="cover"
      />
    </div>
    <div id="lavender-header" class="theme-header full">
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
        <div class="theme-transparent theme-inner-shadow">
          <div
            class="theme-container display-flex column flex-end"
            style="height: 100%"
          >
            <div
              class="width width-100 border-radius margin margin-bottom-15px theme-invitation-animate"
              :style="`background-color: ${transparentPrimaryColor};`"
            >
              <div
                class="padding padding-15px display display-flex display-mobile space-between align-center"
              >
                <div
                  class="width width-50 width-mobile padding padding-mobile-bottom-15px"
                >
                  <div
                    class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular align-center-mobile theme-invitation-animate"
                  >
                    THE WEDDING OF
                  </div>
                  <div
                    class="fonts fonts-28 fonts-mobile-22 weight-normal white CormorantGaramondRegular align-center-mobile theme-invitation-animate"
                  >
                    {{ selectedData.invitation.title }}
                  </div>
                </div>
                <div class="width width-50 width-mobile">
                  <VueCountdown
                    :time="selectedTime"
                    v-slot="{ days, hours, minutes, seconds }"
                  >
                    <div
                      class="theme-time border-radius"
                      style="overflow: hidden"
                    >
                      <div
                        class="time theme-invitation-animate"
                        :style="`background-color: ${transparentPrimaryColor};`"
                      >
                        <div class="post-middle">
                          <div
                            class="fonts fonts-28 fonts-mobile-24 white CormorantGaramondRegular"
                            style="line-height: 1"
                          >
                            {{ days }}
                          </div>
                          <div
                            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular"
                          >
                            Hari
                          </div>
                        </div>
                      </div>
                      <div
                        class="time theme-invitation-animate"
                        :style="`background-color: ${transparentPrimaryColor};`"
                      >
                        <div class="post-middle">
                          <div
                            class="fonts fonts-28 fonts-mobile-24 white CormorantGaramondRegular"
                            style="line-height: 1"
                          >
                            {{ hours }}
                          </div>
                          <div
                            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular"
                          >
                            Jam
                          </div>
                        </div>
                      </div>
                      <div
                        class="time theme-invitation-animate"
                        :style="`background-color: ${transparentPrimaryColor};`"
                      >
                        <div class="post-middle">
                          <div
                            class="fonts fonts-28 fonts-mobile-24 white CormorantGaramondRegular"
                            style="line-height: 1"
                          >
                            {{ minutes }}
                          </div>
                          <div
                            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular"
                          >
                            Menit
                          </div>
                        </div>
                      </div>
                      <div
                        class="time theme-invitation-animate"
                        :style="`background-color: ${transparentPrimaryColor};`"
                      >
                        <div class="post-middle">
                          <div
                            class="fonts fonts-28 fonts-mobile-24 white CormorantGaramondRegular"
                            style="line-height: 1"
                          >
                            {{ seconds }}
                          </div>
                          <div
                            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular"
                          >
                            Detik
                          </div>
                        </div>
                      </div>
                    </div>
                  </VueCountdown>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="theme-body bg-transparent-60">
      <div class="theme-body theme-container">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Bismillahirahmanirahim
          </div>
          <div
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Assalamuallaikum Warahmatullahi Wabarakatuh
          </div>
          <div class="width width-500px width-center width-mobile">
            <div
              v-if="visibleOpeningQuotes"
              class="fonts fonts-14 fonts-mobile-12 Lora theme-invitation-animate margin margin-top-15px"
              :style="`color: ${primaryColor};`"
              v-html="selectedData.invitation.greeting_quotes"
            />
            <div
              v-else
              class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular theme-invitation-animate margin margin-top-15px"
              :style="`color: ${whiteColor};`"
            >
              Dengan memohon Rahmat dan Ridho Allah SWT kami mengharapkan
              kehadiran Bapak/Ibu/Saudara/i pada acara pernikahan kami.
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      id="lavender-bride"
      class="theme-body theme-background-white display-flex display-mobile"
      :style="`background-color: ${primaryColor};`"
    >
      <div
        v-for="(dt, i) in dataBrides"
        :key="i"
        class="width width-50 width-mobile"
      >
        <div class="theme-header full">
          <div class="theme-cover">
            <div
              class="theme-image"
              :style="
                'background-image: url(' +
                (dt.bride.image ? brideImageCoverUrl + dt.bride.image : '') +
                ')'
              "
            ></div>
            <div class="theme-transparent theme-inner-shadow">
              <div class="display-flex column flex-end" style="height: 100%">
                <div class="padding padding-15px theme-invitation-animate">
                  <div
                    class="width width-400px width-mobile width-center border-radius"
                    :style="`background-color: ${transparentPrimaryColor};`"
                  >
                    <div class="padding padding-15px">
                      <div
                        class="fonts fonts-28 fonts-mobile-22 weight-normal white CormorantGaramondRegular align-center theme-invitation-animate"
                      >
                        {{ dt.bride.name }}
                      </div>
                      <div
                        class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular align-center theme-invitation-animate"
                        v-html="dt.bride.parent"
                      ></div>
                      <div
                        v-if="dt.bride.instagram_link"
                        class="theme-single-socmed-button display-flex center theme-bride-socmed theme-invitation-animate margin margin-top-15px"
                      >
                        <a
                          :href="dt.bride.instagram_link"
                          target="_blank"
                          class="btn btn-main btn-small-radius fonts fonts-11 QuicksandRegular"
                          :style="`border-color: ${primaryColor}; background-color: ${primaryColor}; color: ${blackColor};`"
                        >
                          <i class="icn icn-left fab fa-lw fa-instagram"></i>
                          Instagram
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div
          v-if="i % 2 === 0"
          class="post-middle-absolute post-mobile-none"
          style="z-index: 1"
        >
          <div class="width width-80px width-mobile">
            <div
              class="display-flex column center align-center"
              style="height: 80px"
            >
              <div
                class="fonts fonts-28 fonts-mobile-18 black black-mobile CormorantGaramondRegular weight-normal theme-invitation-animate"
                :style="`color: ${primaryColor}; line-height: 1;`"
              >
                <i class="fa fa-lg fa-heart"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleEvent"
      class="theme-body bg-transparent-60"
      id="lavender-ceremony"
    >
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
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
              :customBackgroundColor="transparentPrimaryColor"
              :customIconColor="blackColor"
              :customIconBgColor="primaryColor"
              :customMainColor="primaryColor"
              :customMainFont="'CormorantGaramondRegular'"
              :customMainFontSize="'fonts-24 fonts-mobile-20'"
              :customPrimaryColor="whiteColor"
              :customPrimaryFont="'QuicksandRegular'"
              :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
              :customMainFontWeight="'weight-normal'"
              :customBorderRadius="'12px'"
            />
            <div
              class="display-flex center theme-invitation-animate"
              style="padding-top: 35px"
            >
              <a
                :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
                target="_blank"
                class="btn btn-main btn-small-radius fonts fonts-11 QuicksandRegular"
                :style="`border-color: ${mainColor}; background-color: ${mainColor}; color: ${blackColor}`"
              >
                <i class="icn icn-left fa fa-lw fa-calendar-alt" /> Tambah ke
                Google Calendar
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleMap"
      class="theme-body bg-transparent-60"
      id="lavender-map"
    >
      <div class="theme-body theme-container">
        <div class="theme-padding" style="text-align: center">
          <div
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Lokasi Acara
          </div>
          <div
            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular theme-invitation-animate"
          >
            {{ selectedData.invitation.description }}
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
          class="btn btn-main btn-small-radius fonts fonts-11 QuicksandRegular"
          :style="`border-color: ${primaryColor}; background-color: ${primaryColor}; color: ${blackColor};`"
        >
          Lihat Alamat pada Google-map
          <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
        </a>
      </div>
    </div>

    <div
      v-if="visibleGallery"
      class="theme-body bg-transparent-60"
      id="lavender-moment"
    >
      <div class="theme-body">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Galeri Foto
          </div>
        </div>
        <div class="theme-padding theme-container-small" style="padding-top: 0">
          <div class="padding padding-left-25px padding-right-25px">
            <div class="theme-header small">
              <div class="theme-cover">
                <AppSlideGallery
                  :disabledMargin="true"
                  :data.sync="dataGalleries"
                  :navigationEnabled="true"
                  :paginationEnabled="false"
                  :paginationActiveColor="mainColor"
                  :paginationColor="'#555'"
                  :navigationColor="mainColor"
                />
              </div>
            </div>
          </div>
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
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
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

    <div v-if="visibleLoveStory" class="theme-body bg-transparent-60">
      <div class="theme-body theme-container">
        <div class="theme-padding" style="text-align: center">
          <div
            class="fonts fonts-24 fonts-mobile-20 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Our Love Stories
          </div>
        </div>
        <div class="theme-padding theme-container-small">
          <AppCardLoveStory
            :data.sync="dataLoveStories"
            :enableAnimation="true"
            :customMainColor="primaryColor"
            :customPrimaryColor="whiteColor"
            :customIconColor="blackColor"
            :customMainFont="'CormorantGaramondRegular'"
            :customMainFontSize="'fonts-24 fonts-mobile-20'"
            :customPrimaryFont="'QuicksandRegular'"
            :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
            :customMainFontWeight="'weight-normal'"
            :customBorderRadius="'12px'"
          />
        </div>
      </div>
    </div>

    <div
      class="theme-body"
      :style="`background-color: ${primaryColor};`"
      id="lavender-guest"
    >
      <div class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${blackColor};`"
          >
            Reservasi
          </div>
        </div>
        <div class="theme-padding">
          <AppReservation
            innerClass="width width-100"
            :backgroundChatColor="whiteColor"
            :backgroundButtonColor="primaryColor"
            :textButtonColor="blackColor"
            :mainColor="primaryColor"
          />
        </div>
      </div>
      <div v-if="visibleComment" class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 black CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${blackColor};`"
          >
            Kado Digital
          </div>
        </div>
        <div class="theme-container-small">
          <div class="theme-padding">
            <AppCardDigitalGift
              :data.sync="dataGifts"
              :enableAnimation="true"
              :customMainFont="'QuicksandRegular'"
              :customButton="'fonts fonts-12 QuicksandRegular'"
              :customBorderRadius="'12px'"
            />
          </div>
        </div>
      </div>
    </div>

    <div class="theme-body bg-transparent-60">
      <div v-if="visibleSpecialThanks" class="theme-body theme-container">
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Special Thanks
          </div>
        </div>
        <div class="theme-padding">
          <AppCardSpecialThanks
            :data="dataSpecialThanks"
            :customBorderRadius="'12px'"
            :enableAnimation="true"
            :customMainFont="'QuicksandRegular'"
          />
        </div>
      </div>

      <div
        v-if="selectedData.invitation.note"
        class="theme-body theme-container"
      >
        <div
          class="theme-padding"
          style="text-align: center; padding-bottom: 0"
        >
          <div
            class="fonts fonts-24 fonts-mobile-22 white CormorantGaramondRegular weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Catatan
          </div>
        </div>
        <div class="theme-padding theme-container">
          <div
            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular align-center theme-invitation-animate"
            v-html="selectedData.invitation.note"
          ></div>
        </div>
      </div>

      <div v-if="visibleClosingQuotes" class="theme-body theme-container">
        <div class="theme-padding theme-container-small">
          <div
            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular align-center theme-invitation-animate"
            v-html="selectedData.invitation.closing_quotes"
          ></div>
        </div>
      </div>

      <div class="theme-body theme-container">
        <div class="theme-padding theme-container" style="padding-bottom: 10px">
          <div
            class="fonts fonts-24 fonts-mobile-22 white CormorantGaramondRegular align-center weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Kami Yang Berbahagia
          </div>
        </div>
        <div class="width width-250-px width-center theme-invitation-animate">
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
        <div
          class="fonts fonts-42 fonts-mobile-34 white weight-normal CormorantGaramondRegular align-center theme-invitation-animate"
          :style="`color: ${primaryColor};`"
        >
          {{ selectedData.invitation.title }}
        </div>
        <div class="theme-padding theme-container" style="padding-bottom: 0">
          <div class="width width-500px width-center width-mobile">
            <div
              class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular align-center theme-invitation-animate"
            >
              Merupakan suatu kehormatan dan kebahagiaan bagi kami apabila
              Bapak/Ibu/Saudara/i berkenan hadir untuk memberikan do' a restu
              kepada kedua mempelai.
            </div>
          </div>
        </div>
        <div class="theme-padding theme-container" style="padding-bottom: 0">
          <div
            class="fonts fonts-14 fonts-mobile-12 white QuicksandRegular align-center theme-invitation-animate"
          >
            Atas kehadiran dan do' a restunya <br />
            kami ucapkan terima kasih.
          </div>
        </div>
        <div class="theme-padding theme-container">
          <div
            class="fonts fonts-24 fonts-mobile-20 black CormorantGaramondRegular align-center weight-normal theme-invitation-animate"
            :style="`color: ${primaryColor};`"
          >
            Wassalamuallaikum Warahmatullahi Wabarakatuh
          </div>
        </div>
      </div>
    </div>

    <FooterSecondComponent
      :backgroundColor="primaryColor"
      :textColor="blackColor"
      :buttonBackgroundColor="blackColor"
      :buttonBorderColor="blackColor"
      :textButtonColor="primaryColor"
      :enableBlackLogo="true"
    />

    <AppGuestGreetings
      :customBackgroundColor="transparentPrimaryColor"
      :customMainTextColor="whiteColor"
      :customPrimaryTextColor="whiteColor"
      :customMainColor="primaryColor"
      :customPrimaryColor="whiteColor"
      :customButtonColor="primaryColor"
      :customButtonTextColor="blackColor"
      :visible="visibleGreeting"
      :onClick="closeGuestGreeting"
    />

    <AppPlaySong
      :label="songName"
      :isPlayed="isPlayed"
      @playAudio="playAudio"
      @pauseAudio="pauseAudio"
      style="z-index: 2"
    />

    <div
      class="theme-navigation theme-2"
      :style="`background-color: ${primaryColor}; z-index: 2;`"
    >
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${primaryColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-header')"
      >
        <i class="fa fa-lg fa-clock" :style="`color: ${blackColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${primaryColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-bride')"
      >
        <i
          class="fa fa-lg fa-user-friends"
          :style="`color: ${blackColor};`"
        ></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${primaryColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-ceremony')"
      >
        <i
          class="fa fa-lg fa-calendar-alt"
          :style="`color: ${blackColor};`"
        ></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${primaryColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-map')"
      >
        <i
          class="fa fa-lg fa-map-marker-alt"
          :style="`color: ${blackColor};`"
        ></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${primaryColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-moment')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${blackColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${primaryColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('lavender-guest')"
      >
        <i
          class="fa fa-lg fa-calendar-check"
          :style="`color: ${blackColor};`"
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
import AppCardLoveStory from '../../../../components/modules/AppCardLoveStory'
import AppCardVideo from '../../../../components/modules/AppCardVideo'
import AppPlaySong from '../../../../components/modules/AppPlaySong'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import AppGuestGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  name: 'App',
  data() {
    return {
      mainColor: '#C6CBAC',
      primaryColor: '#C6CBAC',
      backgroundColor: '#FFFFFF',
      whiteColor: '#FFFFFF',
      blackColor: '#1A1507',
      transparentMainColor: 'rgba(227, 216, 184, 0.30)',
      transparentPrimaryColor: 'rgba(198, 203, 172, 0.30)',
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
    visibleGallery() {
      return !this.visibleBronze && this.selectedData.galleries.length > 0
    },
    visibleVideo() {
      return this.visibleDiamon && this.selectedData.invitation.video_link
    },
    visibleSpecialThanks() {
      return this.visibleDiamon && this.selectedData.specialthanks.length > 0
    },
    visibleOpeningQuotes() {
      return this.selectedData && this.selectedData.invitation.greeting_quotes
    },
    visibleClosingQuotes() {
      return this.selectedData && this.selectedData.invitation.closing_quotes
    },
  },
  components: {
    Carousel,
    Slide,
    AppPlaySong,
    AppCardVideo,
    AppCardEvent,
    AppCardLoveStory,
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
