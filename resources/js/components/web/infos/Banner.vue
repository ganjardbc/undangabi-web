<template>
  <div class="banner" style="margin-bottom: 0">
    <div class="banner-container">
      <div class="width width-100 padding padding-bottom-50px">
        <div
          class="fonts fonts-16px fonts-mobile-13px align-center main semibold theme-home-animate"
          style="margin-bottom: 5px"
        >
          UNDANGABI
        </div>
        <h1
          class="fonts fonts-42px fonts-mobile-28px align-center semibold black no-line-height theme-home-animate"
        >
          Platform Undangan Digital
        </h1>
        <div class="display-flex center">
          <div
            class="bottom-line theme-home-animate"
            style="margin-top: 15px; margin-bottom: 15px"
          ></div>
        </div>
        <p
          class="fonts fonts-16px fonts-mobile-13px align-center grey theme-home-animate"
        >
          Dikemas dalam bentuk website yang menarik bisa dibuat dan dibagikan
          kapan saja.
        </p>
      </div>
      <div class="width width-100 display-flex center">
        <div class="width width-300px width-mobile display-flex center">
          <router-link
            :to="{ name: 'how-to-orders' }"
            class="btn btn-main btn-full"
          >
            Buat Undangan ?
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Banner',
}
</script>
