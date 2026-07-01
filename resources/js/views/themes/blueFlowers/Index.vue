<template>
  <div id="App" class="theme theme-small bg-white box-shadow">
    <div id="pink-fllower-header" class="theme-body">
      <div class="theme-body">
        <div class="theme-header box-shadow">
          <div v-if="selectedData" class="theme-cover" style="height: 100%">
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
              <slide v-for="(dt, i) in selectedData.covers" :key="i">
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

            <div
              class="post-middle-absolute content-center"
              style="width: 100%"
            >
              <div
                class="fonts fonts-14 fonts-mobile-12 text-shadow Ovo theme-invitation-animate"
                style="color: #f6ebe2; margin-bottom: 20px"
              >
                THE WEDDING OF
              </div>
              <div
                class="fonts fonts-38 fonts-mobile-34 black semibold FeelingPassionate theme-invitation-animate"
                style="color: #f6ebe2"
              >
                {{ data.invitation.title }}
              </div>
              <div v-if="guestName" class="margin margin-top-20px">
                <div
                  class="fonts fonts-14 fonts-mobile-12 black center capitalize normal Ovo theme-invitation-animate"
                  style="color: #f6ebe2"
                >
                  Kepada :
                </div>
                <div
                  class="fonts fonts-18 fonts-mobile-16 black center capitalize normal Ovo theme-invitation-animate"
                  style="color: #f6ebe2"
                >
                  {{ guestName }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      id="pink-fllower-bride"
      class="theme-body theme-padding bg-image"
      :style="`background-image: url(${backgroundImage});`"
    >
      <AppImageBorder
        position="top-right"
        scaleX="1"
        customWidth="120px"
        :customImageTopRight="topRightImage"
      />
      <AppImageBorder
        position="top-left"
        scaleX="1"
        customWidth="120px"
        :customImageTopLeft="topLeftImage"
      />
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="120px"
        :customImageBottomRight="bottomRightImage"
      />
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="120px"
        :customImageBottomLeft="bottomLeftImage"
      />
      <div class="theme-body theme-padding">
        <div class="theme-container-padding">
          <div class="width width-100 width-center content-center">
            <div class="padding padding-bottom-20px">
              <div
                class="fonts fonts-18 fonts-mobile-14 black semibold FeelingPassionate theme-invitation-animate"
                :style="`color: ${mainColor};`"
              >
                Bismillahirrahmanirrahim
              </div>
              <div
                class="fonts fonts-18 fonts-mobile-14 black semibold FeelingPassionate theme-invitation-animate"
                :style="`color: ${mainColor};`"
              >
                Assalamu`alaikum Warahmatullaahi Wabarakaatuh
              </div>
            </div>
            <div
              class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
            >
              Dengan memohon rahmat dan ridho Allah SWT, kami bermaksud
              mengundang Bapak/Ibu/Saudara/i untuk menghadiri acara pernikahan
              kami.
            </div>
          </div>
        </div>
      </div>
      <div class="width width-100">
        <div v-for="(dt, i) in dataBrides" :key="i">
          <div
            :class="'theme-bride ' + (i % 2 === 0 ? 'reverse' : '')"
            style="margin-top: 0; margin-bottom: 0"
          >
            <div
              :class="`theme-bride-cover theme-invitation-animate ${i % 2 === 0 ? 'theme-invitation-animate-fromRight' : 'theme-invitation-animate-fromLeft'}`"
            >
              <AppBorderCircle
                :image="
                  dt.bride.image ? brideImageThumbnailUrl + dt.bride.image : ''
                "
                :cover="
                  dt.bride.image ? brideImageCoverUrl + dt.bride.image : ''
                "
                :customBorder="borderImage"
              />
            </div>
            <div class="theme-bride-info">
              <div class="post-top post-mobile-none">
                <div
                  class="fonts fonts-26 fonts-mobile-22 black weight-normal FeelingPassionate theme-invitation-animate"
                  :style="`color: ${mainColor};`"
                >
                  {{ dt.bride.name }}
                </div>
                <div
                  class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
                >
                  {{ dt.bride.nick_name }}
                </div>
                <div
                  class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
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
                    class="btn btn-sekunder btn-small-radius fonts fonts-11 fonts-mobile-10 Ovo"
                    :style="`background-color: ${mainColor}; border-color: ${mainColor}; color: #fff;`"
                  >
                    <i class="icn icn-left fab fa-lg fa-instagram"></i>
                    Instagram
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div
            v-if="i % 2 === 0"
            class="padding padding-top-15px padding-bottom-15px content-center"
          >
            <div
              class="fonts fonts-18 fonts-mobile-14 black weight-normal FeelingPassionate theme-invitation-animate"
            >
              dengan
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      id="pink-fllower-ceremony"
      :style="`background-color: ${whiteColor}; border-top: 4px solid ${mainColor}; border-bottom: 4px solid ${mainColor};`"
    >
      <div class="theme-body theme-padding">
        <div class="content-center">
          <div
            class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
          >
            MENUJU HARI BAHAGIA
          </div>
        </div>
        <div class="theme-padding">
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
                  :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
                >
                  <div class="post-middle">
                    <div class="fonts fonts-28 white FeelingPassionate">
                      {{ days }}
                    </div>
                    <p class="fonts fonts-11 white Ovo">Hari</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center"
              >
                <div
                  class="time-3 box-shadow theme-invitation-animate"
                  :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
                >
                  <div class="post-middle">
                    <div class="fonts fonts-28 white FeelingPassionate">
                      {{ hours }}
                    </div>
                    <p class="fonts fonts-11 white Ovo">Jam</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center"
              >
                <div
                  class="time-3 box-shadow theme-invitation-animate"
                  :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
                >
                  <div class="post-middle">
                    <div class="fonts fonts-28 white FeelingPassionate">
                      {{ minutes }}
                    </div>
                    <p class="fonts fonts-11 white Ovo">Menit</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center"
              >
                <div
                  class="time-3 box-shadow theme-invitation-animate"
                  :style="`border-color: ${mainColor}; background-color: ${mainColor};`"
                >
                  <div class="post-middle">
                    <div class="fonts fonts-28 white FeelingPassionate">
                      {{ seconds }}
                    </div>
                    <p class="fonts fonts-11 white Ovo">Detik</p>
                  </div>
                </div>
              </div>
            </div>
          </VueCountdown>
        </div>
        <div class="display-flex center theme-invitation-animate">
          <a
            :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
            target="_blank"
          >
            <button
              class="btn btn-main fonts fonts-12 Ovo"
              :style="`background-color: ${mainColor}; border-color: ${mainColor}; color: ${whiteColor};`"
            >
              Tambah ke Google Calendar
              <i class="icn icn-right fa fa-lw fa-calendar-alt" />
            </button>
          </a>
        </div>
      </div>
    </div>

    <div
      v-if="visibleEvent"
      class="theme-body bg-image"
      :style="`background-image: url(${backgroundImage});`"
    >
      <AppImageBorder
        position="top-right"
        scaleX="1"
        customWidth="120px"
        :customImageTopRight="topRightImage"
      />
      <AppImageBorder
        position="top-left"
        scaleX="1"
        customWidth="120px"
        :customImageTopLeft="topLeftImage"
      />
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="120px"
        :customImageBottomRight="bottomRightImage"
      />
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="120px"
        :customImageBottomLeft="bottomLeftImage"
      />
      <div class="theme-body theme-padding">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-22 fonts-mobile-18 black semibold FeelingPassionate theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Daftar Acara
          </div>
        </div>
        <div class="theme-container-padding">
          <AppCardEvent
            :data.sync="selectedData.events"
            :enableAnimation="true"
            :customIconColor="mainColor"
            :customMainColor="mainColor"
            :customMainFont="'FeelingPassionate'"
            :customMainFontSize="'fonts-26 fonts-mobile-22'"
            :customPrimaryFont="'Ovo'"
            :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
            :customMainFontWeight="'semibold'"
            :customBorderRadius="'12px'"
          />
        </div>
      </div>
    </div>

    <div
      v-if="visibleMap"
      id="pink-fllower-map"
      :style="`background-color: ${whiteColor}; border-top: 4px solid ${mainColor}; border-bottom: 4px solid ${mainColor};`"
    >
      <div class="theme-body theme-padding">
        <div class="theme-container-padding content-center">
          <div
            class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
          >
            LOKASI ACARA
          </div>
          <div
            class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
          >
            {{ selectedData.invitation.description }}
          </div>
        </div>
        <div class="theme-padding">
          <div class="theme-map theme-invitation-animate" style="height: 500px">
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
        </div>
        <div class="display-flex center theme-invitation-animate">
          <a
            :href="`http://maps.google.com/maps?q=${selectedData.invitation.latitude},${selectedData.invitation.longitude}`"
            target="_blank"
          >
            <button
              class="btn btn-main fonts fonts-12 Ovo"
              :style="`background-color: ${mainColor}; border-color: ${mainColor}; color: ${whiteColor};`"
            >
              Lihat Alamat pada Google-map
              <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
            </button>
          </a>
        </div>
      </div>
    </div>

    <div
      v-if="visibleGallery || visibleVideo || visibleLoveStory"
      id="pink-fllower-gallery"
      class="theme-body bg-image"
      :style="`background-image: url(${backgroundImage});`"
    >
      <AppImageBorder
        position="top-right"
        scaleX="1"
        customWidth="120px"
        :customImageTopRight="topRightImage"
      />
      <AppImageBorder
        position="top-left"
        scaleX="1"
        customWidth="120px"
        :customImageTopLeft="topLeftImage"
      />
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="120px"
        :customImageBottomRight="bottomRightImage"
      />
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="120px"
        :customImageBottomLeft="bottomLeftImage"
      />

      <div v-if="visibleLoveStory" class="theme-body theme-padding">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-22 fonts-mobile-18 black semibold FeelingPassionate theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Our Love Story
          </div>
        </div>
        <div class="theme-container-padding">
          <AppCardLoveStory
            :data.sync="dataLoveStories"
            :enableAnimation="true"
            :customMainColor="mainColor"
            :customPrimaryColor="blackColor"
            :customPrimaryFont="'Ovo'"
            :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
            :customMainFont="'FeelingPassionate'"
            :customMainFontSize="'fonts-22 fonts-mobile-18'"
            :customMainFontWeight="'semibold'"
            :customBorderRadius="'0px'"
          />
        </div>
      </div>

      <div v-if="visibleGallery" class="theme-body theme-padding">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-22 fonts-mobile-18 black semibold FeelingPassionate theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Galeri Foto
          </div>
        </div>
        <div class="theme-container-padding">
          <div class="width width-85 width-center">
            <div class="theme-header small">
              <div class="theme-cover">
                <AppSlideGallery
                  :data.sync="selectedData.galleries"
                  :paginationActiveColor="mainColor"
                  :paginationColor="'#555'"
                  :paginationPosition="'#ff0000'"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div v-if="visibleVideo" class="theme-body theme-padding">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-22 fonts-mobile-18 black semibold FeelingPassionate theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Video
          </div>
        </div>
        <div class="theme-container-padding">
          <div class="image youtube-video background-grey">
            <AppCardVideo :data="selectedData.invitation" height="300" />
          </div>
        </div>
      </div>
    </div>

    <div
      id="pink-fllower-guest"
      :style="`background-color: ${whiteColor}; border-top: 4px solid ${mainColor}; border-bottom: 4px solid ${mainColor};`"
    >
      <div class="theme-body theme-padding">
        <div class="content-center padding padding-bottom-50px">
          <div
            class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
          >
            RESERVASI
          </div>
        </div>
        <div class="theme-container-padding">
          <AppReservation
            :innerClass="'width width-full'"
            :enableEnglish="false"
            :guest="guest"
            :data.sync="selectedData.guest"
            :invID.sync="selectedData.invitation.id"
            :invStringID.sync="selectedData.invitation.invitation_id"
            :invitation.sync="selectedData.invitation"
            :backgroundChatColor="whiteColor"
            :backgroundButtonColor="mainColor"
            :textButtonColor="whiteColor"
            :mainColor="mainColor"
          />
        </div>
      </div>

      <div v-if="visibleComment" class="theme-body theme-padding">
        <div class="content-center padding padding-bottom-35px">
          <div
            class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
          >
            KADO DIGITAL
          </div>
        </div>
        <div class="theme-container-padding">
          <AppCardDigitalGift
            :enableAnimation="true"
            :customBorderRadius="'12px'"
            :customMainFont="'Ovo'"
            :customButton="'fonts fonts-12 Ovo'"
            :data.sync="selectedData.comments"
          />
        </div>
      </div>
    </div>

    <div
      id="pink-fllower-gallery"
      class="theme-body bg-image"
      :style="`background-image: url(${backgroundImage});`"
    >
      <AppImageBorder
        position="top-right"
        scaleX="1"
        customWidth="120px"
        :customImageTopRight="topRightImage"
      />
      <AppImageBorder
        position="top-left"
        scaleX="1"
        customWidth="120px"
        :customImageTopLeft="topLeftImage"
      />
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="120px"
        :customImageBottomRight="bottomRightImage"
      />
      <AppImageBorder
        position="bottom-left"
        scaleX="1"
        customWidth="120px"
        :customImageBottomLeft="bottomLeftImage"
      />

      <div v-if="visibleNote" class="theme-body theme-padding">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-22 fonts-mobile-18 black semibold FeelingPassionate theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Catatan
          </div>
        </div>
        <div class="content-center">
          <div
            class="fonts fonts-14 fonts-mobile-12 fonts-mobile-12 black theme-invitation-animate"
            v-html="selectedData.invitation.note"
          ></div>
        </div>
      </div>

      <div v-if="visibleSpecialThanks" class="theme-body theme-padding">
        <div class="theme-padding content-center">
          <div
            class="fonts fonts-22 fonts-mobile-18 black semibold FeelingPassionate theme-invitation-animate"
            :style="`color: ${mainColor};`"
          >
            Special Thanks
          </div>
        </div>
        <div class="theme-container-padding">
          <AppCardSpecialThanks
            :data="dataSpecialThanks"
            :customBorderRadius="'12px'"
            :enableAnimation="true"
            :customMainFont="'Ovo'"
          />
        </div>
      </div>

      <div class="theme-body theme-padding">
        <div class="theme-container-padding" style="text-align: center">
          <div class="width width-200-px width-center theme-invitation-animate">
            <AppBorderCircle
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
              :customBorder="borderImage"
            />
          </div>
          <div
            class="width width-100 width-center content-center padding padding-top-25px"
          >
            <div
              class="fonts fonts-14 fonts-mobile-12 fonts-mobile-12 black Ovo theme-invitation-animate"
            >
              See You on Our Big Day
            </div>
            <div
              class="fonts fonts-38 fonts-mobile-34 black semibold FeelingPassionate theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              {{ data.invitation.title }}
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body theme-padding">
        <div class="theme-container-padding" style="text-align: center">
          <div class="width width-100 width-center content-center">
            <div
              class="fonts fonts-14 fonts-mobile-12 black Ovo theme-invitation-animate"
              style="margin-bottom: 15px"
            >
              Merupakan suatu kerhormatan bagi kami apabila Bapak/Ibu/Saudara/i
              berkenan hadir untuk memberikan do'a restu.
            </div>
            <div
              class="fonts fonts-18 fonts-mobile-14 black semibold FeelingPassionate theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Wassalamualaikum Warahmatullaahi Wabarakaatuh
            </div>
          </div>
        </div>
      </div>
    </div>

    <FooterSecondComponent
      :style="`border-top: 4px solid ${mainColor};`"
      :enableBlackLogo="true"
      :backgroundColor="whiteColor"
      :textColor="blackColor"
      :buttonBackgroundColor="mainColor"
      :buttonBorderColor="mainColor"
      :textButtonColor="whiteColor"
    />

    <AppGustGreetings
      :customButtonColor="mainColor"
      :customButtonTextColor="whiteColor"
      :customBackgroundColor="whiteColor"
      :customMainColor="mainColor"
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

    <div class="theme-navigation theme-2">
      <button
        class="btn btn-icon btn-white btn-small-radius"
        @click="scrollToTarget('pink-fllower-bride')"
      >
        <i class="fa fa-lg fa-user-friends" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-white btn-small-radius"
        @click="scrollToTarget('pink-fllower-ceremony')"
      >
        <i class="fa fa-lg fa-calendar-alt" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-white btn-small-radius"
        @click="scrollToTarget('pink-fllower-map')"
      >
        <i
          class="fa fa-lg fa-map-marker-alt"
          :style="`color: ${mainColor};`"
        ></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-white btn-small-radius"
        @click="scrollToTarget('pink-fllower-gallery')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${mainColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-white btn-small-radius"
        @click="scrollToTarget('pink-fllower-guest')"
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
import AppReservation from '../../modules/AppReservation'
import AppPopupComment from '../../modules/AppPopupComment'
import AppImageBorder from '../../modules/AppImageBorder'
import AppImageCover from '../../modules/AppImageCover'
import AppBorderTop from '../../modules/AppBorderTop'
import AppImageBanner from '../../modules/AppImageBanner'
import AppBorderCircle from '../../modules/AppBorderCircle'
import AppCardDigitalGift from '../../modules/AppCardDigitalGift'
import AppCardVideo from '../../modules/AppCardVideo'
import AppSlideGallery from '../../modules/AppSlideGallery'
import AppCardEvent from '../../modules/AppCardEvent'
import AppCardLoveStory from '../../modules/AppCardLoveStory'
import AppCardSpecialThanks from '../../modules/AppCardSpecialThanks'
import FooterComponent from '../Footer'
import FooterSecondComponent from '../FooterSecond'
import AppGustGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'
import backgroundImage from './assets/background-blue.png'
import bottomImage from './assets/bottom-long-blue.png'
import topRightImage from './assets/top-right-blue.png'
import topLeftImage from './assets/top-left-blue.png'
import bottomRightImage from './assets/bottom-right-blue.png'
import bottomLeftImage from './assets/bottom-left-blue.png'
import borderImage from './assets/border-blue.png'

export default {
  name: 'App',
  data() {
    return {
      backgroundImage,
      bottomImage,
      topRightImage,
      topLeftImage,
      bottomRightImage,
      bottomLeftImage,
      borderImage,
      mainColor: '#C79D52',
      primaryColor: '#EF7281',
      whiteColor: '#FFFFFF',
      blackColor: '',
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
    guestName() {
      return (
        this.selectedData &&
        this.selectedData.guest &&
        this.selectedData.guest.name
      )
    },
    dataBrides() {
      return this.selectedData && this.selectedData.brides
    },
    dataLoveStories() {
      return this.selectedData && this.selectedData.loveStories
    },
    dataSpecialThanks() {
      return this.selectedData && this.selectedData.specialthanks
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
    visibleLoveStory() {
      return !this.visibleBronze && this.selectedData.loveStories.length > 0
    },
    visibleEvent() {
      return this.selectedData.events.length > 0
    },
    visibleComment() {
      return !this.visibleBronze && this.selectedData.comments.length > 0
    },
    visibleGallery() {
      return !this.visibleSilver && this.selectedData.galleries.length > 0
    },
    visibleVideo() {
      return this.visibleDiamon && this.selectedData.invitation.video_link
    },
    visibleNote() {
      return this.selectedData && this.selectedData.invitation.note
    },
    visibleSpecialThanks() {
      return this.visibleDiamon && this.selectedData.specialthanks.length > 0
    },
  },
  components: {
    Carousel,
    Slide,
    AppCardVideo,
    AppCardDigitalGift,
    AppGustGreetings,
    AppBorderCircle,
    AppImageBanner,
    AppBorderTop,
    AppImageBorder,
    AppImageCover,
    AppPopupComment,
    AppReservation,
    AppCardEvent,
    AppCardLoveStory,
    AppCardSpecialThanks,
    AppSlideGallery,
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
      this.scrollToTarget('pink-fllower-header')
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
