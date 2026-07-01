<template>
  <div id="App">
    <div class="main-screen" style="padding-top: 0">
      <div class="main-screen" style="margin-top: 0">
        <div class="self-padding" style="padding-bottom: 0">
          <div class="space space-center">
            <h2
              class="fonts fonts-32px fonts-mobile-22px semibold black no-line-height"
            >
              Buat undangan ?
            </h2>
            <div class="display-flex center">
              <div
                class="bottom-line"
                style="margin-top: 15px; margin-bottom: 15px"
              ></div>
            </div>
            <div class="padding padding-left-15px padding-right-15px">
              <div class="fonts fonts-16px fonts-mobile-13px grey">
                Buat undangan disini mudah banget loh kamu bisa register, login
                lalu buat undangan kamu sendiri. <br />
                Atau bisa juga langsung hubungi kita via WhatsApp di sini <br />
                <a
                  href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
                  target="_blank"
                  >+62-8969-9181-669</a
                >
              </div>
            </div>
          </div>
        </div>

        <div
          class="width width-60 width-mobile width-center"
          style="padding-bottom: 40px"
        >
          <div
            class="card no-margin no-hover no-radius box-shadow"
            style="padding-top: 40px; padding-bottom: 20px"
          >
            <div class="content-center">
              <div
                class="fonts fonts-16px fonts-mobile-13px semibold black no-line-height"
              >
                Buat yang gak mau ribet
              </div>
              <div class="display-flex center">
                <div
                  class="bottom-line"
                  style="margin-top: 15px; margin-bottom: 15px"
                ></div>
              </div>
              <div class="display-flex center">
                <div class="card-value">
                  <i class="fa fa-lw fa-star" />
                  <span class="fonts fonts-14px fonts-mobile-11px white"
                    >Direkomendasikan</span
                  >
                </div>
              </div>
            </div>
            <div
              v-for="(dt, i) in data1"
              :key="i"
              class="card-step"
              style="margin-top: 15px; margin-bottom: 15px"
            >
              <div class="number">
                <div class="val fonts fonts-18px fonts-mobile-13px">
                  {{ dt.number }}
                </div>
              </div>
              <div class="info">
                <div style="padding: 5px 15px">
                  <div
                    class="fonts fonts-13px fonts-mobile-11px black semibold"
                    style="margin-bottom: 5px"
                  >
                    {{ dt.title }}
                  </div>
                  <div class="fonts fonts-13px fonts-mobile-11px grey">
                    <span v-html="dt.description"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div
          class="width width-60 width-mobile width-center"
          style="padding-bottom: 40px"
        >
          <div
            class="card no-margin no-hover no-radius box-shadow"
            style="padding-top: 40px; padding-bottom: 20px"
          >
            <div class="content-center">
              <div
                class="fonts fonts-16px fonts-mobile-13px semibold black no-line-height"
              >
                Buat kamu yang mandiri
              </div>
              <div class="display-flex center">
                <div
                  class="bottom-line"
                  style="margin-top: 15px; margin-bottom: 15px"
                ></div>
              </div>
            </div>
            <div
              v-for="(dt, i) in data2"
              :key="i"
              class="card-step"
              style="margin-top: 15px; margin-bottom: 15px"
            >
              <div class="number">
                <div class="val fonts fonts-18px fonts-mobile-13px">
                  {{ dt.number }}
                </div>
              </div>
              <div class="info">
                <div style="padding: 5px 15px">
                  <div
                    class="fonts fonts-13px fonts-mobile-11px black semibold"
                    style="margin-bottom: 5px"
                  >
                    {{ dt.title }}
                  </div>
                  <div class="fonts fonts-13px fonts-mobile-11px grey">
                    <span v-html="dt.description"></span>
                  </div>
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
export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Buat Undangan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      data1: [
        {
          number: '1',
          title: 'Chat kita via WhatsApp',
          description:
            'Kamu bisa menghubungi kita via chat di WhatsApp di kontak yang tersedia atau di nomor ini <a href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital" target="_blank">+62-8969-9181-669</a>',
        },
        {
          number: '2',
          title: 'Kirim data undangan',
          description:
            'Kirim data seperti tgl acara, nama mempelai, foto, video, lokasi dan lain sebagainya.',
        },
        {
          number: '3',
          title: 'Pilih tema atau request sendiri',
          description:
            'Kita bakal kasih rekomendasi tema ke kamu atau kamu bisa kustom tema sendiri tinggal kirim referensinya.',
        },
        {
          number: '4',
          title: 'Tunggu kita buatin undangannya',
          description:
            'Proses pengerjaan undangan website paling lama 1 sampai 3 hari setelah ada DP dan perjanjian yang bakal kita buat.',
        },
        {
          number: '5',
          title: 'Sebarkan undangan ke temen-temen kamu',
          description:
            'Selesai, kita bakal kirim alamat undangannya dan kamu tinggal share undangan tersebut.',
        },
      ],
      data2: [
        {
          number: '1',
          title: 'Registrasi akun di Undangabi',
          description:
            'Sebelum kamu buat undangan kamu harus buat akun dulu disini, gampang ko tinggal <a href="/register" target="_blank">Registrasi</a> akun dan <a href="/login" target="_blank">Login</a> ke akun kamu.',
        },
        {
          number: '2',
          title: 'Buat dan kelola undangan',
          description:
            'Buat undangan lalu isi data yang dibutuhkan seperti tgl pernikahan, nama mempelai, nama ortu, lokasi, foto-foto dan lain sebagainya.',
        },
        {
          number: '3',
          title: 'Pilih tema dan lagu yang kamu suka',
          description:
            'Kamu bisa memilih beberapa tema yang sudah kami sediakan atau kamu juga bisa request tema sendiri, tinggal chat kita via WhatsApp.',
        },
        {
          number: '4',
          title: 'Lakukan pembayaran',
          description:
            'Lakukan pembayaran lalu konfirmasi pembayaran via WhatsApp dan undangan kamu sudah siap digunakan.',
        },
        {
          number: '5',
          title: 'Sebarkan undangan ke semuanya',
          description:
            'Selesai, kamu tinggal sebarin undangannya ke temen-temen kamu.',
        },
      ],
    }
  },
}
</script>
