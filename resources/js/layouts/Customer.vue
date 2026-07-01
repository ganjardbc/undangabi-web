<template>
  <div id="App" class="min-h-screen bg-gray-50 text-gray-800 font-sans">
    <!-- Header/Navbar -->
    <header class="bg-white border-b border-gray-200/80 sticky top-0 z-40 shadow-sm backdrop-blur-md bg-white/95">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        <!-- Logo -->
        <div class="flex-shrink-0 flex items-center">
          <router-link
            :to="{ name: 'customer-dashboard' }"
            class="transition duration-150 hover:opacity-90"
          >
            <img :src="logo" alt="undang-abi" class="h-8 w-auto object-contain" />
          </router-link>
        </div>

        <!-- Mobile Menu Toggle Button -->
        <div class="flex items-center md:hidden">
          <el-button 
            @click="openMenu" 
            class="inline-flex items-center justify-center p-2 rounded-lg text-gray-500 hover:text-gray-700 hover:bg-gray-100 focus:outline-none transition duration-150 border-none bg-transparent"
          >
            <i class="fa fa-lg fa-bars"></i>
          </el-button>
        </div>

        <!-- Desktop Navigation Items -->
        <nav :class="visibleMenu ? 'fixed inset-0 z-50 bg-white flex flex-col md:static md:bg-transparent md:flex md:flex-row md:items-center' : 'hidden md:items-center md:space-x-4'">
          <!-- Mobile Close Button inside navigation wrapper -->
          <div class="flex items-center justify-between px-6 py-4 border-b border-gray-100 md:hidden">
            <span class="text-lg font-semibold text-gray-900">Menu</span>
            <el-button 
              @click="closeMenu" 
              class="p-2 rounded-lg text-gray-500 hover:bg-gray-100 transition duration-150 border-none bg-transparent"
            >
              <i class="fa fa-lg fa-times"></i>
            </el-button>
          </div>

          <div class="flex flex-col p-6 space-y-3 md:flex-row md:p-0 md:space-y-0 md:space-x-3">
            <router-link :to="{ name: 'home' }" class="block w-full md:w-auto">
              <el-button 
                class="w-full inline-flex items-center justify-center px-4 py-2 rounded-lg border border-gray-200 text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition duration-150"
                @click="closeMenu"
              >
                <i class="fa fa-lg fa-home mr-2 text-gray-400"></i> Home
              </el-button>
            </router-link>

            <!-- User Menu Popover -->
            <div class="relative block w-full md:w-auto">
              <el-popover placement="bottom-end" width="250" trigger="click">
                <div class="py-2">
                  <!-- User Profile Info -->
                  <div class="flex flex-col items-center px-4 py-3 border-b border-gray-100">
                    <div class="h-14 w-14 rounded-full bg-indigo-50 text-indigo-600 flex items-center justify-center mb-3">
                      <i v-if="!image" class="fa fa-2x fa-user-circle" />
                    </div>
                    <span class="text-sm font-semibold text-gray-900 text-center">{{ user && user.name }}</span>
                    <span class="text-xs text-gray-500 mt-0.5 capitalize">{{ user && user.role_name }}</span>
                  </div>

                  <!-- Action Links -->
                  <div class="p-2 space-y-1">
                    <router-link
                      v-if="user && user.role_name === 'admin'"
                      :to="{ name: 'dashboard' }"
                      target="_blank"
                      class="block"
                    >
                      <el-button class="w-full flex items-center px-3 py-2 rounded-lg text-sm text-gray-700 hover:bg-gray-50 transition duration-150 text-left border-none bg-transparent">
                        <i class="fa fa-lg fa-user-cog mr-2.5 text-gray-400"></i> Admin Panel
                      </el-button>
                    </router-link>

                    <el-button
                      class="w-full flex items-center px-3 py-2 rounded-lg text-sm text-red-600 hover:bg-red-50 transition duration-150 text-left border-none bg-transparent"
                      @click="onLogout"
                    >
                      <i class="fa fa-lg fa-power-off mr-2.5 text-red-500"></i> Logout
                    </el-button>
                  </div>
                </div>

                <!-- Popover Trigger -->
                <el-button 
                  slot="reference"
                  class="w-full inline-flex items-center justify-center px-4 py-2 rounded-lg border border-gray-200 text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition duration-150"
                >
                  <i class="far fa-lg fa-user mr-2 text-gray-400"></i>
                  {{ (user && user.name) || '-' }}
                </el-button>
              </el-popover>
            </div>
          </div>
        </nav>
      </div>
    </header>

    <!-- Main Content Area -->
    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <router-view />
    </main>

    <!-- Toast Notifications -->
    <AppToast />
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import logo from '../../img/logo.png'
import AppToast from '../components/modules/AppToast'

export default {
  name: 'App',
  data() {
    return {
      visibleMenu: false,
      logo: logo,
      image: '',
    }
  },
  components: {
    AppToast,
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      token: 'auth/token',
    }),
  },
  methods: {
    ...mapActions({
      removeCookieAuth: 'auth/removeCookieAuth',
      signOut: 'auth/signOut',
    }),
    async onLogout() {
      var a = confirm('logout your session ?')
      if (a) {
        const rest = await this.signOut(this.token)

        if (rest.data.status === 'ok') {
          this.removeCookieAuth()
          window.location = this.initUrl
        }
      }
    },
    openMenu() {
      this.visibleMenu = true
    },
    closeMenu() {
      this.visibleMenu = false
    },
  },
}
</script>
