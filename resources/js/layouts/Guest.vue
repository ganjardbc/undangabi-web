<template>
  <div id="WebLayouts">
    <div id="header">
      <div id="header-container">
        <div class="hc-logo">
          <router-link
            :to="{ name: 'generate' }"
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
          <div class="flex display-mobile">
            <div class="hc-menu-mobile">
              <div class="flex justify-between items-center">
                <div class="text-[11px] text-black font-semibold">Menu</div>
                <button class="btn btn-icon btn-white" @click="closeMenu">
                  <i class="fa fa-lg fa-times"></i>
                </button>
              </div>
            </div>
            <div class="hc-menu">
              <div class="hc-navigator">
                <ul class="navbar">
                  <li
                    v-for="(dt, index) in navbar"
                    :key="index"
                    @click="closeMenu"
                  >
                    <router-link :to="{ name: dt.link }">
                      {{ dt.label }}
                    </router-link>
                  </li>
                </ul>
              </div>
              <router-link :to="{ name: 'generate' }" class="hc-link">
                <button
                  class="btn btn-main width width-mobile"
                  @click="closeMenu"
                >
                  Buka Undangan
                </button>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="body">
      <router-view />
    </div>
    <div class="theme-footer" style="padding: 50px 0">
      <div class="theme-padding">
        <div class="theme-container content-center">
          <div class="flex center">
            <a href="mailto:admin@undangabi.com" style="padding: 0 5px">
              <button class="btn btn-icon btn-sekunder btn-small-radius">
                <i class="far fa-lg fa-envelope"></i>
              </button>
            </a>
            <a
              href="https://www.instagram.com/undangabi/"
              target="_blank"
              style="padding: 0 5px"
            >
              <button class="btn btn-icon btn-sekunder btn-small-radius">
                <i class="fab fa-lg fa-instagram"></i>
              </button>
            </a>
            <a
              href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
              target="_blank"
              style="padding: 0 5px"
            >
              <button class="btn btn-icon btn-sekunder btn-small-radius">
                <i class="fab fa-lg fa-whatsapp"></i>
              </button>
            </a>
            <a
              href="https://www.tokopedia.com/undangabi"
              target="_blank"
              style="padding: 0 5px"
            >
              <button class="btn btn-icon btn-sekunder btn-small-radius">
                <i class="fa fa-lw fa-shopping-cart"></i>
              </button>
            </a>
          </div>
          <div style="text-align: center; padding-top: 30px">
            <div class="text-[9px] text-gray-500">
              This Site All Right Reserved @2022
            </div>
            <div>
              <span class="text-[9px] text-gray-500">Powered by</span>
              <span class="text-[9px] text-black font-semibold">UNDANGABI</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <AppToast />
  </div>
</template>

<script>
import logo from '../../img/logo.png'
import logo2 from '../../img/icon.png'
import AppWrapper from '../components/modules/AppWrapper'
import AppButton from '../components/modules/AppButton'
import AppText from '../components/modules/AppText'
import SearchField from '../components/modules/SearchField'
import AppToast from '../components/modules/AppToast'

const navbar = [
  { label: 'Undangan Generator', link: 'invitation-generator' },
  { label: 'Daftar Tamu', link: 'guest-lists' },
]

export default {
  name: 'WebLayouts',
  data() {
    return {
      visibleMenu: false,
      logo: logo,
      logo2: logo2,
      navbar: navbar,
    }
  },
  components: {
    AppToast,
    AppWrapper,
    AppButton,
    AppText,
    SearchField,
  },
  methods: {
    openMenu() {
      this.visibleMenu = true
    },
    closeMenu() {
      this.visibleMenu = false
    },
  },
}
</script>
