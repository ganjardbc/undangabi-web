<template>
  <div class="min-h-screen bg-canvas text-ink flex flex-col font-sans">
    <!-- Header -->
    <header class="sticky top-0 z-30 w-full h-16 bg-canvas bg-opacity-95 backdrop-filter backdrop-blur-md border-b border-hairline flex items-center justify-between px-4 sm:px-6">
      <div class="flex items-center gap-3">
        <!-- Back Button -->
        <button 
          @click="backToInvitationList" 
          class="flex items-center gap-1.5 text-muted hover:text-ink transition-colors duration-150 text-sm font-medium focus:outline-none cursor-pointer"
        >
          <Icon icon="mdi:arrow-left" class="h-5 w-5 text-muted hover:text-ink" />
          <span class="hidden xs:inline">Kembali</span>
        </button>

        <span class="h-5 w-[1px] bg-hairline"></span>

        <!-- Logo / App Name -->
        <div class="flex items-center gap-2">
          <img :src="logo" alt="undang-abi" class="h-7 w-auto object-contain" />
          <span class="text-xs font-bold text-muted uppercase tracking-wider hidden sm:inline-block">Pengelola</span>
        </div>

        <!-- Invitation Details -->
        <div v-if="invitationData" class="flex items-center gap-2 sm:gap-3">
          <span class="h-4 w-[1px] bg-hairline hidden md:inline-block"></span>
          <div class="flex items-center gap-2">
            <span class="text-sm md:text-base font-semibold text-ink truncate max-w-[120px] sm:max-w-[200px]" v-html="invitationData.title"></span>
            <span 
              class="px-2 py-0.5 rounded-full text-xs font-medium uppercase tracking-wider inline-flex items-center border"
              :class="invitationData.payment_status ? 'bg-success bg-opacity-10 text-success border-success border-opacity-20' : 'bg-error bg-opacity-10 text-error border-error border-opacity-20'"
            >
              <span class="w-1.5 h-1.5 rounded-full mr-1.5" :class="invitationData.payment_status ? 'bg-success' : 'bg-error'"></span>
              {{ invitationData.payment_status ? 'Paid' : 'Unpaid' }}
            </span>
          </div>
        </div>
      </div>

      <!-- Actions -->
      <div class="flex items-center gap-3">
        <!-- Quick Preview Link -->
        <a
          v-if="invitationData && invitationData.short_link"
          :href="`${initUrl}/${invitationData.short_link}`"
          target="_blank"
          class="hidden md:inline-flex"
        >
          <el-button size="small" plain class="inline-flex items-center hover:text-primary hover:border-primary">
            <Icon icon="mdi:eye" class="h-4 w-4 mr-1 text-muted" /> Lihat Undangan
          </el-button>
        </a>

        <!-- User Menu Popover -->
        <el-popover placement="bottom-end" width="220" trigger="click" popper-class="border-hairline bg-surface-card">
          <div class="w-full">
            <!-- User Profile Info -->
            <div class="flex flex-col items-center px-4 py-4 border-b border-hairline bg-canvas bg-opacity-50">
              <div class="h-12 w-12 rounded-full bg-surface-soft border border-hairline flex items-center justify-center mb-2">
                <Icon icon="mdi:account" class="h-7 w-7 text-muted" />
              </div>
              <span class="text-sm font-bold text-ink text-center">{{ user && user.name }}</span>
              <span class="text-xs text-muted mt-0.5 capitalize">{{ user && user.role_name }}</span>
            </div>

            <!-- Action Links -->
            <div class="p-2 space-y-1 bg-surface-card">
              <a
                v-if="invitationData && invitationData.short_link"
                :href="`${initUrl}/${invitationData.short_link}`"
                target="_blank"
                class="block md:hidden"
              >
                <el-button size="small" plain class="w-full text-left inline-flex items-center">
                  <Icon icon="mdi:eye" class="h-4 w-4 mr-1.5 text-muted" /> Lihat Undangan
                </el-button>
              </a>
              <router-link
                v-if="user && user.role_name === 'admin'"
                :to="{ name: 'dashboard' }"
                target="_blank"
                class="block"
              >
                <el-button size="small" plain class="w-full text-left inline-flex items-center">
                  <Icon icon="mdi:cog" class="h-4 w-4 mr-1.5 text-muted" /> Admin Panel
                </el-button>
              </router-link>

              <el-button
                size="small"
                plain
                class="w-full text-left inline-flex items-center text-error hover:text-error hover:bg-error hover:bg-opacity-5 hover:border-error hover:border-opacity-20"
                @click="onLogout"
              >
                <Icon icon="mdi:logout" class="h-4 w-4 mr-1.5 text-error" /> Logout
              </el-button>
            </div>
          </div>

          <!-- Popover Trigger -->
          <button 
            slot="reference"
            class="h-9 w-9 flex items-center justify-center rounded-full border border-hairline hover:border-primary hover:text-primary focus:outline-none transition-all duration-150 cursor-pointer"
          >
            <Icon icon="mdi:account" class="h-5 w-5 text-muted" />
          </button>
        </el-popover>

        <!-- Mobile Menu Toggle Button -->
        <button 
          class="inline-flex items-center justify-center p-2 rounded-md text-muted hover:text-ink hover:bg-surface-soft focus:outline-none md:hidden transition-colors duration-150 cursor-pointer"
          @click="visibleSideBar = !visibleSideBar"
        >
          <Icon icon="mdi:menu" class="h-6 w-6 text-muted" />
        </button>
      </div>
    </header>

    <!-- Main Container -->
    <div class="flex-1 flex w-full relative">
      <!-- Desktop Sidebar -->
      <aside class="w-64 bg-surface-card border-r border-hairline flex flex-col h-[calc(100vh-4rem)] sticky top-16 hidden md:flex flex-shrink-0 z-20">
        <!-- Sidebar Overview -->
        <div class="p-4 border-b border-hairline bg-canvas bg-opacity-30 flex flex-col gap-2">
          <div class="flex items-center justify-between">
            <span class="text-xs font-semibold text-muted uppercase tracking-wider">Tipe Paket</span>
            <span class="px-2.5 py-0.5 rounded text-xs font-bold bg-primary bg-opacity-10 text-primary uppercase tracking-wider">
              {{ invitationType }}
            </span>
          </div>
          <div class="text-xs text-muted flex items-center justify-between">
            <span>Kategori:</span>
            <span class="font-semibold text-ink capitalize">{{ invitationCategory || '-' }}</span>
          </div>
        </div>

        <!-- Sidebar Menu Items -->
        <div class="flex-1 overflow-y-auto p-4">
          <span class="text-xs font-bold text-muted uppercase tracking-wider px-3 block mb-3">Navigasi Utama</span>
          <AppGridMenu :data.sync="sidebar" />
        </div>

        <!-- Sidebar Footer / Callout if Unpaid -->
        <div v-if="invitationData && !invitationData.payment_status" class="p-4 border-t border-hairline bg-primary bg-opacity-5">
          <div class="p-3 bg-white rounded-lg border border-hairline shadow-sm text-center">
            <p class="text-xs text-muted mb-2 font-medium">Undangan Anda belum aktif</p>
            <el-button 
              type="primary" 
              size="small" 
              class="w-full bg-primary hover:bg-primary-active border-none text-white font-semibold rounded-md transition-colors duration-150"
              @click="visiblePopupPayment = true"
            >
              Bayar Sekarang
            </el-button>
          </div>
        </div>
      </aside>

      <!-- Mobile Drawer Backdrop -->
      <transition name="fade">
        <div 
          v-if="visibleSideBar" 
          class="fixed inset-0 bg-black bg-opacity-40 z-40 md:hidden backdrop-filter backdrop-blur-sm"
          @click="visibleSideBar = false"
        ></div>
      </transition>

      <!-- Mobile Drawer Sidebar -->
      <transition name="slide-right">
        <aside 
          v-if="visibleSideBar" 
          class="fixed inset-y-0 left-0 w-64 bg-surface-card border-r border-hairline flex flex-col z-50 md:hidden h-full shadow-xl"
        >
          <!-- Mobile Drawer Header -->
          <div class="h-16 flex items-center justify-between px-4 border-b border-hairline bg-canvas">
            <div class="flex items-center gap-2">
              <img :src="logo" alt="undang-abi" class="h-6 w-auto object-contain" />
              <span class="text-xs font-semibold text-muted uppercase tracking-wider">Pengelola</span>
            </div>
            <button 
              class="p-2 rounded-md text-muted hover:text-ink hover:bg-surface-soft focus:outline-none cursor-pointer"
              @click="visibleSideBar = false"
            >
              <Icon icon="mdi:close" class="h-5 w-5 text-muted" />
            </button>
          </div>

          <!-- Mobile Drawer Overview -->
          <div class="p-4 border-b border-hairline bg-canvas bg-opacity-30 flex flex-col gap-2">
            <div class="flex items-center justify-between">
              <span class="text-xs font-semibold text-muted uppercase tracking-wider">Tipe Paket</span>
              <span class="px-2.5 py-0.5 rounded text-xs font-bold bg-primary bg-opacity-10 text-primary uppercase tracking-wider">
                {{ invitationType }}
              </span>
            </div>
            <div class="text-xs text-muted flex items-center justify-between">
              <span>Kategori:</span>
              <span class="font-semibold text-ink capitalize">{{ invitationCategory || '-' }}</span>
            </div>
          </div>

          <!-- Mobile Menu Items -->
          <div class="flex-1 overflow-y-auto p-4">
            <span class="text-xs font-bold text-muted uppercase tracking-wider px-3 block mb-3">Navigasi Utama</span>
            <AppGridMenu :data.sync="sidebar" @onClickMenu="visibleSideBar = false" />
          </div>

          <!-- Mobile Drawer Footer / Callout if Unpaid -->
          <div v-if="invitationData && !invitationData.payment_status" class="p-4 border-t border-hairline bg-primary bg-opacity-5">
            <div class="p-3 bg-white rounded-lg border border-hairline shadow-sm text-center">
              <p class="text-xs text-muted mb-2 font-medium">Undangan Anda belum aktif</p>
              <el-button 
                type="primary" 
                size="small" 
                class="w-full bg-primary hover:bg-primary-active border-none text-white font-semibold rounded-md transition-colors duration-150"
                @click="visiblePopupPayment = true; visibleSideBar = false"
              >
                Bayar Sekarang
              </el-button>
            </div>
          </div>
        </aside>
      </transition>

      <!-- Main Content Area -->
      <main class="flex-1 p-4 sm:p-6 md:p-8 bg-canvas min-h-[calc(100vh-4rem)] overflow-y-auto">
        <!-- Payment Warning Banner -->
        <div 
          v-if="invitationData && !invitationData.payment_status" 
          class="mb-6 p-4 bg-warning bg-opacity-5 border border-warning border-opacity-25 rounded-lg flex flex-col sm:flex-row sm:items-center justify-between gap-4 shadow-sm"
        >
          <div class="flex items-start gap-3">
            <div class="p-2 bg-warning bg-opacity-10 rounded-full text-warning flex-shrink-0 mt-0.5 sm:mt-0">
              <Icon icon="mdi:alert-circle" class="h-6 w-6 text-warning" />
            </div>
            <div>
              <h4 class="text-sm font-bold text-ink">Undangan Belum Aktif</h4>
              <p class="text-xs text-muted mt-0.5 leading-relaxed">
                Semua fitur pengeditan tetap dapat digunakan, tetapi undangan Anda tidak dapat diakses secara publik sebelum pembayaran selesai dikonfirmasi.
              </p>
            </div>
          </div>
          <el-button 
            type="primary" 
            size="small"
            class="self-start sm:self-auto bg-primary hover:bg-primary-active border-none text-white font-semibold rounded-md px-4 transition-colors duration-150 flex-shrink-0 h-9"
            @click="visiblePopupPayment = true"
          >
            Lakukan Pembayaran
          </el-button>
        </div>

        <AppDoPayment
          v-if="visiblePopupPayment"
          :data.sync="invitationData"
          @onClose="visiblePopupPayment = false"
        />

        <router-view />
      </main>
    </div>

    <AppToast />
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import logo from '../../img/logo.png'
import AppGridMenu from '../components/modules/AppGridMenu'
import AppToast from '../components/modules/AppToast'
import AppDoPayment from '../components/modules/AppDoPayment'

export default {
  name: 'invitation',
  data() {
    return {
      visiblePopupPayment: false,
      visibleSideBar: false,
      logo: logo,
      search: '',
      image: '',
      dataUser: null,
      visibleFormInvitation: false,
    }
  },
  components: {
    AppGridMenu,
    AppToast,
    AppDoPayment,
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
    this.getData()
  },
  methods: {
    ...mapActions({
      getCustomerInvitationById: 'customerInvitation/getByID',
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
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerInvitationById({
        id: this.invitationId,
        token: token,
      })
    },
    backToInvitationList() {
      this.$router.push({ name: 'customer-dashboard' })
    },
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      token: 'auth/token',
      invitationRaw: 'customerInvitation/selectedRaw',
      invitationData: 'customerInvitation/selectedData',
      invitationLoading: 'customerInvitation/loading',
    }),
    invitationId() {
      return this.$route.params.id
    },
    invitationType() {
      const type = this.invitationData && this.invitationData.type
      return type === 'diamond' ? 'Gold' : type
    },
    invitationCategory() {
      const category =
        this.invitationRaw &&
        this.invitationRaw.category &&
        this.invitationRaw.category.name
      return category
    },
    sidebar() {
      return [
        {
          icon: 'fa fa-lg fa-envelope-open',
          label: 'Undangan',
          value: 0,
          link: {
            name: 'invitation-home',
            params: { id: this.invitationId },
          },
          permission: 'invitations',
        },
        // {
        //     icon: 'fa fa-lg fa-envelope-open',
        //     label: 'Undangan',
        //     value: 0,
        //     link: {
        //         name: 'invitation-main',
        //         params: { id: this.invitationId }
        //     },
        //     permission: 'invitations'
        // },
        {
          icon: 'fa fa-lg fa-calendar-check',
          label: 'Reservasi',
          value: 0,
          link: {
            name: 'invitation-reservation',
            params: { id: this.invitationId },
          },
          permission: 'guests',
        },
        {
          icon: 'fa fa-lg fa-book-open',
          label: 'Buku Tamu',
          value: 0,
          link: {
            name: 'invitation-guest-book',
            params: { id: this.invitationId },
          },
          permission: 'guests',
        },
        {
          icon: 'fa fa-lg fa-cog',
          label: 'Pengaturan',
          value: 0,
          link: {
            name: 'invitation-setting',
            params: { id: this.invitationId },
          },
          permission: 'setting',
        },
      ]
    },
  },
}
</script>
<style scoped>
.payment-status-container .el-alert__content {
  width: 100%;
}

/* Slide-right Transition for Drawer */
.slide-right-enter-active,
.slide-right-leave-active {
  transition: transform 0.25s cubic-bezier(0.4, 0, 0.2, 1);
}
.slide-right-enter,
.slide-right-leave-to {
  transform: translateX(-100%);
}

/* Fade Transition for Backdrop */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.25s ease;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
