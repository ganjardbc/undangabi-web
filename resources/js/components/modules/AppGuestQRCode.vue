<template>
  <div id="App">
    <div
      class="width width-280px width-mobile width-center p-4 padding-top-30px"
    >
      <div
        class="card bg-white shadow-sm content-center"
        style="border-radius: 5px"
      >
        <vue-qrcode
          :width="230"
          :value="`${initUrl}/${invitationShortLink}/${guestID}`"
        />
        <div class="micro text-black items-center margin margin-top-15px">
          {{
            enableEnglish
              ? 'Save this QR-Code with Screen Shoot This Section and Show This QR-Code To The Committee When Attending This Event.'
              : 'Simpan Kode QR dengan Screen Shoot Bagian Ini dan Tunjukan Kepada Panitia Saat Menghadiri Acara Nanti.'
          }}
        </div>
      </div>
    </div>

    <div v-if="visibleQRScanner" class="display-popup">
      <div class="post-middle-absolute width width-400px width-mobile">
        <div class="p-4 p-[15px]">
          <div class="card shadow-sm bg-white">
            <div
              class="flex justify-between items-center margin mb-[15px]"
            >
              <div class="text-[11px] font-semibold text-black">
                {{ enableEnglish ? 'Scan QR Invitation' : 'Scan QR Undangan' }}
              </div>
              <button class="btn btn-white btn-icon" @click="onClose">
                <i class="fa fa-lg fa-times"></i>
              </button>
            </div>
            <div v-if="!selectedInvitationID" class="width w-full">
              <qrcode-stream @decode="onDecode" @init="onInit">
                <div v-if="loading" class="post-middle-absolute">
                  <AppLoader
                    :title="enableEnglish ? 'Please Wait' : 'Mohon Tunggu'"
                  />
                </div>
              </qrcode-stream>
              <div class="margin margin-top-15px">
                <div class="text-[11px] items-center normal text-black">
                  {{
                    enableEnglish
                      ? 'Scan The QR-Code That Committee Has Been Set in This Event.'
                      : 'Scan Kode QR Yang Sudah Panitia Sediakan di Acara Ini.'
                  }}
                </div>
              </div>
            </div>
            <div v-if="selectedInvitationID">
              <div
                v-if="selectedInvitationID === invitationID"
                class="p-4 padding-30px"
              >
                <div class="flex flex-col items-center">
                  <i
                    class="fonts-64 primary far fa-4x fa-question-circle"
                  ></i>
                  <div
                    class="text-[12px] font-semibold text-black items-center margin margin-top-30px"
                  >
                    {{
                      enableEnglish
                        ? 'Invitation Found.'
                        : 'Data Undangan Ditemukan.'
                    }}
                  </div>
                  <div
                    class="text-[12px] normal text-black items-center margin margin-bottom-30px"
                  >
                    {{
                      enableEnglish
                        ? 'Change your present status to "Present" ?'
                        : 'Ubah status kehadiran kamu menjadi "Hadir" ?'
                    }}
                  </div>
                  <div class="flex justify-between width w-full">
                    <button
                      class="btn btn-grey width width-48"
                      @click="onClickNo"
                    >
                      {{ enableEnglish ? 'Cancel' : 'Batalkan' }}
                    </button>
                    <button
                      class="btn btn-main width width-48"
                      @click="onClickYes"
                    >
                      {{ enableEnglish ? 'Yes, Continue' : 'Iya, Lanjutkan' }}
                    </button>
                  </div>
                </div>
              </div>
              <div v-else class="p-4 padding-30px">
                <div class="flex flex-col items-center">
                  <i class="fonts-64 primary fa fa-4x fa-info-circle"></i>
                  <div
                    class="text-[12px] font-semibold text-black items-center margin margin-top-30px margin-bottom-30px"
                  >
                    {{
                      enableEnglish
                        ? 'Invitation Not Found.'
                        : 'Data Undangan Tidak Ditemukan.'
                    }}
                  </div>
                  <button
                    class="btn btn-full btn-sekunder"
                    @click="resetSelectedInvitationID"
                  >
                    {{
                      enableEnglish ? 'Rescan QR-Code.' : 'Scan Ulang Kode QR.'
                    }}
                  </button>
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
import VueQrcode from 'vue-qrcode'
import AppLoader from './AppLoader'

export default {
  name: 'App',
  data() {
    return {
      visibleQRScanner: false,
      selectedInvitationID: null,
      loading: false,
    }
  },
  components: {
    VueQrcode,
    AppLoader,
  },
  props: {
    invitationID: null,
    invitationShortLink: null,
    guestID: null,
    enableEnglish: false,
  },
  methods: {
    resetSelectedInvitationID() {
      this.selectedInvitationID = null
    },
    onOpen() {
      this.selectedInvitationID = null
      this.visibleQRScanner = true
    },
    onClose() {
      this.visibleQRScanner = false
    },
    onDecode(result) {
      const payload = JSON.parse(result)
      this.selectedInvitationID = payload.invitationId
    },
    async onInit(promise) {
      this.loading = true
      try {
        await promise
      } catch (error) {
        if (error.name === 'NotAllowedError') {
          this.error = 'ERROR: you need to grant camera access permisson'
        } else if (error.name === 'NotFoundError') {
          this.error = 'ERROR: no camera on this device'
        } else if (error.name === 'NotSupportedError') {
          this.error = 'ERROR: secure context required (HTTPS, localhost)'
        } else if (error.name === 'NotReadableError') {
          this.error = 'ERROR: is the camera already in use?'
        } else if (error.name === 'OverconstrainedError') {
          this.error = 'ERROR: installed cameras are not suitable'
        } else if (error.name === 'StreamApiNotSupportedError') {
          this.error = 'ERROR: Stream API is not supported in this browser'
        }
      } finally {
        this.loading = false
      }
    },
    onClickNo() {
      this.selectedInvitationID = null
      this.visibleQRScanner = false
    },
    onClickYes() {
      this.selectedInvitationID = null
      this.visibleQRScanner = false
      this.$emit('onSave')
    },
  },
}
</script>
