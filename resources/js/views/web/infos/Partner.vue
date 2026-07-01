<template>
  <div id="App" style="padding-top: 0">
    <div class="main-screen" style="margin-top: 0">
      <div class="self-padding" style="padding-bottom: 0">
        <div class="space space-center">
          <h2
            class="fonts fonts-32px fonts-mobile-22px semibold black no-line-height theme-feature-animate"
          >
            Our Partner
          </h2>
          <div class="display-flex center">
            <div
              class="bottom-line theme-feature-animate"
              style="margin-top: 15px; margin-bottom: 15px"
            ></div>
          </div>
          <div class="padding padding-left-15px padding-right-15px">
            <p
              class="fonts fonts-16px fonts-mobile-13px grey theme-feature-animate"
            >
              Berikut Partner yang telah bergabung dengan UndangAbi.
            </p>
          </div>
        </div>
      </div>
      <div class="display-flex wrap center">
        <div
          v-for="(dt, i) in datas"
          :key="i"
          style="padding: 15px; padding-left: 20px; padding-right: 20px"
        >
          <img
            :src="dt.cover"
            alt=""
            style="height: 80px; filter: grayscale(100%)"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import essentialsLogo from '../../../../img/partners/essentials.png'
import eternaLogo from '../../../../img/partners/eterna.png'

export default {
  name: 'App',
  data() {
    return {
      datas: [{ cover: essentialsLogo }, { cover: eternaLogo }],
    }
  },
}
</script>
