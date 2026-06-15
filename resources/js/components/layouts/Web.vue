<template>
  <div id="WebLayouts">
    <div id="header">
      <div id="header-container">
        <div class="hc-logo">
          <router-link
            :to="{ name: 'home' }"
            style="position: relative; width: 100%; top: 2px; left: 0"
          >
            <img :src="logo" alt="undang-abi" style="width: 100%" />
          </router-link>
        </div>
        <div class="hc-open">
          <button class="btn btn-icon btn-white" @click="openMenu">
            <i class="fa fa-lg fa-bars"></i>
          </button>
        </div>
        <div :class="visibleMenu ? 'hc-info open' : 'hc-info'">
          <div class="display-flex display-mobile">
            <div class="hc-menu-mobile">
              <div class="display-flex space-between align-center">
                <div class="fonts fonts-11 black semibold">Menu</div>
                <button class="btn btn-icon btn-white" @click="closeMenu">
                  <i class="fa fa-lg fa-times"></i>
                </button>
              </div>
            </div>
            <div class="hc-menu">
              <div class="hc-navigator">
                <ul v-if="isInHomePage" class="navbar">
                  <li
                    v-for="(dt, index) in navbar"
                    :key="index"
                    @click="closeMenu"
                  >
                    <a @click="onScrollTo(dt.link)">
                      {{ dt.label }}
                    </a>
                  </li>
                </ul>
                <ul v-else class="navbar">
                  <li @click="closeMenu">
                    <router-link :to="{ name: 'home' }">
                      Back to Home
                    </router-link>
                  </li>
                </ul>
              </div>
              <div v-if="user">
                <button class="btn btn-main hc-link" @click="toDashboard">
                  Dashboard
                </button>
              </div>
              <div v-else class="display-flex display-mobile">
                <router-link :to="{ name: 'login' }" class="hc-link">
                  <button
                    class="btn btn-sekunder width width-mobile"
                    @click="closeMenu"
                  >
                    Login
                  </button>
                </router-link>
                <router-link :to="{ name: 'register' }" class="hc-link">
                  <button
                    class="btn btn-main width width-mobile"
                    @click="closeMenu"
                  >
                    Register
                  </button>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="body">
      <router-view />
    </div>
    <div id="footer">
      <div id="footer-content">
        <div class="width width-30 width-mobile mobile-text-center">
          <img
            :src="logo"
            alt="undang-abi"
            style="position: relative; width: 150px; margin-bottom: 20px"
          />
          <div class="fonts fonts-13px fonts-mobile-11px grey">
            This Site All Right Reserved @{{ getFullYear }}
          </div>
          <div style="margin-bottom: 30px">
            <span class="fonts fonts-13px fonts-mobile-11px grey"
              >Powered by</span
            >
            <span class="fonts fonts-13px fonts-mobile-11px black semibold"
              >UNDANGABI</span
            >
          </div>
        </div>

        <div
          class="width width-45 width-mobile display-flex display-mobile space-between"
        >
          <div
            class="width width-50 width-mobile mobile-text-center"
            style="margin-bottom: 30px"
          >
            <div class="fonts fonts-13px grey" style="margin-bottom: 10px">
              About
            </div>
            <ul class="menu-list transparent">
              <li class="ml-list">
                <router-link :to="{ name: 'home' }" class="ml-link">
                  Home
                </router-link>
              </li>
              <li class="ml-list">
                <router-link :to="{ name: 'about-us' }" class="ml-link">
                  Tentang Kami
                </router-link>
              </li>
              <li class="ml-list">
                <router-link :to="{ name: 'how-to-orders' }" class="ml-link">
                  Buat Undangan
                </router-link>
              </li>
            </ul>
          </div>

          <div
            class="width width-50 width-mobile mobile-text-center"
            style="margin-bottom: 30px"
          >
            <div class="fonts fonts-13px grey" style="margin-bottom: 10px">
              Kontak
            </div>
            <ul class="menu-list transparent">
              <li class="ml-list">
                <a href="tel:+62-8969-9181-669" class="ml-link">
                  +62-8969-9181-669
                </a>
              </li>
              <li class="ml-list">
                <a href="mailto:admin@undangabi.com" class="ml-link">
                  admin@undangabi.com
                </a>
              </li>
              <li class="ml-list">
                <a href="mailto:undangabi.official@gmail.com" class="ml-link">
                  undangabi.official@gmail.com
                </a>
              </li>
            </ul>
          </div>
        </div>

        <div
          class="width width-13 width-mobile mobile-text-center"
          style="margin-bottom: 30px"
        >
          <div class="fonts fonts-13px grey" style="margin-bottom: 15px">
            Sosial Media
          </div>
          <div
            class="display-flex mobile-justify-center"
            style="margin-bottom: 15px"
          >
            <a
              href="https://www.instagram.com/undangabi/"
              target="_blank"
              style="margin-right: 5px"
            >
              <button class="btn btn-icon btn-small-radius btn-sekunder">
                <i class="fab fa-lg fa-instagram" />
              </button>
            </a>
            <a
              href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
              target="_blank"
              style="margin-right: 5px"
            >
              <button class="btn btn-icon btn-small-radius btn-sekunder">
                <i class="fab fa-lg fa-whatsapp" />
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>

    <a
      href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
      target="_blank"
      class="floating-bottom-right"
    >
      <button class="btn btn-big-icon btn-green">
        <span class="notif">2</span>
        <i class="fab fa-3x fa-whatsapp"></i>
      </button>
    </a>

    <AppToast />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import logo from '../../../img/logo.png'
import logo2 from '../../../img/icon.png'
import AppWrapper from '../modules/AppWrapper'
import AppButton from '../modules/AppButton'
import AppText from '../modules/AppText'
import SearchField from '../modules/SearchField'
import AppToast from '../modules/AppToast'

const navbar = [
  { label: 'Home', link: 'web-banner' },
  { label: 'Katalog', link: 'web-article' },
  { label: 'Harga', link: 'web-pricing' },
]

export default {
  name: 'WebLayouts',
  data() {
    return {
      visibleMenu: false,
      logo: logo,
      logo2: logo2,
      navbar: navbar,
      getFullYear: '',
    }
  },
  mounted() {
    const date = new Date()
    this.getFullYear = date.getFullYear()
  },
  components: {
    AppToast,
    AppWrapper,
    AppButton,
    AppText,
    SearchField,
  },
  methods: {
    ...mapActions({
      getCount: 'cart/getCount',
      getCountOrder: 'order/getCount',
    }),
    openMenu() {
      this.visibleMenu = true
    },
    closeMenu() {
      this.visibleMenu = false
    },
    getLocalCartCount() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      this.getCount(token)
    },
    getLocalOrderCount() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      this.getCountOrder(token)
    },
    toDashboard() {
      this.$router.push({ name: 'customer-dashboard' })
    },
    onScrollTo(link) {
      const targetElement = document.getElementById(link)
      if (targetElement) {
        targetElement.scrollIntoView({ behavior: 'smooth', block: 'start' })
      }
    },
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      permissions: 'auth/permissions',
      token: 'auth/token',
      cart: 'cart/count',
      order: 'order/count',
    }),
    isInHomePage() {
      return this.$route.name === 'home'
    },
  },
}
</script>
