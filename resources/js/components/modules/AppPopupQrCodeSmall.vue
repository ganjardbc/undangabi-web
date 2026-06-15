<template>
  <div id="AppPopupQrCodeSmall">
    <button :class="`btn btn-full ${buttonStyle}`" @click="onOpen">
      <i v-if="buttonLabel" class="icn icn-left fa fa-lg fa-qrcode"></i>
      <span v-if="buttonLabel" class="fonts fonts-13px semibold">
        {{ buttonLabel ? buttonLabel : 'QR-Code' }}
      </span>
      <i v-if="!buttonLabel" class="icn fa fa-lg fa-qrcode"></i>
    </button>

    <div v-if="visiblePopup" class="display-popup">
      <div
        class="width width-450px width-center width-mobile margin margin-top-20px margin-bottom-20px"
      >
        <div class="padding padding-15px">
          <div class="card box-shadow bg-white">
            <div
              class="display-flex space-between align-center margin margin-bottom-15px"
            >
              <div class="fonts fonts-11 semibold black">
                {{ buttonLabel ? buttonLabel : 'QR-Code' }}
              </div>
              <button class="btn btn-white btn-icon" @click="onClose">
                <i class="fa fa-lg fa-times"></i>
              </button>
            </div>
            <div
              class="width width-100 margin margin-bottom-15px content-center"
              style="overflow: auto"
            >
              <AppLoader v-if="previewLoader" />
              <div
                style="
                  position: absolute;
                  width: auto;
                  margin: auto;
                  top: 0;
                  height: 1px;
                  overflow: hidden;
                "
              >
                <div
                  id="component-to-print"
                  class="width width-290px width-center bg-transparent"
                >
                  <div class="padding padding-10px">
                    <div
                      class="border-radius"
                      style="width: calc(100% - 8px); border: 4px solid #facc48"
                    >
                      <vue-qrcode :width="250" :value="code" />
                      <img
                        v-if="enableLogo"
                        :src="logo"
                        alt=""
                        width="100"
                        class="post-center"
                      />
                    </div>
                    <div
                      v-if="label"
                      class="btn btn-div btn-normal margin margin-top-15px"
                    >
                      <i class="icn icn-top-floating fa fa-lg fa-caret-up"></i>
                      {{ label || '-' }}
                    </div>
                  </div>
                </div>
              </div>
              <div class="padding padding-10px display-flex center">
                <div id="component-to-place"></div>
              </div>
            </div>
            <div class="width width-100">
              <button
                class="btn btn-full btn-sekunder"
                :disabled="previewLoader"
                @click="onDownloadCanvas('component-to-place')"
              >
                Save As Image
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import html2canvas from 'html2canvas'
import VueQrcode from 'vue-qrcode'
import AppLoader from './AppLoader'
import logo from '../../../img/logo.png'

export default {
  name: 'AppPopupQrCodeSmall',
  data() {
    return {
      logo: logo,
      visiblePopup: false,
      previewLoader: false,
    }
  },
  components: {
    VueQrcode,
    AppLoader,
  },
  props: {
    code: null,
    label: null,
    buttonLabel: null,
    buttonStyle: {
      default: 'btn-sekunder',
      required: false,
    },
    fileName: null,
    enableLogo: false,
  },
  methods: {
    generateReport() {
      console.log('generateReport')
    },
    onClose() {
      document.querySelector('#component-to-place').innerHTML = ''
      this.visiblePopup = false
    },
    onOpen() {
      this.previewLoader = true
      this.visiblePopup = true
      setTimeout(() => {
        this.onOpenCanvas('#component-to-print', '#component-to-place')
      }, 500)
    },
    onOpenCanvas(toPrint, toPlace) {
      html2canvas(document.querySelector(toPrint), {
        allowTaint: true,
        tainttest: true,
        logging: false,
        useCORS: true,
      })
        .then((canvas) => {
          document.querySelector(toPlace).appendChild(canvas)
        })
        .finally(() => {
          this.previewLoader = false
        })
    },
    onDownloadCanvas(toPlace) {
      const fileName = this.fileName ? `${this.fileName}.png` : `qr-code.png`
      const canvasElement = document.getElementById(toPlace).children[0]
      const canvasUrl = canvasElement
        .toDataURL('image/png')
        .replace('image/png', 'image/octet-stream')

      const downloadLink = document.createElement('a')
      downloadLink.href = canvasUrl
      downloadLink.download = fileName

      document.body.appendChild(downloadLink)
      downloadLink.click()
      document.body.removeChild(downloadLink)
    },
  },
}
</script>
