<template>
  <!-- <VueHtml2pdf
        :show-layout="false"
        :float-layout="true"
        :enable-download="true"
        :preview-modal="true"
        :paginate-elements-by-height="1400"
        filename="myPDF"
        :pdf-quality="2"
        :manual-pagination="false"
        pdf-format="a4"
        pdf-orientation="landscape"
        pdf-content-width="800px"
        ref="html2Pdf"
    >
        <section slot="pdf-content">

        </section>
    </VueHtml2pdf> -->
  <div id="FormReceipt" class="display-popup">
    <div class="card-alert box-shadow post-middle" style="width: 900px">
      <div class="display-flex space-between align-center">
        <div>
          <div class="fonts micro semibold">
            {{ label ? label : 'Print Receipt' }}
          </div>
        </div>
        <div class="display-flex">
          <button class="btn btn-small-icon btn-white" @click="onPrint">
            <i class="fa fa-lw fa-print"></i>
          </button>
          <button class="btn btn-small-icon btn-white" @click="onClose">
            <i class="fa fa-lg fa-times"></i>
          </button>
        </div>
      </div>

      <div id="print-receipt">
        <div style="padding: 15px">
          <div class="display-flex" style="padding-bottom: 25px">
            <div style="width: 140px">
              <div class="fonts fonts-16 black semibold">UNDANGABI</div>
            </div>
            <div style="width: calc(100% - 140px)">
              <div class="display-flex space-between">
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    Dari:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black">Undangabi</div>
                  <div class="fonts fonts-10 black">di Tempat</div>
                  <div class="display-flex" style="padding-top: 15px">
                    <div class="width width-20">
                      <div class="fonts fonts-10 black">Tel:</div>
                    </div>
                    <div class="width width-80">
                      <div class="fonts fonts-10 black">021</div>
                    </div>
                  </div>
                  <div class="display-flex">
                    <div class="width width-20">
                      <div class="fonts fonts-10 black">Email:</div>
                    </div>
                    <div class="width width-80">
                      <div class="fonts fonts-10 black">
                        undangabi.official@gmail.com
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="display-flex" style="padding-bottom: 25px">
            <div style="width: 140px">
              <div class="display-flex space-between">
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold">Kepada:</div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black">Undangabi</div>
                  <div class="fonts fonts-10 black">di Tempat</div>
                </div>
              </div>
            </div>
            <div style="width: calc(100% - 140px)">
              <div
                class="display-flex space-between"
                style="padding-bottom: 15px"
              >
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    No Invoice:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black">-</div>
                </div>
              </div>
              <div
                class="display-flex space-between"
                style="padding-bottom: 15px"
              >
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    Tanggal Invoice:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black">-</div>
                </div>
              </div>
              <div
                class="display-flex space-between"
                style="padding-bottom: 15px"
              >
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    Batas Waktu:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black">-</div>
                </div>
              </div>
              <div class="display-flex space-between" style="padding-bottom: 0">
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    Status:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black">-</div>
                </div>
              </div>
            </div>
          </div>

          <div style="padding-bottom: 25px">
            <table class="normal-table fonts fonts-10">
              <thead>
                <tr>
                  <th>Produk</th>
                  <th>Deskripsi</th>
                  <th>Qty</th>
                  <th>Harga</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Undangan</td>
                  <td>-</td>
                  <td>1</td>
                  <td>Rp. 250.000,</td>
                  <td>Rp. 250.000,</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="display-flex space-between">
            <div></div>
            <div style="width: 285px">
              <div
                class="display-flex space-between"
                style="padding-bottom: 15px"
              >
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    Jumlah:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black text-align-right">
                    Rp. 250.000,
                  </div>
                </div>
              </div>
              <div
                class="display-flex space-between"
                style="padding-bottom: 15px"
              >
                <div class="width width-49">
                  <div class="fonts fonts-10 black semibold text-align-right">
                    Pajak:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-10 black text-align-right">-</div>
                </div>
              </div>
              <div
                class="display-flex space-between border-top border-bottom"
                style="padding-top: 15px; padding-bottom: 15px"
              >
                <div class="width width-49">
                  <div class="fonts fonts-13 black semibold text-align-right">
                    Total:
                  </div>
                </div>
                <div class="width width-49">
                  <div class="fonts fonts-13 black semibold text-align-right">
                    Rp. 250.000,
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
import VueHtml2pdf from 'vue-html2pdf'

export default {
  name: 'FormReceipt',
  mounted() {
    console.log('data', this.data)
  },
  components: {
    VueHtml2pdf,
  },
  props: {
    data: {
      default: null,
    },
    label: {
      default: null,
    },
    onClose: {
      default: null,
    },
    onSuccess: {
      default: null,
    },
  },
  watch: {
    data(props) {
      console.log('data', props)
    },
  },
  methods: {
    generateReport() {
      this.$refs.html2Pdf.generatePdf()
    },
    async onPrint() {
      await this.$htmlToPaper('print-receipt')
    },
  },
}
</script>
