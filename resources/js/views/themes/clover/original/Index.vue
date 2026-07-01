<template>
  <div id="App" class="theme" style="background-color: #fff">
    <div
      id="clover-theme-header"
      class="theme-body bg-image-top"
      style="background-image: url('/images/clover/top-content.png')"
    >
      <div v-if="selectedData" class="theme-container-normal">
        <div
          v-if="!selectedData.invitation.cover || !selectedData.covers"
          class="theme-body theme-container"
        >
          <div class="content-center" style="padding-top: 50px">
            <div>
              <div
                class="fonts fonts-12 text-shadow theme-invitation-animate"
                style="color: #66806a"
              >
                ~ Undangan Pernikahan ~
              </div>
              <h2
                class="fonts fonts-42 black semibold RoxboroughCF theme-invitation-animate"
                style="
                  color: #66806a;
                  line-height: 1.3;
                  margin-top: 10px;
                  margin-bottom: 10px;
                "
                v-html="generateTitle"
              ></h2>
              <div
                class="fonts fonts-12 text-shadow theme-invitation-animate"
                style="color: #66806a; margin-bottom: 18px"
              >
                {{
                  selectedData.invitation.date | moment('dddd, Do MMMM YYYY')
                }}
              </div>
            </div>
            <div
              class="display-flex center theme-invitation-animate"
              style="position: relative; width: 100%"
            >
              <a
                :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
                target="_blank"
              >
                <button
                  class="btn btn-main"
                  :style="`background-color: #66806A; border-color: #66806A; color: #fff;`"
                >
                  Tambah ke Google Calendar
                  <i class="icn icn-right fa fa-lw fa-calendar-alt" />
                </button>
              </a>
            </div>
          </div>
        </div>
        <div
          v-else
          class="theme-header box-shadow"
          style="
            border-bottom-left-radius: 18px;
            border-bottom-right-radius: 18px;
            overflow: hidden;
          "
        >
          <div class="theme-cover" style="height: 100%">
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

            <div class="theme-transparent bg-2"></div>

            <div
              class="post-middle-absolute content-center"
              style="width: 100%"
            >
              <div>
                <div
                  class="fonts fonts-12 text-shadow theme-invitation-animate"
                  style="color: #f6ebe2"
                >
                  ~ Undangan Pernikahan ~
                </div>
                <h2
                  class="fonts fonts-42 black semibold RoxboroughCF theme-invitation-animate"
                  style="
                    color: #f6ebe2;
                    line-height: 1.3;
                    margin-top: 10px;
                    margin-bottom: 10px;
                  "
                  v-html="generateTitle"
                ></h2>
                <div
                  class="fonts fonts-12 text-shadow theme-invitation-animate"
                  style="color: #f6ebe2; margin-bottom: 18px"
                >
                  {{
                    selectedData.invitation.date | moment('dddd, Do MMMM YYYY')
                  }}
                </div>
              </div>
              <div
                class="display-flex center theme-invitation-animate"
                style="position: relative; width: 100%"
              >
                <a
                  :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
                  target="_blank"
                >
                  <button
                    class="btn btn-main"
                    :style="`background-color: #66806A; border-color: #66806A; color: #fff;`"
                  >
                    Tambah ke Google Calendar
                    <i class="icn icn-right fa fa-lw fa-calendar-alt" />
                  </button>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      id="clover-theme-bride"
      class="theme-body bg-image-bottom"
      style="background-image: url('/images/clover/bottom.png')"
    >
      <div style="padding-top: 60px">
        <div class="theme-body theme-container">
          <div class="theme-padding">
            <div class="theme-container-small" style="text-align: center">
              <div
                class="width width-80 width-mobile width-center content-center"
                style="padding-bottom: 30px"
              >
                <div style="padding-bottom: 20px; padding-top: 20px">
                  <h2
                    class="fonts fonts-16 black semibold RoxboroughCF theme-invitation-animate"
                    style="color: #66806a"
                  >
                    Bismillahirrahmanirrahim
                  </h2>
                </div>
                <div>
                  <div
                    class="fonts fonts-14 black ViaodaLibre theme-invitation-animate"
                  >
                    Assalamu`alaikum Warahmatullaahi Wabarakaatuh
                  </div>
                  <div
                    class="fonts fonts-14 black ViaodaLibre theme-invitation-animate"
                  >
                    Dengan memohon rahmat dan ridho Allah SWT, kami bermaksud
                    mengundang Bapak/Ibu/Saudara/i untuk menghadiri pernikahan
                    putra-putri kami.
                  </div>
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
                v-if="dt.bride.image"
                class="width width-180-px width-center theme-invitation-animate"
                style="margin-bottom: 15px"
              >
                <div
                  class="image image-padding image-circle box-shadow"
                  :style="`background-image: url(${dt.bride.image ? brideImageThumbnailUrl + dt.bride.image : ''});`"
                ></div>
              </div>
              <div
                class="fonts fonts-24 black semibold RoxboroughCF theme-invitation-animate"
                style="color: #66806a; margin-bottom: 15px"
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
                      style="color: #66806a"
                    ></i>
                  </button>
                </a>
              </div>
            </div>
            <div v-if="i < dataBrides.length - 1">
              <div
                class="theme-invitation-animate"
                style="padding-top: 50px; padding-bottom: 50px"
              >
                <span class="fonts fonts-12 black semibold">dengan</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="theme-padding-bottom"></div>
    </div>

    <div id="clover-theme-ceremony" style="background-color: #66806a">
      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div
            style="text-align: center; padding-bottom: 30px"
            class="theme-invitation-animate"
          >
            <h2 class="post-middle fonts fonts-12 white">
              ~ Menuju Hari Bahagia ~
            </h2>
          </div>
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
                  style="border-color: #fff; background-color: #fff"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black RoxboroughCF"
                      style="color: #66806a"
                    >
                      {{ days }}
                    </h2>
                    <p class="fonts fonts-11 black">Hari</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
              >
                <div
                  class="time-3 box-shadow"
                  style="border-color: #fff; background-color: #fff"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black RoxboroughCF"
                      style="color: #66806a"
                    >
                      {{ hours }}
                    </h2>
                    <p class="fonts fonts-11 black">Jam</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
              >
                <div
                  class="time-3 box-shadow"
                  style="border-color: #fff; background-color: #fff"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black RoxboroughCF"
                      style="color: #66806a"
                    >
                      {{ minutes }}
                    </h2>
                    <p class="fonts fonts-11 black">Menit</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center theme-invitation-animate"
              >
                <div
                  class="time-3 box-shadow"
                  style="border-color: #fff; background-color: #fff"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black RoxboroughCF"
                      style="color: #66806a"
                    >
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
              :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
              target="_blank"
            >
              <button
                class="btn btn-main"
                :style="`background-color: #B4C6A6; border-color: #B4C6A6; color: #1a1507;`"
              >
                Tambah ke Google Calendar
                <i class="icn icn-right fa fa-lw fa-calendar-alt" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleEvent"
      class="theme-body bg-image-top"
      style="background-image: url('/images/clover/top.png')"
    >
      <div class="theme-padding theme-container">
        <div
          style="text-align: center; padding-bottom: 35px; padding-top: 20px"
          class="theme-invitation-animate"
        >
          <h2
            class="fonts fonts-16 black semibold RoxboroughCF"
            style="color: #66806a"
          >
            Daftar Acara
          </h2>
        </div>
        <div class="theme-container-small">
          <AppCardEvent
            :data.sync="selectedData.events"
            :enableAnimation="true"
            :customIconColor="'#66806A'"
            :customMainColor="'#66806A'"
            :customMainFont="'RoxboroughCF'"
            :customBorderRadius="'12px'"
          />
        </div>
      </div>
    </div>

    <div v-if="visibleMap" id="clover-theme-map">
      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div
            style="text-align: center; padding-bottom: 20px; padding-top: 20px"
            class="theme-invitation-animate"
          >
            <h2
              class="fonts fonts-16 black semibold RoxboroughCF"
              style="color: #66806a"
            >
              Lokasi Acara
            </h2>
            <div class="fonts fonts-11 black">
              {{ selectedData.invitation.description }}
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
                :style="`background-color: #66806A; border-color: #66806A; color: #fff;`"
              >
                Lihat Alamat pada Google-map
                <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleGallery || visibleVideo"
      id="clover-theme-gallery"
      class="theme-body bg-image-bottom"
      style="background-image: url('/images/clover/bottom.png')"
    >
      <div v-if="visibleGallery" class="theme-body">
        <div class="theme-padding theme-container-small">
          <div
            style="text-align: center; padding-bottom: 20px; padding-top: 20px"
            class="theme-invitation-animate"
          >
            <h2
              class="fonts fonts-16 black semibold RoxboroughCF"
              style="color: #66806a"
            >
              Galeri Foto
            </h2>
          </div>
          <div class="width width-85 width-center" style="padding-bottom: 20px">
            <div class="theme-header small">
              <div class="theme-cover">
                <AppSlideGallery
                  :data.sync="selectedData.galleries"
                  :paginationActiveColor="'#66806A'"
                  :paginationColor="'#555'"
                  :paginationPosition="'#ff0000'"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div v-if="visibleVideo" class="theme-padding">
        <div
          style="text-align: center; padding-bottom: 15px"
          class="theme-invitation-animate"
        >
          <h2
            class="fonts fonts-16 black semibold RoxboroughCF"
            style="color: #66806a"
          >
            Video
          </h2>
        </div>
        <div class="theme-container-small theme-invitation-animate">
          <div style="padding: 0 15px">
            <div class="image youtube-video background-grey">
              <AppCardVideo :data="selectedData.invitation" height="300" />
            </div>
          </div>
        </div>
      </div>

      <div class="theme-padding-bottom"></div>
    </div>

    <div
      class="theme-body"
      style="background-color: #66806a"
      id="clover-theme-guest"
    >
      <div v-if="visibleComment" class="theme-container">
        <div class="theme-padding theme-container-small">
          <div
            style="text-align: center; padding-bottom: 15px"
            class="theme-invitation-animate"
          >
            <h2 class="post-middle fonts fonts-12 white">~ Kado Digital ~</h2>
          </div>
          <AppCardDigitalGift
            :customBorderRadius="'12px'"
            :data.sync="selectedData.comments"
            :enableAnimation="true"
          />
        </div>
      </div>

      <div class="theme-body theme-container">
        <div style="padding-bottom: 60px"></div>

        <div
          style="text-align: center; padding-bottom: 30px"
          class="theme-invitation-animate"
        >
          <h2 class="post-middle fonts fonts-12 white">~ Reservasi ~</h2>
        </div>

        <div class="width width-full theme-invitation-animate-disable">
          <AppReservation
            :innerClass="'width width-full'"
            :enableEnglish="false"
            :guest="guest"
            :data.sync="selectedData.guest"
            :invID.sync="selectedData.invitation.id"
            :invStringID.sync="selectedData.invitation.invitation_id"
            :invitation.sync="selectedData.invitation"
            backgroundChatColor="#f8f8f8"
            backgroundButtonColor="#66806A"
            textButtonColor="#fff"
            mainColor="#66806A"
          />
        </div>

        <div style="padding-bottom: 30px"></div>
      </div>
    </div>

    <div class="theme-body">
      <AppImageBorder
        scaleX="1"
        customWidth="200px"
        customImageTopLeft="/images/clover/top-vertical.png"
      />
      <AppImageBorder
        position="bottom-right"
        scaleX="1"
        customWidth="300px"
        customImageBottomRight="/images/clover/bottom-vertical.png"
      />

      <div class="theme-body">
        <div class="theme-padding">
          <div
            class="theme-container-small"
            style="text-align: center; padding-top: 30px"
          >
            <div
              class="width width-80 width-mobile width-center content-center"
            >
              <div
                class="fonts fonts-14 black ViaodaLibre theme-invitation-animate"
                style="margin-bottom: 10px"
              >
                Merupakan suatu kerhormatan bagi kami apabila
                Bapak/Ibu/Saudara/i berkenan hadir untuk memberikan do'a restu.
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

      <div v-if="visibleSpecialThanks" class="theme-body theme-container">
        <div class="theme-padding">
          <div
            style="text-align: center; padding-top: 0; padding-bottom: 40px"
            class="theme-invitation-animate"
          >
            <h2
              class="fonts fonts-16 black semibold RoxboroughCF"
              style="color: #66806a"
            >
              Special Thanks
            </h2>
          </div>
          <AppCardSpecialThanks
            :data="selectedData.specialthanks"
            :customBorderRadius="'12px'"
            :enableAnimation="true"
          />
        </div>
      </div>

      <div v-if="visibleNote" class="theme-body theme-container-small">
        <div class="theme-padding">
          <div
            style="text-align: center; padding-top: 0; padding-bottom: 20px"
            class="theme-invitation-animate"
          >
            <h2
              class="fonts fonts-16 black semibold RoxboroughCF"
              :style="`color: #66806A;`"
            >
              Catatan
            </h2>
          </div>
          <AppCardNote
            :text="selectedData.invitation.note"
            :customBorderRadius="'12px'"
            :customBackground="'#DEEFEC'"
            :enableAnimation="true"
          />
        </div>
      </div>

      <div v-if="selectedData" class="theme-body theme-container">
        <div class="theme-padding">
          <div class="theme-container-small" style="text-align: center">
            <div
              v-if="selectedData.invitation.cover"
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
              style="padding-bottom: 30px"
            >
              <div class="fonts fonts-12 black theme-invitation-animate">
                See You on Our Big Day
              </div>
              <div style="padding-bottom: 20px; padding-top: 20px">
                <h2
                  class="fonts fonts-24 black semibold RoxboroughCF theme-invitation-animate"
                  style="color: #66806a"
                  v-html="generateTitle"
                ></h2>
              </div>
              <div
                class="display-flex center theme-invitation-animate"
                style="position: relative; width: 100%"
              >
                <a
                  :href="`http://www.google.com/calendar/render?action=TEMPLATE&text=${selectedData.invitation.title.replace('&', 'dan')}&dates=${selectedDate}&details=Undangan pernikahan ${selectedData.invitation.title.replace('&', 'dan')}&location=${selectedData.invitation.description}&trp=false&sprop=&sprop=name:`"
                  target="_blank"
                >
                  <button
                    class="btn btn-main"
                    :style="`background-color: #66806A; border-color: #66806A; color: #fff;`"
                  >
                    Tambah ke Google Calendar
                    <i class="icn icn-right fa fa-lw fa-calendar-alt" />
                  </button>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div 
        v-if="data.invitation.is_prokes_enable" 
        class="theme-body theme-container">
        <div class="theme-padding">
          <div
            style="
              width: 80%;
              margin: auto;
              text-align: center;
              padding-bottom: 20px;
              padding-top: 10px;
            "
          >
            <div
              class="display-flex center theme-invitation-animate"
              style="padding-bottom: 10px"
            >
              <div class="card-value red">COVID-19</div>
            </div>
            <h2
              class="fonts fonts-16 black semibold RoxboroughCF theme-invitation-animate"
              style="color: #66806a; margin-bottom: 5px"
            >
              Protokol Kesehatan
            </h2>
            <div
              class="fonts fonts-11 black theme-invitation-animate"
              style="margin-bottom: 10px"
            >
              Stop penyebaran Covid-19 dengan menerapkan protokol kesehatan
            </div>
          </div>
          <AppCardProkesGrid
            :customBorderRadius="'12px'"
            customBackground="#B4C6A6"
            :enableAnimation="true"
          />
        </div>
      </div>
    </div>

    <FooterSecondComponent
      backgroundColor="#66806A"
      textColor="#fff"
      buttonBackgroundColor="#fff"
      buttonBorderColor="#66806A"
      textButtonColor="#66806A"
    />

    <AppGustGreetings
      v-if="visibleGreeting"
      :customBackgroundColor="'#fff'"
      :customMainColor="'#66806A'"
      :customMainFont="'RoxboroughCF'"
      :onClick="closeGuestGreeting"
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
        @click="scrollToTarget('clover-theme-header')"
      >
        <i class="fa fa-lg fa-user-friends" style="color: #66806a"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('clover-theme-ceremony')"
      >
        <i class="fa fa-lg fa-calendar-alt" style="color: #66806a"></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('clover-theme-map')"
      >
        <i class="fa fa-lg fa-map-marker-alt" style="color: #66806a"></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('clover-theme-gallery')"
      >
        <i class="fa fa-lg fa-images" style="color: #66806a"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        @click="scrollToTarget('clover-theme-guest')"
      >
        <i class="fa fa-lg fa-calendar-check" style="color: #66806a"></i>
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
import AppImageBanner from '../../../../components/modules/AppImageBanner'
import AppBorderCircle from '../../../../components/modules/AppBorderCircle'
import AppCardProkesGrid from '../../../../components/modules/AppCardProkesGrid'
import AppCardDigitalGift from '../../../../components/modules/AppCardDigitalGift'
import AppCardSpecialThanks from '../../../../components/modules/AppCardSpecialThanks'
import AppCardEvent from '../../../../components/modules/AppCardEvent'
import AppSlideGallery from '../../../../components/modules/AppSlideGallery'
import AppCardVideo from '../../../../components/modules/AppCardVideo'
import AppCardNote from '../../../../components/modules/AppCardNote'
import FooterComponent from '../../Footer'
import FooterSecondComponent from '../../FooterSecond'
import AppGustGreetings from './Greetings'
import M from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  name: 'App',
  data() {
    return {
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
    visibleNote() {
      return this.selectedData.invitation.note
    },
  },
  components: {
    Carousel,
    Slide,
    AppCardVideo,
    AppCardSpecialThanks,
    AppCardDigitalGift,
    AppCardEvent,
    AppCardProkesGrid,
    AppGustGreetings,
    AppBorderCircle,
    AppImageBanner,
    AppBorderTop,
    AppImageBorder,
    AppImageCover,
    AppPopupComment,
    AppReservation,
    AppCardNote,
    AppSlideGallery,
    VueCountdown,
    FooterComponent,
    FooterSecondComponent,
  },
  methods: {
    closeGuestGreeting() {
      document.body.style.overflowY = 'auto'
      this.visibleGreeting = false
      this.scrollToTarget('clover-theme-header')
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
