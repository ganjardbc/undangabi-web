<template>
  <div
    id="App"
    class="theme background-transaprent bg-image"
    :style="`
            background-attachment: fixed; 
            background-image: url(${selectedData.invitation.profile ? invitationImageCoverUrl + selectedData.invitation.profile : ''});
        `"
  >
    <div class="theme-header full" id="lily-theme-header">
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
          <div
            class="fonts fonts-14 fonts-mobile-12 VisiaPro text-shadow theme-invitation-animate"
            style="color: #fff"
          >
            We Are Getting Married
          </div>
          <h2
            class="fonts fonts-44 fonts-mobile-34 white weight-normal CreattionDemo theme-invitation-animate"
            style="color: #fff"
          >
            {{ selectedData.invitation.title }}
          </h2>
          <div class="theme-container-small" style="margin-bottom: 20px">
            <div class="width width-70 width-center">
              <VueCountdown
                :time="selectedTime"
                v-slot="{ days, hours, minutes, seconds }"
              >
                <div class="theme-time theme-wrap">
                  <div
                    class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
                  >
                    <div
                      class="time-3 box-shadow"
                      :style="`border-color: ${mainColor}; background-color: rgba(0, 0, 0, 0.34); width: 90px; height: 90px;`"
                    >
                      <div class="post-middle">
                        <h2
                          class="fonts fonts-16 fonts-mobile-14 white RoxboroughCF"
                          :style="`color: ${mainColor};`"
                        >
                          {{ days }}
                        </h2>
                        <p class="fonts fonts-10 VisiaPro white">Hari</p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
                  >
                    <div
                      class="time-3 box-shadow"
                      :style="`border-color: ${mainColor}; background-color: rgba(0, 0, 0, 0.34); width: 90px; height: 90px;`"
                    >
                      <div class="post-middle">
                        <h2
                          class="fonts fonts-16 fonts-mobile-14 white RoxboroughCF"
                          :style="`color: ${mainColor};`"
                        >
                          {{ hours }}
                        </h2>
                        <p class="fonts fonts-10 VisiaPro white">Jam</p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
                  >
                    <div
                      class="time-3 box-shadow"
                      :style="`border-color: ${mainColor}; background-color: rgba(0, 0, 0, 0.34); width: 90px; height: 90px;`"
                    >
                      <div class="post-middle">
                        <h2
                          class="fonts fonts-16 fonts-mobile-14 white RoxboroughCF"
                          :style="`color: ${mainColor};`"
                        >
                          {{ minutes }}
                        </h2>
                        <p class="fonts fonts-10 VisiaPro white">Menit</p>
                      </div>
                    </div>
                  </div>
                  <div
                    class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
                  >
                    <div
                      class="time-3 box-shadow"
                      :style="`border-color: ${mainColor}; background-color: rgba(0, 0, 0, 0.34); width: 90px; height: 90px;`"
                    >
                      <div class="post-middle">
                        <h2
                          class="fonts fonts-16 fonts-mobile-14 white RoxboroughCF"
                          :style="`color: ${mainColor};`"
                        >
                          {{ seconds }}
                        </h2>
                        <p class="fonts fonts-10 VisiaPro white">Detik</p>
                      </div>
                    </div>
                  </div>
                </div>
              </VueCountdown>
            </div>
          </div>
          <div class="display-flex center theme-invitation-animate">
            <a
              :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
              target="_blank"
            >
              <button
                class="btn btn-main fonts fonts-11 fonts-mobile-10 VisiaPro"
                :style="`background-color: ${primaryColor}; border-color: ${primaryColor}; color: #fff;`"
              >
                Save Wedding Date
                <i class="icn icn-right fa fa-lw fa-calendar-alt" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div
      class="theme-background-white"
      :style="`background-color: ${tertiaryColor};`"
    >
      <div v-if="visibleVideo" style="position: relative; height: 240px">
        <div
          style="position: relative; top: -100px; width: 100%"
          class="theme-invitation-animate"
        >
          <div class="theme-body theme-container-small">
            <div style="padding: 15px">
              <div
                class="border-radius"
                :style="`padding: 10px; background-color: ${mainColor};`"
              >
                <AppCardVideo :data="selectedData.invitation" height="300" />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div style="text-align: center; padding-bottom: 20px">
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo theme-invitation-animate"
              :style="`color: ${primaryColor};`"
            >
              We Found Love
            </h2>
          </div>
          <div class="theme-container-small" style="text-align: center">
            <div class="width width-100 width-mobile width-center">
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="margin-bottom: 15px"
              >
                وَ مِنۡ اٰیٰتِہٖۤ اَنۡ خَلَقَ لَکُمۡ مِّنۡ اَنۡفُسِکُمۡ
                اَزۡوَاجًا لِّتَسۡکُنُوۡۤا اِلَیۡہَا وَ جَعَلَ بَیۡنَکُمۡ
                مَّوَدَّۃً وَّ رَحۡمَۃً ؕ اِنَّ فِیۡ ذٰلِکَ لَاٰیٰتٍ لِّقَوۡمٍ
                یَّتَفَکَّرُوۡنَ
              </div>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="margin-bottom: 15px"
              >
                ❝ Dan diantara tanda - tanda kekuasaan-Nya ialah diciptakan-Nya
                untukmu pasangan hidup dari jenismu sendiri supaya kamu mendapat
                ketenangan hati dan dijadikan-Nya kasih sayang diantara kamu.
                Sesungguhnya yang demikian itu menjadi tanda - tanda
                kebesaran-Nya bagi orang - orang yang berfikir. ❞
              </div>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
              >
                — QS. Ar-Rum:21
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body theme-container" id="lily-theme-bride">
        <div class="width width-100">
          <div v-for="(dt, i) in dataBrides" :key="i">
            <div :class="'theme-bride ' + (i % 2 === 0 ? 'reverse' : '')">
              <div
                :class="`theme-bride-cover theme-invitation-animate ${i % 2 === 0 ? 'theme-invitation-animate-fromRight' : 'theme-invitation-animate-fromLeft'}`"
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
              <div class="theme-bride-info">
                <div class="post-top post-mobile-none">
                  <h2
                    class="fonts fonts-32 fonts-mobile-24 black weight-normal Lora theme-invitation-animate"
                    :style="`color: ${primaryColor};`"
                  >
                    {{ dt.bride.name }}
                  </h2>
                  <div
                    class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                  >
                    {{ dt.bride.nick_name }}
                  </div>
                  <div
                    class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                    style="margin-top: 5px"
                    v-html="dt.bride.parent"
                  ></div>
                  <div
                    v-if="dt.bride.instagram_link"
                    class="theme-bride-socmed theme-invitation-animate"
                    style="margin-top: 15px"
                  >
                    <a
                      :href="dt.bride.instagram_link"
                      target="_blank"
                      class="btn btn-sekunder btn-small-radius fonts fonts-11 fonts-mobile-10 VisiaPro"
                      :style="`background-color: ${primaryColor}; border-color: ${primaryColor}; color: #fff;`"
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

      <div v-if="visibleLoveStory" class="theme-body theme-container">
        <div class="theme-padding" style="padding-bottom: 0">
          <div class="theme-invitation-animate" style="text-align: center">
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Our Love Stories
            </h2>
          </div>
        </div>
        <div class="theme-padding theme-container-small">
          <AppCardLoveStory
            :data.sync="dataLoveStories"
            :enableAnimation="true"
            :customMainColor="primaryColor"
            :customPrimaryColor="'#1A1507'"
            :customMainFont="'CreattionDemo'"
            :customMainFontSize="'fonts-32 fonts-mobile-28'"
            :customPrimaryFont="'VisiaPro'"
            :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
            :customMainFontWeight="'weight-normal'"
            :customBorderRadius="'12px'"
          />
        </div>
      </div>

      <div
        v-if="visibleEvent"
        class="theme-body"
        :style="`background-color: ${mainColor};`"
        id="lily-theme-ceremony"
      >
        <div class="theme-padding" style="padding-bottom: 0">
          <div class="theme-invitation-animate" style="text-align: center">
            <h2
              class="fonts fonts-32 fonts-mobile-28 white weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Wedding Events
            </h2>
          </div>
        </div>
        <div class="theme-padding theme-container">
          <div class="theme-container-small">
            <AppCardEvent
              :data.sync="dataEvents"
              :enableAnimation="true"
              :customIconColor="primaryColor"
              :customMainColor="primaryColor"
              :customMainFont="'CreattionDemo'"
              :customMainFontSize="'fonts-32 fonts-mobile-28'"
              :customPrimaryFont="'VisiaPro'"
              :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
              :customMainFontWeight="'weight-normal'"
              :customBorderRadius="'12px'"
            />
          </div>
        </div>
      </div>

      <div
        v-if="visibleGallery"
        class="theme-body theme-container"
        id="lily-theme-moment"
      >
        <div class="theme-padding theme-container-small">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px; padding-top: 20px"
          >
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Photo Gallery
            </h2>
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

      <div
        v-if="visibleMap"
        class="theme-body theme-container"
        id="lily-theme-map"
      >
        <div class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px"
          >
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Wedding Location
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
            >
              {{ selectedData.invitation.description }}
            </div>
          </div>
          <div class="width width-100">
            <div
              class="border-radius theme-invitation-animate"
              :style="`padding: 10px; background-color: ${mainColor};`"
            >
              <div class="theme-map" style="height: 400px">
                <GmapMap
                  ref="mapRef"
                  :center="{ lat: dataLatitude, lng: dataLongitude }"
                  :zoom="19"
                  style="width: 100%; height: 400px; border-radius: 12px"
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
                      new google.maps.LatLng(dataLatitude, dataLongitude)
                    "
                  />
                </GmapMap>
              </div>
            </div>
          </div>
          <div
            class="display-flex center theme-invitation-animate"
            style="padding-top: 20px"
          >
            <a
              :href="`http://maps.google.com/maps?q=${dataLatitude},${dataLongitude}`"
              target="_blank"
            >
              <button
                class="btn btn-main fonts fonts-11 fonts-mobile-10 VisiaPro"
                :style="`background-color: ${primaryColor}; border-color: ${primaryColor}; color: #fff;`"
              >
                Open Google Map
                <i class="icn icn-right fa fa-lw fa-calendar-alt" />
              </button>
            </a>
          </div>
        </div>
      </div>

      <div
        v-if="visibleComment"
        class="theme-body theme-container"
        id="lily-theme-gift"
      >
        <div class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px"
          >
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Send Gift
            </h2>
          </div>
          <div
            class="theme-container-small"
            style="text-align: center; padding-bottom: 20px"
          >
            <div
              class="width width-100 width-mobile width-center theme-invitation-animate"
            >
              <div class="fonts fonts-14 fonts-mobile-12 black VisiaPro">
                Kehadiran serta doa dan restu merupakan hadiah teristimewa.
                Namun jika ingin mengirimkan sesuatu pada kami, tanpa mengurangi
                rasa hormat, dapat melalui:
              </div>
            </div>
          </div>
          <div class="theme-container-small">
            <AppCardDigitalGift
              :customButton="'fonts fonts-12 VisiaPro'"
              :customMainFont="'VisiaPro'"
              :customBorderRadius="'12px'"
              :enableAnimation="true"
              :data.sync="dataGifts"
            />
          </div>
        </div>
      </div>

      <div
        class="theme-body"
        :style="`background-color: ${mainColor};`"
        id="lily-theme-gift"
      >
        <div class="theme-container theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px"
          >
            <h2
              class="fonts fonts-32 fonts-mobile-28 white weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Reservasi
            </h2>
          </div>

          <div class="width width-full theme-invitation-animate-disable">
            <AppReservation
              :innerClass="'width width-full'"
              :enableEnglish="false"
              backgroundChatColor="#F6F5F5"
              :backgroundButtonColor="primaryColor"
              textButtonColor="#fff"
              :mainColor="mainColor"
            />
          </div>
        </div>
      </div>

      <div v-if="visibleNote" class="theme-body theme-container">
        <div class="theme-container">
          <div class="theme-padding">
            <div class="theme-invitation-animate" style="text-align: center">
              <h2
                class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo"
                :style="`color: ${primaryColor};`"
              >
                Note
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

      <div v-if="visibleSpecialThanks" class="theme-body theme-container">
        <div class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px"
          >
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo"
              :style="`color: ${primaryColor};`"
            >
              Special Thanks
            </h2>
          </div>
          <AppCardSpecialThanks
            :data="dataSpecialThanks"
            :enableAnimation="true"
            :customBorderRadius="'12px'"
            :customMainFont="'VisiaPro'"
          />
        </div>
      </div>

      <div v-if="selectedData" class="theme-body theme-container">
        <div class="theme-padding">
          <div class="theme-container-small" style="text-align: center">
            <div
              class="width width-200-px width-center theme-invitation-animate"
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
            <div
              class="width width-80 width-mobile width-center content-center"
            >
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
              >
                See You on Our Big Day
              </div>
              <div style="padding-top: 10px">
                <h2
                  class="fonts fonts-44 fonts-mobile-34 black weight-normal CreattionDemo theme-invitation-animate"
                  :style="`color: ${primaryColor};`"
                >
                  {{ selectedData.invitation.title }}
                </h2>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div
        v-if="data.invitation.is_prokes_enable"
        class="theme-body theme-container"
      >
        <div class="theme-padding">
          <div
            style="
              width: 80%;
              margin: auto;
              text-align: center;
              padding-bottom: 20px;
            "
          >
            <div
              class="display-flex center theme-invitation-animate"
              style="padding-bottom: 15px"
            >
              <div class="card-value red">COVID-19</div>
            </div>
            <h2
              class="fonts fonts-32 fonts-mobile-28 black weight-normal CreattionDemo theme-invitation-animate"
              :style="`color: ${primaryColor};`"
            >
              Protokol Kesehatan
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
            >
              Stop penyebaran Covid-19 dengan menerapkan protokol kesehatan
            </div>
          </div>
          <AppCardProkesGrid
            :customBackground="mainColor"
            :enableAnimation="true"
            :customMainFont="'VisiaPro'"
            customBorderRadius="12px"
          />
        </div>
      </div>
    </div>

    <FooterSecondComponent
      :backgroundColor="mainColor"
      :textColor="primaryColor"
      buttonBackgroundColor="#fff"
      :buttonBorderColor="primaryColor"
      :textButtonColor="primaryColor"
    />

    <AppGustGreetings
      :customBackgroundColor="tertiaryColor"
      :customMainColor="primaryColor"
      :customMainFont="'CreattionDemo'"
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
        :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
        @click="scrollToTarget('lily-theme-header')"
      >
        <i
          class="fa fa-lg fa-calendar-alt"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
        @click="scrollToTarget('lily-theme-bride')"
      >
        <i
          class="fa fa-lg fa-user-friends"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        v-if="visibleDiamon"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
        @click="scrollToTarget('lily-theme-ceremony')"
      >
        <i
          class="fa fa-lg fa-calendar-check"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
        @click="scrollToTarget('lily-theme-moment')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${primaryColor};`"></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
        @click="scrollToTarget('lily-theme-map')"
      >
        <i
          class="fa fa-lg fa-map-marker-alt"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
        @click="scrollToTarget('lily-theme-gift')"
      >
        <i class="fa fa-lg fa-check" :style="`color: ${primaryColor};`"></i>
      </button>
    </div>
  </div>
</template>
<script>
import { gmapApi } from 'vue2-google-maps'
import { Carousel, Slide } from 'vue-carousel'
import AppReservation from '../../../modules/AppReservation'
import AppPopupComment from '../../../modules/AppPopupComment'
import AppImageBanner from '../../../modules/AppImageBanner'
import AppImageBorder from '../../../modules/AppImageBorder'
import AppImageCover from '../../../modules/AppImageCover'
import AppBorderTop from '../../../modules/AppBorderTop'
import AppBorderCircle from '../../../modules/AppBorderCircle'
import AppCardProkesGrid from '../../../modules/AppCardProkesGrid'
import AppCardDigitalGift from '../../../modules/AppCardDigitalGift'
import AppCardSpecialThanks from '../../../modules/AppCardSpecialThanks'
import AppSlideGallery from '../../../modules/AppSlideGallery'
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
      mainColor: '#D2DCE4',
      primaryColor: '#50607D',
      tertiaryColor: 'rgba(210, 220, 228, 0.84)',
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
    AppCardVideo,
    AppSlideGallery,
    AppCardEvent,
    AppCardLoveStory,
    AppCardSpecialThanks,
    AppCardDigitalGift,
    AppCardProkesGrid,
    AppGustGreetings,
    AppBorderCircle,
    AppBorderTop,
    AppImageBanner,
    AppImageBorder,
    AppImageCover,
    AppPopupComment,
    AppReservation,
    VueCountdown,
    FooterComponent,
    FooterSecondComponent,
  },
  methods: {
    closeGuestGreeting() {
      document.body.style.overflowY = 'auto'
      this.visibleGreeting = false
      this.scrollToTarget('lily-theme-header')
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
