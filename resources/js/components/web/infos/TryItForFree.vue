<template>
  <div id="TryItForFree" class="bg-main">
    <div class="main-screen padding padding-top-30px padding-bottom-30px">
      <div class="padding padding-15px">
        <div
          class="display-flex row-reverse space-between align-center display-mobile"
        >
          <div class="width width-50 width-mobile">
            <h1 class="fonts fonts-32px fonts-mobile-22px black semibold">
              Diskon Hingga
              <span class="fonts fonts-32px fonts-mobile-22px red semibold">{{
                discountPercent
              }}</span>
              !!!
            </h1>
            <p class="fonts fonts-16px fonts-mobile-13px grey">
              Buat undangan hari ini dapatkan diskon hingga
              <span class="fonts semibold fonts-16px fonts-mobile-13px">{{
                discountPercent
              }}</span>
              dan uji coba gratis selama
              <span class="fonts semibold">7 hari</span>.
            </p>
          </div>
          <div
            class="width width-40 width-mobile padding padding-top-30px padding-bottom-30px"
          >
            <VueCountdown
              :time="selectedTime"
              v-slot="{ days, hours, minutes, seconds }"
              class="display-flex align-center space-between"
            >
              <div class="card bg-red box-shadow" style="padding: 0">
                <div class="padding padding-15px">
                  <div
                    class="fonts fonts-22px fonts-mobile-18px white semibold align-center"
                  >
                    {{ days }}
                  </div>
                  <div
                    class="fonts fonts-13px fonts-mobile-11px white align-center"
                  >
                    Hari
                  </div>
                </div>
              </div>
              <div class="padding padding-10px">
                <div class="fonts fonts-32px fonts-mobile-28px grey">:</div>
              </div>
              <div class="card bg-red box-shadow" style="padding: 0">
                <div class="padding padding-15px">
                  <div
                    class="fonts fonts-22px fonts-mobile-18px white semibold align-center"
                  >
                    {{ hours }}
                  </div>
                  <div
                    class="fonts fonts-13px fonts-mobile-11px white align-center"
                  >
                    Jam
                  </div>
                </div>
              </div>
              <div class="padding padding-10px">
                <div class="fonts fonts-32px fonts-mobile-28px grey">:</div>
              </div>
              <div class="card bg-red box-shadow" style="padding: 0">
                <div class="padding padding-15px">
                  <div
                    class="fonts fonts-22px fonts-mobile-18px white semibold align-center"
                  >
                    {{ minutes }}
                  </div>
                  <div
                    class="fonts fonts-13px fonts-mobile-11px white align-center"
                  >
                    Menit
                  </div>
                </div>
              </div>
              <div class="padding padding-10px">
                <div class="fonts fonts-32px fonts-mobile-28px grey">:</div>
              </div>
              <div class="card bg-red box-shadow" style="padding: 0">
                <div class="padding padding-15px">
                  <div
                    class="fonts fonts-22px fonts-mobile-18px white semibold align-center"
                  >
                    {{ seconds }}
                  </div>
                  <div
                    class="fonts fonts-13px fonts-mobile-11px white align-center"
                  >
                    Detik
                  </div>
                </div>
              </div>
            </VueCountdown>
          </div>
        </div>
        <div class="display-flex row-reverse space-between display-mobile">
          <div class="width width-50 width-mobile">
            <div
              v-if="!disableButton"
              class="width width-300px width-mobile padding padding-mobile-bottom-15px"
            >
              <button
                class="btn btn-red btn-div"
                style="margin-left: 0"
                @click="onScrollTo('web-pricing')"
              >
                Lihat Penawaran
              </button>
            </div>
          </div>
          <div class="width width-40 width-mobile">
            <div class="fonts fonts-13px fonts-mobile-11px grey">
              * Berakhir pada {{ nextDate | moment('Do MMMM YYYY') }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import VueCountdown from '@chenfengyuan/vue-countdown'
import moment from 'moment'

export default {
  name: 'TryItForFree',
  data() {
    return {
      discountPercent: this.discountType === 'promo-1' ? '30%' : '60%',
    }
  },
  props: {
    disableButton: false,
  },
  components: {
    VueCountdown,
  },
  computed: {
    currentDate() {
      return moment()
    },
    nextDate() {
      return moment().add(0, 'M').endOf('month')
    },
    selectedTime() {
      const currentTime = new Date(this.currentDate)
      const nextTime = new Date(this.nextDate)
      const result =
        currentTime != 'Invalid Date'
          ? nextTime.getTime() - currentTime.getTime()
          : null
      return result > 0 ? result : null
    },
  },
  methods: {
    onScrollTo(link) {
      const targetElement = document.getElementById(link)
      if (targetElement) {
        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' })
      }
    },
  },
}
</script>
