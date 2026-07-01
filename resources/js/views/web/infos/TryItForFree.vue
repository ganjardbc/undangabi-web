<template>
  <div class="bg-surface-dark border-y" style="border-color: rgba(230, 223, 216, 0.1);">
    <div class="max-w-5xl mx-auto px-6 py-20">
      <div class="grid grid-cols-1 md:grid-cols-2 items-center gap-14">
        <!-- Text details -->
        <div class="flex-1 text-center lg:text-left">
          <div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full font-semibold tracking-wider uppercase mb-6" style="background-color: rgba(204, 120, 92, 0.1); border: 1px solid rgba(204, 120, 92, 0.25); color: #cc785c; font-size: 11px;">
            Penawaran Spesial
          </div>
          <h2 class="font-display text-4xl md:text-5xl font-bold text-on-dark leading-tight -tracking-wide">
            Diskon Hingga<br />
            <span class="text-primary">{{ discountPercent }}</span>
          </h2>
          <p class="mt-5 text-on-dark-soft leading-relaxed text-sm md:text-base max-w-md mx-auto lg:mx-0 font-sans">
            Buat undangan hari ini, dapatkan diskon hingga
            <span class="font-semibold text-on-dark">{{ discountPercent }}</span> dan uji coba gratis selama
            <span class="font-semibold text-on-dark">7 hari</span>.
          </p>
          <div v-if="!disableButton" class="mt-8">
            <el-button
              type="primary"
              class="!inline-flex !items-center !justify-center !gap-2 !py-4.5 !px-7"
              @click="onScrollTo('web-pricing')"
            >
              Lihat Penawaran
              <i class="el-icon-arrow-right el-icon-right"></i>
            </el-button>
          </div>
        </div>

        <!-- Countdown timer -->
        <div class="w-full flex flex-col items-center">
          <VueCountdown
            :time="selectedTime"
            v-slot="{ days, hours, minutes, seconds }"
            class="flex items-center justify-center gap-2 md:gap-3 w-full"
          >
            <div class="flex flex-col items-center justify-center bg-surface-dark-elevated border rounded-lg w-20 h-20 md:w-24 md:h-24" style="border-color: rgba(230, 223, 216, 0.1);">
              <span class="text-2xl md:text-3xl font-normal text-on-dark font-display">{{ days }}</span>
              <span class="text-on-dark-soft font-medium uppercase tracking-widest mt-1 md:text-xs" style="font-size: 9px;">Hari</span>
            </div>
            <span class="text-xl md:text-2xl font-light text-on-dark-soft text-opacity-30">:</span>
            <div class="flex flex-col items-center justify-center bg-surface-dark-elevated border rounded-lg w-20 h-20 md:w-24 md:h-24" style="border-color: rgba(230, 223, 216, 0.1);">
              <span class="text-2xl md:text-3xl font-normal text-on-dark font-display">{{ hours }}</span>
              <span class="text-on-dark-soft font-medium uppercase tracking-widest mt-1 md:text-xs" style="font-size: 9px;">Jam</span>
            </div>
            <span class="text-xl md:text-2xl font-light text-on-dark-soft text-opacity-30">:</span>
            <div class="flex flex-col items-center justify-center bg-surface-dark-elevated border rounded-lg w-20 h-20 md:w-24 md:h-24" style="border-color: rgba(230, 223, 216, 0.1);">
              <span class="text-2xl md:text-3xl font-normal text-on-dark font-display">{{ minutes }}</span>
              <span class="text-on-dark-soft font-medium uppercase tracking-widest mt-1 md:text-xs" style="font-size: 9px;">Menit</span>
            </div>
            <span class="text-xl md:text-2xl font-light text-on-dark-soft text-opacity-30">:</span>
            <div class="flex flex-col items-center justify-center bg-surface-dark-elevated border rounded-lg w-20 h-20 md:w-24 md:h-24" style="border-color: rgba(230, 223, 216, 0.1);">
              <span class="text-2xl md:text-3xl font-normal text-primary font-display">{{ seconds }}</span>
              <span class="text-on-dark-soft font-medium uppercase tracking-widest mt-1 md:text-xs" style="font-size: 9px;">Detik</span>
            </div>
          </VueCountdown>
          <div class="mt-5 text-xs text-muted-soft">
            * Berakhir pada {{ nextDate | moment('Do MMMM YYYY') }}
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
