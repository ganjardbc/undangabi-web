<template>
  <div id="WebLayouts" class="min-h-screen flex flex-col bg-canvas text-body font-sans antialiased">
    <!-- Header -->
    <header class="sticky top-0 z-50 w-full bg-canvas bg-opacity-95 backdrop-filter backdrop-blur-md border-b border-hairline">
      <div class="max-w-6xl mx-auto px-4 md:px-6 h-16 flex items-center justify-between">
        <!-- Logo -->
        <div class="w-28 md:w-32 flex-shrink-0">
          <router-link :to="{ name: 'home' }" class="block">
            <img :src="logo" alt="undang-abi" class="w-full" />
          </router-link>
        </div>

        <!-- Desktop Menu -->
        <nav v-if="isInHomePage" class="hidden md:flex items-center gap-8">
          <ul class="flex items-center gap-8">
            <li v-for="(dt, index) in navbar" :key="index">
              <a
                @click="onScrollTo(dt.link)"
                class="text-sm font-medium text-muted hover:text-ink transition-colors duration-200 cursor-pointer pb-0.5 border-b-2 border-transparent hover:border-primary"
              >
                {{ dt.label }}
              </a>
            </li>
          </ul>
        </nav>

        <!-- Desktop Auth CTAs -->
        <div class="flex items-center gap-3">
          <div v-if="user">
            <el-button
              type="primary"
              size="small"
              icon="el-icon-set-up"
              @click="toDashboard"
            >
              Dashboard
            </el-button>
          </div>
          <div v-else class="flex items-center gap-4">
            <router-link :to="{ name: 'login' }" class="hidden md:flex">
              <el-button type="text">
                Masuk
              </el-button>
            </router-link>
            <router-link :to="{ name: 'register' }">
              <el-button type="primary" size="small">
                Daftar Gratis
              </el-button>
            </router-link>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content Body -->
    <main id="body" class="flex-1">
      <router-view />
    </main>

    <!-- Footer -->
    <footer class="bg-surface-dark text-on-dark-soft pt-16 pb-10 border-t border-gray-800">
      <div class="max-w-6xl mx-auto px-0 md:px-6 grid grid-cols-1 md:grid-cols-12 gap-8">
        <!-- Brand & Copyright -->
        <div class="col-span-12 md:col-span-5 flex flex-col items-center md:items-start text-center md:text-left">
          <img :src="logo2" alt="undang-abi" class="w-10 mb-5 brightness-0 invert opacity-80" />
          <p class="text-lg font-normal text-on-dark font-display tracking-tight mb-2">UndangAbi</p>
          <p class="text-xs text-on-dark-soft/80 leading-relaxed max-w-xs font-sans">
            Platform pembuatan undangan digital yang praktis, cepat, dan elegan untuk momen terindah Anda.
          </p>
          <p class="mt-6 text-xs text-muted-soft">
            © {{ getFullYear }} UndangAbi. All Rights Reserved.
          </p>
        </div>

        <!-- Nav links -->
        <div class="col-span-12 sm:col-span-6 md:col-span-3 text-center md:text-left">
          <h4 class="text-[11px] font-semibold text-on-dark uppercase tracking-widest mb-5 font-sans">Navigasi</h4>
          <ul class="space-y-3 font-sans">
            <li>
              <router-link :to="{ name: 'home' }" class="text-sm text-on-dark-soft hover:text-on-dark transition-colors">
                Home
              </router-link>
            </li>
            <li>
              <router-link :to="{ name: 'about-us' }" class="text-sm text-on-dark-soft hover:text-on-dark transition-colors">
                Tentang Kami
              </router-link>
            </li>
            <li>
              <router-link :to="{ name: 'how-to-orders' }" class="text-sm text-on-dark-soft hover:text-on-dark transition-colors">
                Buat Undangan
              </router-link>
            </li>
          </ul>
        </div>

        <!-- Contact Links -->
        <div class="col-span-12 sm:col-span-6 md:col-span-4 text-center md:text-left">
          <h4 class="text-[11px] font-semibold text-on-dark uppercase tracking-widest mb-5 font-sans">Hubungi Kami</h4>
          <ul class="space-y-3 font-sans">
            <li>
              <a href="tel:+62-8969-9181-669" class="text-sm text-on-dark-soft hover:text-on-dark transition-colors block">
                <Icon icon="mdi:phone" class="w-3.5 h-3.5 inline mr-2 text-on-dark-soft text-opacity-50 align-middle" /> +62-8969-9181-669
              </a>
            </li>
            <li>
              <a href="mailto:admin@undangabi.com" class="text-sm text-on-dark-soft hover:text-on-dark transition-colors block break-all">
                <Icon icon="mdi:email" class="w-3.5 h-3.5 inline mr-2 text-on-dark-soft text-opacity-50 align-middle" /> admin@undangabi.com
              </a>
            </li>
            <li>
              <a href="mailto:undangabi.official@gmail.com" class="text-sm text-on-dark-soft hover:text-on-dark transition-colors block break-all">
                <Icon icon="mdi:email" class="w-3.5 h-3.5 inline mr-2 text-on-dark-soft text-opacity-50 align-middle" /> undangabi.official@gmail.com
              </a>
            </li>
          </ul>
          <div class="mt-6 flex justify-center md:justify-start gap-3">
            <a
              href="https://www.instagram.com/undangabi/"
              target="_blank"
              class="w-9 h-9 rounded-md border border-gray-800 hover:border-primary hover:bg-primary text-on-dark-soft hover:text-white transition-all duration-300 flex items-center justify-center text-sm"
            >
              <Icon icon="mdi:instagram" class="w-4 h-4" />
            </a>
            <a
              href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
              target="_blank"
              class="w-9 h-9 rounded-md border border-gray-800 hover:border-primary hover:bg-primary text-on-dark-soft hover:text-white transition-all duration-300 flex items-center justify-center text-sm"
            >
              <Icon icon="mdi:whatsapp" class="w-4 h-4" />
            </a>
          </div>
        </div>
      </div>
    </footer>

    <!-- Floating WhatsApp Widget -->
    <a
      href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
      target="_blank"
      class="fixed bottom-6 right-6 z-40 group animate-bounce"
    >
      <button class="relative flex items-center justify-center w-14 h-14 bg-green hover:bg-emerald-600 text-white rounded-full shadow-lg hover:shadow-xl hover:shadow-emerald-500/20 hover:scale-105 transition-all duration-300 active:scale-95">
        <span class="absolute inset-0 rounded-full bg-emerald-500/30 animate-ping -z-10"></span>
        <span class="absolute -top-1 -right-1 bg-primary text-white text-[10px] font-extrabold w-5 h-5 rounded-full flex items-center justify-center border-2 border-white shadow-sm">
          2
        </span>
        <Icon icon="mdi:whatsapp" class="w-6 h-6" />
      </button>
    </a>

    <AppToast />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import logo from '../../img/logo.png'
import logo2 from '../../img/icon.png'
import AppWrapper from '../components/modules/AppWrapper'
import AppButton from '../components/modules/AppButton'
import AppText from '../components/modules/AppText'
import SearchField from '../components/modules/SearchField'
import AppToast from '../components/modules/AppToast'

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
