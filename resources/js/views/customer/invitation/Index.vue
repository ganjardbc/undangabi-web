<template>
  <div id="InvitationMain" class="space-y-6">
    <div class="custom-invitation-cover rounded-xl overflow-hidden border border-hairline shadow-sm">
      <FormCover />
    </div>
    <div class="custom-invitation bg-surface-card rounded-xl p-6 border border-hairline flex flex-col md:flex-row items-center md:items-end justify-between space-y-4 md:space-y-0">
      <div class="flex flex-col md:flex-row items-center md:items-end space-y-4 md:space-y-0 md:space-x-6 w-full md:w-auto">
        <div class="ci-profile relative w-[130px] h-[70px] flex justify-center">
          <div class="ci-profile-image absolute -top-16">
            <FormProfile />
          </div>
        </div>
        <div class="ci-information flex-1 text-center md:text-left">
          <div class="flex flex-col md:flex-row items-center space-y-2 md:space-y-0 md:space-x-3 mb-2 justify-center md:justify-start">
            <h2 class="text-xl font-semibold text-ink font-display" v-html="invitationData.title"></h2>
            <span
              class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold border bg-canvas text-ink border-hairline uppercase tracking-wider"
            >
              <span
                class="w-1.5 h-1.5 mr-1.5 rounded-full"
                :class="invitationData.status === 'active' ? 'bg-success' : 'bg-warning'"
              ></span>
              {{ invitationData.status }}
            </span>
          </div>
          <div class="flex flex-wrap items-center justify-center md:justify-start gap-4 text-xs text-muted">
            <span class="flex items-center">
              <i class="el-icon-link mr-1 text-primary"></i>
              {{ invitationData.short_link }}
            </span>
            <span class="flex items-center">
              <i class="el-icon-collection-tag mr-1 text-primary"></i>
              {{ invitationCategory }}
            </span>
            <span class="flex items-center uppercase font-semibold">
              <i class="el-icon-star-on mr-1 text-primary"></i>
              {{ invitationData.type === 'diamond' ? 'Gold' : invitationData.type }}
            </span>
          </div>
        </div>
      </div>
      <div class="ci-button flex flex-wrap items-center gap-2 justify-center md:justify-end w-full md:w-auto">
        <el-button
          type="primary"
          icon="el-icon-edit"
          class="bg-primary hover:bg-primary-active border-none text-white font-semibold rounded-md h-10 px-5 transition-colors duration-300"
          @click="
            onRoute({
              name: 'invitation-informations',
              params: { id: invitationId },
            })
          "
        >
          Ubah Informasi
        </el-button>
        <el-popover placement="bottom-end" width="220" trigger="click" popper-class="bg-surface-card border-hairline">
          <div class="flex flex-col space-y-2 p-1">
            <router-link
              :to="{
                name: 'generate-only',
                params: {
                  id: invitationData && invitationData.short_link,
                },
              }"
              target="_blank"
              class="w-full"
            >
              <el-button size="small" icon="el-icon-view" class="w-full text-left bg-canvas hover:bg-surface-card border border-hairline text-ink font-semibold rounded-md transition-colors duration-300">
                Lihat Undangan
              </el-button>
            </router-link>
            <router-link
              :to="{
                name: 'generate-invitation',
                params: {
                  id: invitationData && invitationData.short_link,
                },
              }"
              target="_blank"
              class="w-full"
            >
              <el-button size="small" icon="el-icon-share" class="w-full text-left bg-canvas hover:bg-surface-card border border-hairline text-ink font-semibold rounded-md transition-colors duration-300">
                Public Generator
              </el-button>
            </router-link>
            <router-link
              :to="{
                name: 'generate-invitation-private',
                params: {
                  id: invitationData && invitationData.short_link,
                },
              }"
              target="_blank"
              class="w-full"
            >
              <el-button size="small" icon="el-icon-lock" class="w-full text-left bg-canvas hover:bg-surface-card border border-hairline text-ink font-semibold rounded-md transition-colors duration-300">
                Private Generator
              </el-button>
            </router-link>
            <AppPopupQrCodeSmall
              :code="`${initUrl}/${invitationData.short_link}`"
              :fileName="`qr-code-${invitationData.short_link}`"
              label="Undangan Digital"
              buttonLabel="QR Undangan"
              buttonStyle="el-button el-button--small w-full text-left bg-canvas hover:bg-surface-card border border-hairline text-ink font-semibold rounded-md transition-colors duration-300"
            />
          </div>
          <el-button
            slot="reference"
            icon="el-icon-more"
            class="bg-canvas hover:bg-surface-card border border-hairline text-ink rounded-full w-9 h-9 flex items-center justify-center transition-colors duration-300"
          ></el-button>
        </el-popover>
      </div>
    </div>

    <div class="flex items-center justify-between border-b border-hairline pb-4 mt-8">
      <h3 class="text-lg font-semibold text-ink font-display">Kelola Undangan</h3>
      <el-button-group>
        <el-button
          size="small"
          icon="el-icon-menu"
          :class="gridType === 'grid' ? 'bg-primary border-primary text-white font-semibold' : 'bg-canvas hover:bg-surface-card border border-hairline text-ink transition-colors duration-300'"
          @click="onChangeGrid('grid')"
        ></el-button>
        <el-button
          size="small"
          icon="el-icon-s-grid"
          :class="gridType === 'list' ? 'bg-primary border-primary text-white font-semibold' : 'bg-canvas hover:bg-surface-card border border-hairline text-ink transition-colors duration-300'"
          @click="onChangeGrid('list')"
        ></el-button>
      </el-button-group>
    </div>

    <div
      :class="`${gridType === 'grid' ? 'grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4' : 'flex flex-col space-y-3'}`"
    >
      <div
        v-for="(item, i) in menus"
        :key="i"
        class="group"
      >
        <div
          class="bg-surface-card hover:bg-canvas border border-hairline hover:border-primary transition-all duration-300 rounded-xl p-4 cursor-pointer shadow-sm hover:shadow-md flex items-center h-full"
          :class="`${gridType === 'grid' ? 'flex-col justify-center text-center py-6 space-y-3' : 'space-x-4'}`"
          @click="onRoute(item.link)"
        >
          <div
            class="w-12 h-12 rounded-full bg-canvas flex items-center justify-center text-primary group-hover:bg-primary group-hover:text-white transition-all duration-300"
          >
            <i :class="`${item.icon} text-lg`"></i>
          </div>
          <div>
            <div class="text-sm font-semibold text-ink group-hover:text-primary transition-colors duration-300">
              {{ item.label }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import FormCover from './FormCover'
import FormProfile from './FormProfile'
import AppPopupQrCodeSmall from '../../../components/modules/AppPopupQrCodeSmall'

export default {
  name: 'InvitationMain',
  components: {
    AppPopupQrCodeSmall,
    FormCover,
    FormProfile,
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
    gridType: {
      set(value) {
        this.$store.state.customerInvitation.gridType = value
      },
      get() {
        return this.$store.state.customerInvitation.gridType
      },
    },
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
    menus() {
      return [
        {
          icon: 'fa fa-lg fa-flag',
          label: 'Paket',
          value: 0,
          link: {
            name: 'invitation-package',
            params: { id: this.invitationId },
          },
          permission: 'invitations',
        },
        {
          icon: 'fa fa-lg fa-magic',
          label: 'Tema',
          value: 0,
          link: {
            name: 'invitation-themes',
            params: { id: this.invitationId },
          },
          permission: 'invitations',
        },
        {
          icon: 'fa fa-lg fa-music',
          label: 'Lagu Latar',
          value: 0,
          link: {
            name: 'invitation-songs',
            params: { id: this.invitationId },
          },
          permission: 'invitations',
        },
        {
          icon: 'fa fa-lg fa-user-friends',
          label: 'Pengantin',
          value: 0,
          link: {
            name: 'invitation-bride',
            params: { id: this.invitationId },
          },
          permission: 'brides',
        },
        // {
        //   icon: 'fa fa-lg fa-calendar-check',
        //   label: 'Jadwal Acara',
        //   value: 0,
        //   link: {
        //     name: 'invitation-event-schedule',
        //     params: { id: this.invitationId },
        //   },
        //   permission: 'invitations',
        // },
        {
          icon: 'fa fa-lg fa-calendar-alt',
          label: 'Daftar Acara',
          value: 0,
          link: {
            name: 'invitation-event',
            params: { id: this.invitationId },
          },
          permission: 'events',
        },
        {
          icon: 'fa fa-lg fa-map-marker-alt',
          label: 'Google-Map',
          value: 0,
          link: {
            name: 'invitation-google-map',
            params: { id: this.invitationId },
          },
          permission: 'guests',
        },
        {
          icon: 'fa fa-lg fa-heart',
          label: 'Love Story',
          value: 0,
          link: {
            name: 'invitation-love-story',
            params: { id: this.invitationId },
          },
          permission: 'guests',
        },
        {
          icon: 'fa fa-lg fa-images',
          label: 'Cover & Galeri',
          value: 0,
          link: {
            name: 'invitation-gallery',
            params: { id: this.invitationId },
          },
          permission: 'galleries',
        },
        {
          icon: 'fa fa-lg fa-video',
          label: 'Youtube Video',
          value: 0,
          link: {
            name: 'invitation-youtube-video',
            params: { id: this.invitationId },
          },
          permission: 'guests',
        },
        {
          icon: 'fa fa-lg fa-birthday-cake',
          label: 'Kado Digital',
          value: 0,
          link: {
            name: 'invitation-gift',
            params: { id: this.invitationId },
          },
          permission: 'guests',
        },
        {
          icon: 'fa fa-lg fa-thumbs-up',
          label: 'Special Thanks',
          value: 0,
          link: {
            name: 'invitation-special-thanks',
            params: { id: this.invitationId },
          },
          permission: 'specialthanks',
        },
      ]
    },
  },
  methods: {
    onRoute(data) {
      this.$router.push({ name: data.name, params: data.params })
    },
    onChangeGrid(data) {
      this.gridType = data
    },
  },
}
</script>
