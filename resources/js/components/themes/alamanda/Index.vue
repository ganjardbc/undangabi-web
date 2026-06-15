<template>
  <div id="App" class="theme" style="background-color: #f6ebe2">
    <div id="alamanda-theme-header" class="theme-body">
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
                class="fonts fonts-14 fonts-mobile-12 text-shadow VisiaPro theme-invitation-animate"
                style="color: #f6ebe2; margin-bottom: 20px"
              >
                ~ Undangan Pernikahan ~
              </div>
              <h2
                class="fonts fonts-42 fonts-mobile-34 black semibold Gistesy theme-invitation-animate"
                style="color: #f6ebe2"
              >
                {{ data.invitation.title }}
              </h2>
              <div v-if="guestName" class="margin margin-top-20px">
                <div
                  class="fonts fonts-14 fonts-mobile-12 black center capitalize normal VisiaPro theme-invitation-animate"
                  style="color: #f6ebe2"
                >
                  Kepada :
                </div>
                <div
                  class="fonts fonts-18 fonts-mobile-16 black center capitalize normal VisiaPro theme-invitation-animate"
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

    <div id="alamanda-theme-bride" class="theme-body">
      <div
        class="theme-body bg-image-top"
        style="
          background-image: url('/images/alamanda/cover-top.jpeg');
          padding-top: 30px;
          padding-bottom: 0px;
        "
      >
        <div class="theme-padding theme-container">
          <div class="theme-container-small" style="text-align: center">
            <div
              class="width width-100 width-center content-center"
              style="padding-bottom: 30px"
            >
              <div style="padding-bottom: 20px; padding-top: 20px">
                <h2
                  class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy theme-invitation-animate"
                  style="color: #9d583d; margin-bottom: 15px"
                >
                  Bismillahirrahmanirrahim
                </h2>
                <h2
                  class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy theme-invitation-animate"
                  style="color: #9d583d"
                >
                  Assalamu`alaikum Warahmatullaahi Wabarakaatuh
                </h2>
              </div>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
              >
                Dengan memohon rahmat dan ridho Allah SWT, kami bermaksud
                mengundang Bapak/Ibu/Saudara/i untuk menghadiri acara pernikahan
                kami.
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        v-if="selectedData.brides"
        class="theme-body bg-image-bottom"
        style="background-image: url('/images/alamanda/cover-bottom.jpeg'); background-size: 100%;"
      >
        <div
          class="theme-container display-flex space-between align-center wrap center"
        >
          <div
            v-if="selectedData.brides[0]"
            class="width width-45 width-mobile"
          >
            <div
              class="theme-padding content-center"
              style="width: calc(100% - 30px); margin: auto"
            >
              <div
                v-if="selectedData.brides[0].bride.image"
                class="width width-180-px width-center"
                style="margin-bottom: 15px"
              >
                <div
                  class="image image-padding image-circle box-shadow theme-invitation-animate"
                  :style="`background-image: url(${selectedData.brides[0].bride.image ? brideImageThumbnailUrl + selectedData.brides[0].bride.image : ''});`"
                ></div>
              </div>
              <h2
                class="fonts fonts-26 fonts-mobile-22 black semibold Gistesy theme-invitation-animate"
                style="color: #9d583d; margin-bottom: 15px"
              >
                {{ selectedData.brides[0].bride.name }}
              </h2>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="color: #9d583d;"
              >
                {{ selectedData.brides[0].bride.nick_name }}
              </div>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="margin-top: 2px"
                v-html="selectedData.brides[0].bride.parent"
              ></div>
              <div
                v-if="selectedData.brides[0].bride.instagram_link"
                style="
                  padding-top: 20px;
                  text-align: center;
                  width: 40px;
                  margin: auto;
                "
                class="theme-invitation-animate"
              >
                <a
                  :href="selectedData.brides[0].bride.instagram_link"
                  target="_blank"
                >
                  <button class="btn btn-icon btn-sekunder btn-small-radius">
                    <i
                      class="fab fa-lg fa-instagram"
                      style="color: #9d583d"
                    ></i>
                  </button>
                </a>
              </div>
            </div>
          </div>
          <div
            v-if="selectedData.brides[1]"
            class="width width-10 width-mobile"
          >
            <h2
              class="fonts fonts-26 fonts-mobile-22 black semibold Gistesy align-center theme-invitation-animate"
              style="color: #9d583d"
            >
              &
            </h2>
          </div>
          <div
            v-if="selectedData.brides[1]"
            class="width width-45 width-mobile"
          >
            <div
              class="theme-padding content-center"
              style="width: calc(100% - 30px); margin: auto"
            >
              <div
                v-if="selectedData.brides[1].bride.image"
                class="width width-180-px width-center"
                style="margin-bottom: 15px"
              >
                <div
                  class="image image-padding image-circle box-shadow theme-invitation-animate"
                  :style="`background-image: url(${selectedData.brides[1].bride.image ? brideImageThumbnailUrl + selectedData.brides[1].bride.image : ''});`"
                ></div>
              </div>
              <h2
                class="fonts fonts-26 fonts-mobile-22 black semibold Gistesy theme-invitation-animate"
                style="color: #9d583d; margin-bottom: 15px"
              >
                {{ selectedData.brides[1].bride.name }}
              </h2>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="color: #9d583d;"
              >
                {{ selectedData.brides[1].bride.nick_name }}
              </div>
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="margin-top: 2px"
                v-html="selectedData.brides[1].bride.parent"
              ></div>
              <div
                v-if="selectedData.brides[1].bride.instagram_link"
                style="
                  padding-top: 20px;
                  text-align: center;
                  width: 40px;
                  margin: auto;
                "
                class="theme-invitation-animate"
              >
                <a
                  :href="selectedData.brides[1].bride.instagram_link"
                  target="_blank"
                >
                  <button class="btn btn-icon btn-sekunder btn-small-radius">
                    <i
                      class="fab fa-lg fa-instagram"
                      style="color: #9d583d"
                    ></i>
                  </button>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="theme-padding-bottom"></div>
      </div>
    </div>

    <div id="alamanda-theme-ceremony" style="background-color: #9d583d">
      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 30px"
          >
            <h2
              class="post-middle fonts fonts-14 fonts-mobile-12 white VisiaPro"
            >
              ~ Menuju Hari Bahagia ~
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
                  style="border-color: #9d583d; background-color: #f6ebe2"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black Gistesy"
                      style="color: #9d583d"
                    >
                      {{ days }}
                    </h2>
                    <p class="fonts fonts-11 black VisiaPro">Hari</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center"
              >
                <div
                  class="time-3 box-shadow theme-invitation-animate"
                  style="border-color: #9d583d; background-color: #f6ebe2"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black Gistesy"
                      style="color: #9d583d"
                    >
                      {{ hours }}
                    </h2>
                    <p class="fonts fonts-11 black VisiaPro">Jam</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center"
              >
                <div
                  class="time-3 box-shadow theme-invitation-animate"
                  style="border-color: #9d583d; background-color: #f6ebe2"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black Gistesy"
                      style="color: #9d583d"
                    >
                      {{ minutes }}
                    </h2>
                    <p class="fonts fonts-11 black VisiaPro">Menit</p>
                  </div>
                </div>
              </div>
              <div
                class="width width-row-4 width-row-mobile-2 display-flex center"
              >
                <div
                  class="time-3 box-shadow theme-invitation-animate"
                  style="border-color: #9d583d; background-color: #f6ebe2"
                >
                  <div class="post-middle">
                    <h2
                      class="fonts fonts-28 black Gistesy"
                      style="color: #9d583d"
                    >
                      {{ seconds }}
                    </h2>
                    <p class="fonts fonts-11 black VisiaPro">Detik</p>
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
                class="btn btn-main fonts fonts-12 VisiaPro"
                :style="`background-color: #F6EBE2; border-color: #F6EBE2; color: #9D583D;`"
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
      style="background-image: url('/images/alamanda/cover-top.jpeg')"
    >
      <div class="theme-padding theme-container">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-bottom: 20px; padding-top: 20px"
        >
          <h2
            class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy"
            style="color: #9d583d"
          >
            Daftar Acara
          </h2>
        </div>
        <div class="theme-container-small">
          <AppCardEvent
            :data.sync="selectedData.events"
            :enableAnimation="true"
            :customIconColor="'#9D583D'"
            :customMainColor="'#9D583D'"
            :customMainFont="'Gistesy'"
            :customMainFontSize="'fonts-26 fonts-mobile-22'"
            :customPrimaryFont="'VisiaPro'"
            :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
            :customMainFontWeight="'semibold'"
            :customBorderRadius="'12px'"
          />
        </div>
      </div>
    </div>

    <div v-if="visibleMap" id="alamanda-theme-map">
      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px; padding-top: 20px"
          >
            <h2
              class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy"
              style="color: #9d583d"
            >
              Lokasi Acara
            </h2>
          </div>

          <div class="width width-80 width-mobile width-center content-center">
            <div
              class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
            >
              {{ selectedData.invitation.description }}
            </div>
          </div>

          <div style="padding-bottom: 30px"></div>

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
                class="btn btn-main fonts fonts-12 VisiaPro"
                :style="`background-color: #9D583D; border-color: #9D583D; color: #fff;`"
              >
                Lihat Alamat pada Google-map
                <i class="icn icn-right fa fa-lw fa-map-marker-alt" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div v-if="visibleLoveStory" id="alamanda-theme-map">
      <div class="theme-body theme-container">
        <div class="theme-padding">
          <div
            style="text-align: center; padding-bottom: 20px; padding-top: 20px"
          >
            <h2
              class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy theme-invitation-animate"
              style="color: #9d583d"
            >
              Our Love Story
            </h2>
          </div>

          <div class="width width-100">
            <AppCardLoveStory
              :data.sync="dataLoveStories"
              :enableAnimation="true"
              :customMainColor="'#9D583D'"
              :customPrimaryColor="'#1A1507'"
              :customPrimaryFont="'VisiaPro'"
              :customPrimaryFontSize="'fonts-14 fonts-mobile-12'"
              :customMainFont="'Gistesy'"
              :customMainFontSize="'fonts-26 fonts-mobile-22'"
              :customMainFontWeight="'semibold'"
              :customBorderRadius="'0px'"
            />
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="visibleGallery || visibleVideo"
      id="alamanda-theme-gallery"
      class="theme-body bg-image-bottom"
      style="background-image: url('/images/alamanda/cover-bottom.jpeg')"
    >
      <div class="theme-body">
        <div v-if="visibleGallery" class="theme-padding theme-container-small">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 20px; padding-top: 20px"
          >
            <h2
              class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy"
              style="color: #9d583d"
            >
              Galeri Foto
            </h2>
          </div>
          <div class="width width-85 width-center" style="padding-bottom: 20px">
            <div class="theme-header small">
              <div class="theme-cover">
                <AppSlideGallery
                  :data.sync="selectedData.galleries"
                  :paginationActiveColor="'#9D583D'"
                  :paginationColor="'#555'"
                  :paginationPosition="'#ff0000'"
                />
              </div>
            </div>
          </div>
        </div>

        <div v-if="visibleVideo" class="theme-padding">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 15px"
          >
            <h2
              class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy"
              style="color: #9d583d"
            >
              Video
            </h2>
          </div>
          <div class="theme-container-small">
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
      style="background-color: #9d583d"
      id="alamanda-theme-guest"
    >
      <div v-if="visibleComment" class="theme-container">
        <div class="theme-padding theme-container-small">
          <div
            class="theme-invitation-animate"
            style="text-align: center; padding-bottom: 15px"
          >
            <h2
              class="post-middle fonts fonts-14 fonts-mobile-12 fonts-mobile-12 white VisiaPro"
            >
              ~ Kado Digital ~
            </h2>
          </div>
          <AppCardDigitalGift
            :enableAnimation="true"
            :customBorderRadius="'12px'"
            :customMainFont="'VisiaPro'"
            :customButton="'fonts fonts-12 VisiaPro'"
            :data.sync="selectedData.comments"
          />
        </div>

        <div style="padding-bottom: 60px"></div>
      </div>

      <div class="theme-body theme-container">
        <div
          class="theme-invitation-animate"
          style="text-align: center; padding-bottom: 30px"
        >
          <h2
            class="post-middle fonts fonts-14 fonts-mobile-12 fonts-mobile-12 white VisiaPro"
          >
            ~ Reservasi ~
          </h2>
        </div>

        <div class="width width-full">
          <AppReservation
            :innerClass="'width width-full'"
            :enableEnglish="false"
            :guest="guest"
            :data.sync="selectedData.guest"
            :invID.sync="selectedData.invitation.id"
            :invStringID.sync="selectedData.invitation.invitation_id"
            :invitation.sync="selectedData.invitation"
            backgroundChatColor="#F6EBE2"
            backgroundButtonColor="#9D583D"
            textButtonColor="#fff"
            mainColor="#9D583D"
          />
        </div>

        <div style="padding-bottom: 30px"></div>
      </div>
    </div>

    <div
      class="theme-body bg-image-center"
      style="
        background-image: url('/images/alamanda/cover-image.jpeg');
        background-size: 100%;
      "
    >
      <div v-if="visibleSpecialThanks" class="theme-body theme-container">
        <div class="theme-padding">
          <div class="theme-container" style="text-align: center">
            <div
              class="width width-100 width-mobile width-center content-center"
            >
              <div
                class="theme-invitation-animate"
                style="padding-bottom: 20px; padding-top: 20px"
              >
                <h2
                  class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy"
                  style="color: #9d583d"
                >
                  Special Thanks
                </h2>
              </div>
              <div class="width width-100">
                <AppCardSpecialThanks
                  :data="dataSpecialThanks"
                  :customBorderRadius="'12px'"
                  :enableAnimation="true"
                  :customMainFont="'VisiaPro'"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div v-if="visibleNote" class="theme-body">
        <div class="theme-padding">
          <div style="text-align: center">
            <div
              class="theme-invitation-animate"
              style="padding-bottom: 20px; padding-top: 20px"
            >
              <h2
                class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy"
                style="color: #9d583d"
              >
                Catatan
              </h2>
            </div>
            <div
              class="fonts fonts-14 fonts-mobile-12 fonts-mobile-12 black VisiaPro theme-invitation-animate"
              v-html="selectedData.invitation.note"
            ></div>
          </div>
        </div>
      </div>

      <div v-if="visibleClosingQuotes" class="theme-body theme-container">
        <div class="theme-padding">
          <div class="theme-container-small">
            <div
              class="fonts fonts-14 fonts-mobile-12 fonts-mobile-12 black VisiaPro theme-invitation-animate"
              style="text-align: center"
              v-html="selectedData.invitation.closing_quotes"
            ></div>
          </div>
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
            <div class="width width-100 width-center content-center">
              <div
                class="fonts fonts-14 fonts-mobile-12 fonts-mobile-12 black VisiaPro theme-invitation-animate"
              >
                See You on Our Big Day
              </div>
              <div class="theme-invitation-animate" style="padding-top: 20px">
                <h2
                  class="fonts fonts-42 fonts-mobile-34 black semibold Gistesy"
                  style="color: #9d583d"
                >
                  {{ data.invitation.title }}
                </h2>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="theme-body">
        <div class="theme-padding theme-container">
          <div class="theme-container-small" style="text-align: center">
            <div class="width width-100 width-center content-center">
              <div
                class="fonts fonts-14 fonts-mobile-12 black VisiaPro theme-invitation-animate"
                style="margin-bottom: 15px"
              >
                Merupakan suatu kerhormatan bagi kami apabila
                Bapak/Ibu/Saudara/i berkenan hadir untuk memberikan do'a restu.
              </div>
              <h2
                class="fonts fonts-22 fonts-mobile-18 black semibold Gistesy theme-invitation-animate"
                style="color: #9d583d"
              >
                Wassalamualaikum Warahmatullaahi Wabarakaatuh
              </h2>
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
              style="padding-bottom: 42px"
            >
              <div class="card-value red">COVID-19</div>
            </div>
            <h2
              class="fonts fonts-22 fonts-mobile-18 black align-center semibold Gistesy theme-invitation-animate"
              style="color: #9d583d"
            >
              Protokol Kesehatan
            </h2>
            <div
              class="fonts fonts-14 fonts-mobile-12 fonts-mobile-12 black align-center VisiaPro theme-invitation-animate"
              style="margin-bottom: 10px"
            >
              Stop penyebaran Covid-19 dengan menerapkan protokol kesehatan
            </div>
          </div>
          <AppCardProkesGrid
            :enableAnimation="true"
            :customBorderRadius="'12px'"
            customBackground="#F6EBE2"
            customMainFont="VisiaPro"
          />
        </div>
      </div>
    </div>

    <FooterSecondComponent
      backgroundColor="#9D583D"
      textColor="#fff"
      buttonBackgroundColor="#fff"
      buttonBorderColor="#9D583D"
      textButtonColor="#9D583D"
    />

    <AppGustGreetings
      :customBackgroundColor="'#F6EBE2'"
      :customMainColor="'#9D583D'"
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

    <div class="theme-navigation theme-2" style="background-color: #f6ebe2">
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        style="background-color: #f6ebe2; border-color: #f6ebe2"
        @click="scrollToTarget('alamanda-theme-bride')"
      >
        <i class="fa fa-lg fa-user-friends" style="color: #9d583d"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        style="background-color: #f6ebe2; border-color: #f6ebe2"
        @click="scrollToTarget('alamanda-theme-ceremony')"
      >
        <i class="fa fa-lg fa-calendar-alt" style="color: #9d583d"></i>
      </button>
      <button
        v-if="visibleMap"
        class="btn btn-icon btn-sekunder btn-small-radius"
        style="background-color: #f6ebe2; border-color: #f6ebe2"
        @click="scrollToTarget('alamanda-theme-map')"
      >
        <i class="fa fa-lg fa-map-marker-alt" style="color: #9d583d"></i>
      </button>
      <button
        v-if="visibleGallery"
        class="btn btn-icon btn-sekunder btn-small-radius"
        style="background-color: #f6ebe2; border-color: #f6ebe2"
        @click="scrollToTarget('alamanda-theme-gallery')"
      >
        <i class="fa fa-lg fa-images" style="color: #9d583d"></i>
      </button>
      <button
        class="btn btn-icon btn-sekunder btn-small-radius"
        style="background-color: #f6ebe2; border-color: #f6ebe2"
        @click="scrollToTarget('alamanda-theme-guest')"
      >
        <i class="fa fa-lg fa-calendar-check" style="color: #9d583d"></i>
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
import AppCardProkesGrid from '../../modules/AppCardProkesGrid'
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
    visibleClosingQuotes() {
      return this.selectedData && this.selectedData.invitation.closing_quotes
    },
  },
  components: {
    Carousel,
    Slide,
    AppCardVideo,
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
      this.scrollToTarget('alamanda-theme-header')
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
