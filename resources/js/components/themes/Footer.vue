<template>
  <div id="App" class="theme-footer">
    <div class="theme-padding">
      <div class="theme-container">
        <div
          class="display-flex space-between display-mobile-column display-mobile-center"
        >
          <div>
            <div style="width: 240px; margin-bottom: 10px">
              <router-link :to="{ name: 'home' }">
                <img
                  :src="logo"
                  alt="undang-abi"
                  style="position: relative; width: 150px"
                />
              </router-link>
              <div class="fonts fonts-9 grey">
                This Site All Right Reserved @2022
              </div>
              <div>
                <span class="fonts fonts-9 grey">Powered by</span>
                <span class="fonts fonts-9 black smibold">UNDANGABI</span>
              </div>
            </div>
          </div>
          <div class="display-flex">
            <a href="mailto:admin@undangabi.com">
              <button class="btn btn-icon btn-white btn-small-radius">
                <i class="far fa-lg fa-envelope"></i>
              </button>
            </a>
            <a href="https://www.instagram.com/undangabi/" target="_blank">
              <button class="btn btn-icon btn-white btn-small-radius">
                <i class="fab fa-lg fa-instagram"></i>
              </button>
            </a>
            <a
              href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
              target="_blank"
            >
              <button class="btn btn-icon btn-white btn-small-radius">
                <i class="fab fa-lg fa-whatsapp"></i>
              </button>
            </a>
            <a href="https://www.tokopedia.com/undangabi" target="_blank">
              <button class="btn btn-icon btn-white btn-small-radius">
                <i class="fa fa-lw fa-shopping-cart" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import logo from '../../../img/logo.png'

export default {
  name: 'App',
  data() {
    return {
      logo: logo,
    }
  },
}
</script>
