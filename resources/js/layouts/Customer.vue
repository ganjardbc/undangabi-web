<template>
  <div id="App" class="min-h-screen bg-canvas text-[#141413]">
    <!-- Header/Navbar -->
    <header class="sticky top-0 z-50 w-full bg-canvas bg-opacity-95 backdrop-filter backdrop-blur-md border-b border-hairline">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        <!-- Logo -->
        <div class="flex-1 flex-shrink-0 flex items-center">
          <router-link
            :to="{ name: 'home' }"
            class="transition duration-150 hover:opacity-90"
          >
            <img :src="logo" alt="undang-abi" class="h-8 w-auto object-contain" />
          </router-link>          
        </div>

        <!-- Actions -->
        <div class="flex items-center justify-end gap-4">
          <router-link 
            v-if="$route.name !== 'customer-create-invitation'"
            :to="{ name: 'customer-create-invitation' }" 
          >
            <el-button size="small" type="primary" class="inline-flex items-center">
              <i class="el-icon-plus" /> Buat Undangan
            </el-button>
          </router-link>

          <!-- User Menu Popover -->
          <el-popover placement="bottom-end" width="250" trigger="click">
            <div class="w-full">
              <!-- User Profile Info -->
              <div class="flex flex-col items-center px-4 py-3 border-b border-primary">
                <div class="h-14 w-14 rounded-full bg-gray-50 flex items-center justify-center mb-3">
                  <Icon v-if="!image" icon="mdi:account-circle" class="h-10 w-10" />
                </div>
                <span class="text-sm font-semibold text-[#141413] text-center">{{ user && user.name }}</span>
                <span class="text-xs text-[#6c6a64] mt-0.5 capitalize">{{ user && user.role_name }}</span>
              </div>

              <!-- Action Links -->
              <div class="p-2 space-y-1">
                <router-link
                  v-if="user && user.role_name === 'admin'"
                  :to="{ name: 'dashboard' }"
                  target="_blank"
                  class="block"
                >
                  <el-button
                    plain
                    class="w-full"
                  >
                    <i class="el-icon-setting" /> Admin Panel
                  </el-button>
                </router-link>

                <el-button
                  plain
                  class="w-full"
                  @click="onLogout"
                >
                  <i class="el-icon-setting" /> Logout
                </el-button>
              </div>
            </div>

            <!-- Popover Trigger -->
            <el-button 
              slot="reference"
              circle
              class="inline-flex items-center justify-center"
            >
              <Icon icon="mdi:account" class="h-4 w-4 text-[#8e8b82]" />
            </el-button>
          </el-popover>
        </div>
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
  },
}
</script>
