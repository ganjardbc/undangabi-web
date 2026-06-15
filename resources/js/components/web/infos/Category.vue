<template>
  <div id="App" class="main-screen" style="margin-top: 0">
    <div class="self-padding" style="padding-bottom: 0">
      <div class="space space-center">
        <h2
          class="fonts fonts-32px fonts-mobile-22px semibold black no-line-height theme-home-animate"
        >
          Apa Yang Kami Sediakan
        </h2>
        <div class="display-flex center">
          <div
            class="bottom-line theme-home-animate"
            style="margin-top: 15px; margin-bottom: 15px"
          ></div>
        </div>
        <div class="padding padding-left-15px padding-right-15px">
          <p class="fonts fonts-16px fonts-mobile-13px grey theme-home-animate">
            Atur acara pernikahanmu dari undangan hingga pencatatan kehadiran
            Tamu.
          </p>
        </div>
      </div>
    </div>
    <div class="display-flex center wrap">
      <div
        v-for="(dt, i) in fiturs"
        :key="i"
        class="width width-row-4 width-mobile"
      >
        <div class="padding padding-15px">
          <div class="card-category">
            <div class="cover">
              <div
                class="image image-padding image-circle bg-white box-shadow theme-feature-animate"
              >
                <i
                  :class="`post-middle-absolute fonts fonts-28px fonts-mobile-18px primary ${dt.icon}`"
                ></i>
              </div>
            </div>
            <div class="detail">
              <div
                class="fonts fonts-16px fonts-mobile-13px black semibold theme-feature-animate"
                style="margin-bottom: 5px"
              >
                {{ dt.title }}
              </div>
              <div
                class="fonts fonts-14px fonts-mobile-11px grey normal theme-feature-animate"
              >
                {{ dt.description }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import countdown from '../../../../img/countdown.png'
import quotes from '../../../../img/quotes.png'

export default {
  name: 'App',
  data() {
    return {
      fiturs: [
        {
          cover: countdown,
          isNew: false,
          icon: 'fa fa-lg fa-envelope-open',
          title: 'Undangan',
          description: 'Undangan digital dengan fitur-fitur unggulan.',
        },
        {
          cover: quotes,
          isNew: false,
          icon: 'fa fa-lg fa-calendar-alt',
          title: 'Reservasi',
          description: 'Atur reservasi Tamu dengan jadwal acara.',
        },
        {
          cover: quotes,
          isNew: false,
          icon: 'fa fa-lg fa-book-open',
          title: 'Buku Tamu',
          description: 'Catat kehadiran Tamu dengan Buku Tamu digital.',
        },
      ],
    }
  },
}
</script>
