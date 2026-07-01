<template>
  <div id="App" style="padding-top: 0">
    <div class="main-screen" style="margin-top: 0">
      <div class="self-padding" style="padding-bottom: 0">
        <div class="space space-center">
          <h2
            class="fonts fonts-32px fonts-mobile-22px font-semibold text-black no-line-height theme-feature-animate"
          >
            Fitur Undangan
          </h2>
          <div class="flex center">
            <div
              class="bottom-line theme-feature-animate"
              style="margin-top: 15px; margin-bottom: 15px"
            ></div>
          </div>
          <div class="p-4 pl-[15px] pr-[15px]">
            <p
              class="fonts fonts-16px fonts-mobile-13px text-gray-500 theme-feature-animate"
            >
              Berikut ini beberapa fitur-fitur utama yang akan ada di undangan
              kamu nanti.
            </p>
          </div>
        </div>
      </div>
      <div class="flex display-mobile flex-wrap">
        <div v-for="(dt, i) in fiturs" :key="i" class="width w-full md:w-[calc(33.33%-16px)]">
          <div style="padding: 15px">
            <div class="card-feature bg-white shadow-sm">
              <!-- HIDDEN TEMPORARY -->
              <!-- <div class="cover">
                <div class="image image-padding bg-white theme-feature-animate">
                  <img :src="dt.cover" alt="" />
                </div>
              </div> -->
              <div class="detail">
                <div
                  class="fonts fonts-16px fonts-mobile-13px text-black font-semibold theme-feature-animate"
                  style="margin-bottom: 5px"
                >
                  {{ dt.title }}
                </div>
                <div
                  class="fonts fonts-14px fonts-mobile-11px text-gray-500 theme-feature-animate"
                >
                  {{ dt.description }}
                </div>
              </div>
              <div
                v-if="dt.isNew"
                class="flex theme-feature-animate"
                style="position: absolute; top: 5px; right: 5px"
              >
                <div class="card-value">
                  <Icon icon="lucide:star" class="w-3.5 h-3.5" />
                  <span class="fonts fonts-14px fonts-mobile-11px white"
                    >Fitur Baru</span
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// import countdown from '../../../../img/countdown.png'
// import quotes from '../../../../img/quotes.png'
// import gallery from '../../../../img/gallery.png'
// import music from '../../../../img/music.png'
// import digitalGifts from '../../../../img/digital-gifts.png'
// import googleMap from '../../../../img/google-map.png'
// import guestBook from '../../../../img/guest-book.png'
// import guestQR from '../../../../img/guest-qr.png'
// import loveStory from '../../../../img/love-story.png'

export default {
  name: 'App',
  props: {
    enableAnimation: {
      default: false,
    },
  },
  data() {
    return {
      fiturs: [
        {
          // cover: guestQR,
          isNew: true,
          icon: 'lucide:circle',
          title: 'Scan QR-Code Tamu',
          description: 'Scan QR-Code tamu yang hadir di acara kamu.',
        },
        {
          // cover: guestBook,
          isNew: true,
          icon: 'lucide:circle',
          title: 'Buku Tamu',
          description: 'Mengelola tamu yang akan hadir dan tidak akan hadir.',
        },
        {
          // cover: googleMap,
          isNew: true,
          icon: 'lucide:circle',
          title: 'Google Map',
          description: 'Pin point lokasi acara dengan google map.',
        },
        {
          // cover: digitalGifts,
          isNew: false,
          icon: 'lucide:circle',
          title: 'Kado Digital',
          description:
            'Kado digital dengan informasi nomor rekening, e-wallet, dan lain-lain.',
        },
        {
          // cover: countdown,
          isNew: false,
          icon: 'lucide:circle',
          title: 'Hitung Mundur',
          description: 'Menghitung mundur hingga tanggal acaramu dilaksanakan.',
        },
        {
          // cover: loveStory,
          isNew: false,
          icon: 'lucide:circle',
          title: 'Love Story',
          description: 'Bagikan cerita cinta kamu dan pasanganmu.',
        },
        {
          // cover: quotes,
          isNew: false,
          icon: 'lucide:circle',
          title: 'Ucapan & Doa',
          description:
            'Tamu yang kamu undang bisa memberikan ucapan & doa mereka.',
        },
        {
          // cover: gallery,
          isNew: false,
          icon: 'lucide:circle',
          title: 'Galeri Foto',
          description:
            'Dapat menampilkan foto dan video cinematic dari YouTube.',
        },
        {
          // cover: music,
          isNew: false,
          icon: 'lucide:circle',
          title: 'Background Musik',
          description:
            'Undangan dapat dilengkapi oleh musik kesukaan Kamu dan pasanganmu.',
        },
      ],
    }
  },
}
</script>
