<template>
  <div id="App" class="main-screen" style="margin-top: 0">
    <div class="self-padding" style="padding-bottom: 0">
      <div class="space space-center">
        <h2
          class="fonts fonts-32px fonts-mobile-22px font-semibold text-black no-line-height theme-home-animate"
        >
          Tema Undangan
        </h2>
        <div class="flex center">
          <div
            class="bottom-line theme-home-animate"
            style="margin-top: 15px; margin-bottom: 15px"
          ></div>
        </div>
        <div class="p-4 pl-[15px] pr-[15px]">
          <p class="fonts fonts-16px fonts-mobile-13px text-gray-500 theme-home-animate">
            Contoh tema undangan yang sudah bisa digunakan.
          </p>
        </div>
      </div>
    </div>
    <div class="flex display-mobile justify-between">
      <div class="width width-50 width-mobile">
        <div
          class="p-4 pl-[15px] pr-[15px] theme-home-animate"
        >
          <div class="width width-80 width-mobile width-center">
            <div
              class="image image-padding"
              style="background-color: #fff; padding-bottom: 78%"
            >
              <img class="img" :src="SimpleTheme" alt="" />
            </div>
          </div>
        </div>
      </div>
      <div class="width width-50 width-mobile">
        <div
          class="post-top post-mobile-none"
          style="
            width: calc(100% - 30px);
            padding-left: 15px;
            padding-right: 15px;
          "
        >
          <div>
            <h2
              class="fonts fonts-24px fonts-mobile-16px align-center-mobile font-semibold text-black no-line-height theme-home-animate"
            >
              Simpel & Elegan
            </h2>
            <div class="width w-full" style="padding-top: 15px">
              <div
                class="fonts fonts-16px fonts-mobile-13px align-center-mobile text-gray-500 theme-home-animate"
              >
                Gunakan tema simpel dan elegan di undangan kamu atau desain tema
                kamu sendiri.
              </div>
            </div>
          </div>
          <div
            class="width width-350px width-mobile flex theme-home-animate"
            style="padding-top: 15px"
          >
            <router-link
              :to="{ name: 'catalogs' }"
              class="btn btn-main btn-full"
            >
              Lihat Katalog Undangan
              <Icon icon="lucide:arrow-right" class="icn icn-right w-4 h-4" />
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import SimpleTheme from '../../../../img/all-theme-4.png'

export default {
  name: 'App',
  data() {
    return {
      SimpleTheme: SimpleTheme,
    }
  },
}
</script>
