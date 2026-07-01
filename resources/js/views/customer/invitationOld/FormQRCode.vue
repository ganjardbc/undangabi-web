<template>
  <div id="App">
    <div class="width w-full">
      <button
        class="btn btn-main btn-full margin margin-top-15px"
        @click="onClose"
      >
        <i class="icn icn-left fa fa-lg fa-qrcode"></i> Lihat Kode QR
      </button>
    </div>

    <div v-if="visiblePopup" class="display-popup">
      <div
        class="width width-840px width-center width-mobile margin margin-top-20px margin-bottom-20px"
      >
        <div class="card shadow-sm bg-white">
          <div
            class="flex justify-between items-center margin mb-[15px]"
          >
            <div class="text-[11px] font-semibold text-black">Kode QR Undangan</div>
            <button class="btn btn-white btn-icon" @click="onClose">
              <i class="fa fa-lg fa-times"></i>
            </button>
          </div>

          <div class="width w-full" style="overflow: auto">
            <vue-html2pdf
              :show-layout="false"
              :float-layout="false"
              :enable-download="true"
              :preview-modal="true"
              :paginate-elements-by-height="1400"
              :filename="`qr-scanner-for-${invitationData.short_link}`"
              :pdf-quality="2"
              :manual-pagination="false"
              pdf-format="a4"
              pdf-orientation="portrait"
              pdf-content-width="800px"
              ref="html2Pdf"
            >
              <section slot="pdf-content">
                <div
                  class="width w-full bg-white flex flex-col center items-center"
                  style="height: 1000px"
                >
                  <div
                    class="p-4 padding-top-30px padding-bottom-30px"
                    style="text-align: center"
                  >
                    <div class="text-[11px] normal text-black items-center">
                      Selamat Datang di Acara Pernikahan
                    </div>
                    <div
                      class="fonts-24 font-semibold text-black items-center margin mb-[10px] margin-top-5px"
                    >
                      {{ invitationData.title }}
                    </div>
                    <div class="text-[11px] normal text-black items-center">
                      Jika Kamu diundang dengan menggunakan undangan digital,
                      <br />
                      maka Kamu dapat meng-scan kode QR ini untuk aktifasi
                      kehadiran Kamu.
                    </div>
                    <div
                      class="width width-270px width-center border-full margin margin-top-30px margin-bottom-30px"
                    >
                      <div class="p-4 padding-10px">
                        <vue-qrcode
                          :width="250"
                          :value="`${initUrl}/${invitationData.short_link}/guest-lists`"
                        />
                      </div>
                    </div>
                    <div
                      class="text-[11px] font-semibold text-black items-center margin mb-[10px]"
                    >
                      Berikut cara untuk aktifasi kehadiran Kamu:
                    </div>
                    <div class="width width-80 width-center">
                      <ol class="text-[11px] normal text-black align-left">
                        <li>Scan <b>QR-Code</b> berikut ini.</li>
                        <li>Cari nama kamu di daftar undangan.</li>
                        <li>
                          Jika belum ada kamu bisa mendaftarkan nama kamu di
                          "Buku Tamu".
                        </li>
                        <li>
                          Jika sudah ada kamu tinggal ubah status kehadiran kamu
                          ke <b>Hadir</b>.
                        </li>
                        <li>
                          Klik tombol <b>Save</b> maka kamu sudah berhasil
                          mengisi kehadiran.
                        </li>
                      </ol>
                    </div>
                    <div class="p-4 padding-30px">
                      <div class="text-[11px] font-semibold text-black items-center">
                        Powered by
                      </div>
                      <div class="width width-150px width-center">
                        <img :src="logo" alt="" style="width: 100%" />
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </vue-html2pdf>
          </div>
          <div class="p-4 pt-[15px]">
            <button class="btn btn-full btn-sekunder" @click="generateReport">
              <i class="icn icn-left fa fa-lw fa-print"></i> Cetak Template ke
              PDF
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import VueQrcode from 'vue-qrcode'
import logo from '../../../../img/logo.png'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
      visiblePopup: false,
    }
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
  },
  components: {
    VueQrcode,
  },
  props: {
    data: null,
  },
  methods: {
    generateReport() {
      this.$refs.html2Pdf.generatePdf()
    },
    onClose() {
      this.visiblePopup = !this.visiblePopup
    },
  },
}
</script>
