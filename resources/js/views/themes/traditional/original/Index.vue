<template>
  <div
    id="App"
    class="theme"
    :style="`
            background-color: ${primaryColor};
            background-image: url(${'/images/traditional/cream/background.png'});
            background-repeat: repeat;
            background-size: contain;
        `"
  >
    <div class="theme-body">
      <div class="theme-header full" id="islamic-blue-theme-header">
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
            v-if="!visibleBronze && dataCovers.length > 0"
            class="theme-transparent bg-5"
          ></div>

          <div class="post-middle-absolute content-center" style="width: 100%">
            <div class="padding padding-bottom-15px">
              <div
                class="image image-150px image-center bg-transparent theme-invitation-animate"
              >
                <img src="/images/traditional/islami-blue/center.png" alt="" />
              </div>
            </div>
            <div
              class="fonts fonts-14 fonts-mobile-12 text-shadow VisiaPro theme-invitation-animate"
              :style="`color: ${tertiaryColor};`"
            >
              UNDANGAN ACARA
            </div>
            <h1
              class="fonts fonts-28 fonts-mobile-22 weight-normal ViaodaLibre text-shadow theme-invitation-animate"
              :style="`color: ${mainColor}; line-height: 1.3; margin-top: 10px; margin-bottom: 10px;`"
              v-html="selectedData.invitation.title"
            />
            <div v-if="guestName">
              <div
                class="fonts fonts-14 fonts-mobile-12 white center capitalize normal VisiaPro text-shadow theme-invitation-animate"
                :style="`color: #fff; margin-bottom: 5px; margin-top: 10px;`"
              >
                Kepada
              </div>
              <div
                class="fonts fonts-16 fonts-mobile-14 white center capitalize normal VisiaPro text-shadow theme-invitation-animate"
                :style="`color: #fff;`"
              >
                {{ guestName }}
              </div>
            </div>
          </div>
        </div>

        <div style="position: absolute; left: 0; top: 0; width: 100%">
          <img
            src="/images/traditional/islami-blue/top.png"
            style="width: 100%"
            alt=""
          />
        </div>

        <div style="position: absolute; left: 0; bottom: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/bottom-left.png"
            style="width: 100%"
            alt=""
          />
        </div>

        <div style="position: absolute; right: 0; bottom: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/bottom-right.png"
            style="width: 100%"
            alt=""
          />
        </div>
      </div>

      <div
        id="islamic-blue-theme-bride"
        class="theme-body"
        :style="`background-color: ${mainColor};`"
      >
        <div class="theme-container">
          <div
            class="theme-container-small"
            style="padding-top: 20px; padding-bottom: 0px"
          >
            <div class="theme-padding">
              <div class="padding padding-bottom-15px theme-invitation-animate">
                <div
                  class="image image-100px image-center bg-transparent"
                  style="height: 42px"
                >
                  <img
                    src="/images/traditional/cream/top-border-black.png"
                    alt=""
                  />
                </div>
              </div>
              <div
                style="
                  padding-bottom: 15px;
                  padding-left: 15px;
                  padding-right: 15px;
                  text-align: center;
                "
              >
                <div
                  class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre theme-invitation-animate"
                  :style="`color: ${primaryColor}; margin-bottom: 10px;`"
                >
                  Assalamu`alaikum Warahmatullaahi Wabarakaatuh
                </div>
                <div
                  v-if="!visibleGreetingQuotes"
                  class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                >
                  Dengan memohon Rahmat dan Ridho Allah SWT kami mengharapkan
                  kehadiran Bapak/Ibu/Saudara/i pada acara kami.
                </div>
                <div
                  v-else
                  class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                  v-html="selectedData.invitation.greeting_quotes"
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
              <div class="witdth width-100 content-center">
                <div
                  v-if="dt.bride.image"
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
                      class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
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
                      style="margin-top: 15px"
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
                      class="btn btn-sekunder btn-small-radius islamic-blue-button-date-content fonts fonts-12 VisiaPro"
                    >
                      <i class="icn icn-left fab fa-lg fa-instagram"></i>
                      Instagram
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body">
        <div style="position: absolute; left: 0; top: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/top-left.png"
            style="width: 100%"
            alt=""
          />
        </div>

        <div style="position: absolute; right: 0; top: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/top-right.png"
            style="width: 100%"
            alt=""
          />
        </div>
      </div>

      <div
        id="islamic-blue-theme-countdown"
        class="theme-body theme-container"
        style="padding-bottom: 50px"
      >
        <div class="theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Menuju Hari Acara
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 white VisiaPro theme-invitation-animate"
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
            <div
              class="time-2 theme-invitation-animate"
              :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
            >
              <div class="post-middle">
                <h4
                  class="fonts fonts-28 fonts-mobile-22 black ViaodaLibre"
                  :style="`color: ${primaryColor};`"
                >
                  {{ days }}
                </h4>
                <p class="fonts fonts-14 fonts-mobile-12 grey VisiaPro">Hari</p>
              </div>
            </div>
            <div
              class="time-2 theme-invitation-animate"
              :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
            >
              <div class="post-middle">
                <h4
                  class="fonts fonts-28 fonts-mobile-22 black ViaodaLibre"
                  :style="`color: ${primaryColor};`"
                >
                  {{ hours }}
                </h4>
                <p class="fonts fonts-14 fonts-mobile-12 grey VisiaPro">Jam</p>
              </div>
            </div>
            <div
              class="time-2 theme-invitation-animate"
              :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
            >
              <div class="post-middle">
                <h4
                  class="fonts fonts-28 fonts-mobile-22 black ViaodaLibre"
                  :style="`color: ${primaryColor};`"
                >
                  {{ minutes }}
                </h4>
                <p class="fonts fonts-14 fonts-mobile-12 grey VisiaPro">
                  Menit
                </p>
              </div>
            </div>
            <div
              class="time-2 theme-invitation-animate"
              :style="`background-color: ${mainColor}; border-color: ${mainColor};`"
            >
              <div class="post-middle">
                <h4
                  class="fonts fonts-28 fonts-mobile-22 black ViaodaLibre"
                  :style="`color: ${primaryColor};`"
                >
                  {{ seconds }}
                </h4>
                <p class="fonts fonts-14 fonts-mobile-12 grey VisiaPro">
                  Detik
                </p>
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
            class="btn btn-main islamic-blue-button-date-reverse fonts fonts-12 VisiaPro"
          >
            Tambah ke Google Calendar
            <i class="icn icn-right fa fa-lw fa-calendar-alt" />
          </a>
        </div>
      </div>

      <div
        v-if="visibleEvent"
        id="islamic-blue-theme-ceremony"
        class="theme-container"
      >
        <div class="theme-body theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Daftar Acara
            </h2>
          </div>
          <div class="width width-100">
            <AppCardEvent
              :data.sync="dataEvents"
              :enableAnimation="true"
              :customIconColor="primaryColor"
              :customMainColor="primaryColor"
              :customMainFont="'ViaodaLibre'"
              :customMainFontSize="'fonts-22 fonts-mobile-18'"
              :customPrimaryFont="'VisiaPro'"
              :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
              :customMainFontWeight="'weight-normal'"
              :customBorderRadius="'0px'"
            />
          </div>
        </div>
      </div>

      <div
        v-if="visibleMap"
        id="islamic-blue-theme-map"
        class="theme-container"
      >
        <div class="theme-body theme-padding" style="padding-bottom: 0">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Lokasi Acara
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 white VisiaPro theme-invitation-animate"
            >
              {{ selectedData.invitation.description }}
            </div>
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
            class="btn btn-main islamic-blue-button-date-reverse fonts fonts-12 VisiaPro"
          >
            Lihat Alamat pada Google-map
            <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
          </a>
        </div>

        <div style="padding-bottom: 60px"></div>
      </div>

      <div
        v-if="visibleLoveStory"
        id="islamic-blue-theme-ceremony"
        class="theme-container"
      >
        <div class="theme-body theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Our Love Story
            </h2>
          </div>
          <div class="width width-100">
            <AppCardLoveStory
              :data.sync="dataLoveStories"
              :enableAnimation="true"
              :customMainColor="mainColor"
              :customPrimaryColor="'#fff'"
              :customMainFont="'ViaodaLibre'"
              :customMainFontSize="'fonts-22 fonts-mobile-18'"
              :customPrimaryFont="'VisiaPro'"
              :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
              :customMainFontWeight="'weight-normal'"
              :customBorderRadius="'0px'"
            />
          </div>
        </div>
      </div>

      <div
        v-if="visibleGallery"
        id="islamic-blue-theme-moment"
        class="theme-container"
      >
        <div class="theme-body theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Galeri Foto
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
                  :paginationColor="'#fff'"
                  :paginationPosition="'#ff0000'"
                  :navigationColor="'#fff'"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div v-if="visibleVideo" class="theme-body">
        <div class="theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Video
            </h2>
          </div>
          <div
            class="padding padding-left-15px padding-right-15px theme-invitation-animate"
          >
            <div
              class="image youtube-video background-grey theme-invitation-animate"
            >
              <AppCardVideo :data="selectedData.invitation" height="300" />
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body" style="padding-top: 60px">
        <div style="position: absolute; left: 0; bottom: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/bottom-left.png"
            style="width: 100%"
            alt=""
          />
        </div>

        <div style="position: absolute; right: 0; bottom: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/bottom-right.png"
            style="width: 100%"
            alt=""
          />
        </div>
      </div>

      <div
        id="islamic-blue-theme-guest"
        class="theme-body"
        :style="`background-color: ${mainColor};`"
      >
        <div class="theme-container theme-padding" style="padding-bottom: 0">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img
                src="/images/traditional/cream/top-border-black.png"
                alt=""
              />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
            >
              Reservasi
            </h2>
          </div>
        </div>
        <div class="theme-container theme-invitation-animate-disable">
          <AppReservation
            innerClass="width width-100"
            :backgroundChatColor="mainColor"
            :backgroundButtonColor="primaryColor"
            textButtonColor="#fff"
            :mainColor="primaryColor"
          />
        </div>

        <div style="padding-bottom: 60px"></div>

        <div v-if="visibleComment" class="theme-container theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img
                src="/images/traditional/cream/top-border-black.png"
                alt=""
              />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
            >
              Amplop Digital
            </h2>
          </div>
          <div class="width width-100">
            <AppCardDigitalGift
              :data.sync="dataGifts"
              :enableAnimation="true"
              :customButton="'fonts fonts-12 VisiaPro'"
              :customMainFont="'VisiaPro'"
            />
          </div>
        </div>
      </div>

      <div class="theme-body">
        <div style="position: absolute; left: 0; top: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/top-left.png"
            style="width: 100%"
            alt=""
          />
        </div>

        <div style="position: absolute; right: 0; top: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/top-right.png"
            style="width: 100%"
            alt=""
          />
        </div>
      </div>

      <div v-if="visibleSpecialThanks" class="theme-container">
        <div class="theme-padding" style="padding-bottom: 0">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Special Thanks
            </h2>
          </div>
          <AppCardSpecialThanks
            :data="dataSpecialThanks"
            :customBorderRadius="'0px'"
            :enableAnimation="true"
            :customMainFont="'VisiaPro'"
          />
        </div>
      </div>

      <div v-if="selectedData" class="theme-body">
        <div class="theme-container-small theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>

          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Hormat Kami
            </h2>

            <div
              v-if="!visibleClosingQuotes"
              class="fonts fonts-14 fonts-mobile-12 white VisiaPro theme-invitation-animate"
              style="margin-bottom: 15px"
            >
              Merupakan suatu kerhormatan bagi kami apabila Bapak/Ibu/Saudara/i
              berkenan hadir untuk memberikan do'a.
            </div>
            <div
              v-else
              class="fonts fonts-14 fonts-mobile-12 white VisiaPro theme-invitation-animate"
              style="margin-bottom: 15px"
              v-html="selectedData.invitation.closing_quotes"
            ></div>
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

          <div class="theme-body">
            <div
              style="
                padding-left: 15px;
                padding-right: 15px;
                padding-top: 50px;
                padding-bottom: 50px;
                text-align: center;
              "
            >
              <div
                v-if="visibleNote"
                class="fonts fonts-14 fonts-mobile-12 white VisiaPro theme-invitation-animate"
                style="text-align: center"
                v-html="selectedData.invitation.note"
              />

              <div
                class="fonts fonts-22 fonts-mobile-18 white ViaodaLibre theme-invitation-animate"
                :style="`color: ${mainColor};`"
              >
                Wassalamualaikum Warahmatullaahi Wabarakaatuh
              </div>
            </div>
          </div>
        </div>
      </div>

      <div v-if="data.invitation.is_prokes_enable" class="theme-container">
        <div class="theme-body theme-padding">
          <div class="padding padding-bottom-15px theme-invitation-animate">
            <div
              class="image image-100px image-center bg-transparent"
              style="height: 42px"
            >
              <img src="/images/traditional/cream/top-border.png" alt="" />
            </div>
          </div>
          <div style="text-align: center; padding-top: 0; padding-bottom: 40px">
            <div
              class="display-flex center theme-invitation-animate"
              style="padding-bottom: 15px"
            >
              <div class="card-value red">COVID-19</div>
            </div>
            <h2
              class="fonts fonts-22 fonts-mobile-18 black ViaodaLibre weight-normal theme-invitation-animate"
              :style="`color: ${mainColor};`"
            >
              Protokol Kesehatan
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 white VisiaPro theme-invitation-animate"
              style="margin-bottom: 10px"
            >
              Stop penyebaran Covid-19 dengan menerapkan protokol kesehatan
            </div>
          </div>
          <AppCardProkesGrid
            :customMainFont="'VisiaPro'"
            :customBackground="mainColor"
            :enableAnimation="true"
          />
        </div>
      </div>

      <div class="theme-body">
        <div style="position: absolute; left: 0; bottom: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/bottom-left.png"
            style="width: 100%"
            alt=""
          />
        </div>

        <div style="position: absolute; right: 0; bottom: 0; width: 130px">
          <img
            src="/images/traditional/islami-blue/bottom-right.png"
            style="width: 100%"
            alt=""
          />
        </div>
      </div>

      <FooterSecondComponent
        :backgroundColor="mainColor"
        textColor="#1A1507"
        :buttonBackgroundColor="primaryColor"
        :buttonBorderColor="primaryColor"
        textButtonColor="#FFF"
        :enableBlackLogo="true"
      />
    </div>

    <AppGustGreetings
      :customMainFont="'ViaodaLibre'"
      :visible="visibleGreeting"
      :customBackgroundColor="'rgba(225, 225, 225, 0.34)'"
      :customMainColor="mainColor"
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
      class="theme-navigation box-shadow"
      :style="`background-color: ${mainColor};`"
    >
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('islamic-blue-theme-header')"
      >
        <i
          class="fa fa-lg fa-user-friends"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('islamic-blue-theme-countdown')"
      >
        <i class="fa fa-lg fa-clock" :style="`color: ${primaryColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('islamic-blue-theme-ceremony')"
      >
        <i
          class="fa fa-lg fa-calendar-alt"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('islamic-blue-theme-map')"
      >
        <i
          class="fa fa-lg fa-map-marker-alt"
          :style="`color: ${primaryColor};`"
        ></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('islamic-blue-theme-moment')"
      >
        <i class="fa fa-lg fa-images" :style="`color: ${primaryColor};`"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        :style="`background-color: ${mainColor}; border-color: rgba(0, 0, 0, 0);`"
        @click="scrollToTarget('islamic-blue-theme-guest')"
      >
        <i
          class="fa fa-lg fa-calendar-check"
          :style="`color: ${primaryColor};`"
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
      mainColor: '#F1D6AB',
      primaryColor: '#00204d',
      backgroundColor: '#00204d',
      tertiaryColor: '#FFFFFF',
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
    visibleGreetingQuotes() {
      return this.selectedData && this.selectedData.invitation.greeting_quotes
    },
    visibleClosingQuotes() {
      return this.selectedData && this.selectedData.invitation.closing_quotes
    },
  },
  components: {
    Carousel,
    Slide,
    AppCardVideo,
    AppCardEvent,
    AppCardLoveStory,
    AppSlideGallery,
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
      this.scrollToTarget('islamic-blue-theme-header')
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
.islamic-blue-time-container {
  border-color: rgba($color: #000, $alpha: 0) !important;
  background-color: rgba($color: #000, $alpha: 0.3) !important;
  width: 90px !important;
  height: 90px !important;
}
.islamic-blue-button-date {
  background-color: rgba($color: #000, $alpha: 0.5) !important;
  border-color: rgba($color: #000, $alpha: 0.5) !important;
  color: #00204d !important;
}
.islamic-blue-button-date-reverse {
  background-color: #f1d6ab !important;
  border-color: #f1d6ab !important;
  color: #00204d !important;
}
.islamic-blue-button-date-content {
  background-color: #00204d !important;
  border-color: #00204d !important;
  color: #fff !important;
}
</style>
