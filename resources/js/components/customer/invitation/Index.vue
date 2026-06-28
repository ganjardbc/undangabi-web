<template>
  <div id="InvitationMain">
    <div class="custom-invitation-cover">
      <FormCover />
    </div>
    <div class="custom-invitation">
      <div class="ci-profile">
        <div class="ci-profile-image">
          <FormProfile />
        </div>
      </div>
      <div class="ci-information">
        <div class="padding padding-mobile-bottom-15px">
          <div
            class="display-flex align-center justify-center-mobile display-mobile-column padding padding-mobile-bottom-15px"
          >
            <div
              class="fonts big black semibold margin margin-right-10px"
              v-html="invitationData.title"
            />
            <div
              :class="`card-capsule ${invitationData.status === 'active' ? 'active' : ''}`"
              style="text-transform: capitalize; display: inline-block"
            >
              {{ invitationData.status }}
            </div>
          </div>
          <div class="display-flex justify-center-mobile">
            <div
              class="fonts fonts-11 normal grey overflow-ellipsis margin margin-right-15px"
            >
              <i
                class="fa fa-lw fa-link fonts fonts-10 main"
                style="width: 20px"
              ></i>
              {{ invitationData.short_link }}
            </div>
            <div
              class="fonts fonts-11 normal grey overflow-ellipsis capitalize margin margin-right-15px"
            >
              <i
                class="fa fa-lw fa-list-ol fonts fonts-10 main"
                style="width: 20px"
              ></i>
              {{ invitationCategory }}
            </div>
            <div
              class="fonts fonts-11 normal grey overflow-ellipsis capitalize"
            >
              <i
                class="fa fa-lw fa-flag fonts fonts-10 main"
                style="width: 20px"
              ></i>
              {{
                invitationData.type === 'diamond' ? 'Gold' : invitationData.type
              }}
            </div>
          </div>
        </div>
        <div class="ci-button">
          <div class="ci-button-edit">
            <button
              @click="
                onRoute({
                  name: 'invitation-informations',
                  params: { id: invitationId },
                })
              "
              class="btn btn-sekunder"
            >
              <i class="icn icn-left far fa-lg fa-edit"></i> Ubah Informasi
            </button>
          </div>
          <el-popover placement="bottom-end" width="220" trigger="click">
            <div class="width width-100">
              <router-link
                :to="{
                  name: 'generate-only',
                  params: {
                    id: invitationData && invitationData.short_link,
                  },
                }"
                target="_blank"
                class="width width-100"
              >
                <button class="btn btn-full btn-white btn-align-left">
                  <i class="icn icn-left far fa-lg fa-envelope-open"></i> Lihat
                  Undangan
                </button>
              </router-link>
              <router-link
                :to="{
                  name: 'generate-invitation',
                  params: {
                    id: invitationData && invitationData.short_link,
                  },
                }"
                target="_blank"
                class="width width-100"
              >
                <button class="btn btn-full btn-white btn-align-left">
                  <i class="icn icn-left fa fa-lg fa-lock-open"></i> Public
                  Generator
                </button>
              </router-link>
              <router-link
                :to="{
                  name: 'generate-invitation-private',
                  params: {
                    id: invitationData && invitationData.short_link,
                  },
                }"
                target="_blank"
                class="width width-100"
              >
                <button class="btn btn-full btn-white btn-align-left">
                  <i class="icn icn-left fa fa-lg fa-lock"></i> Private
                  Generator
                </button>
              </router-link>
              <AppPopupQrCodeSmall
                :code="`${initUrl}/${invitationData.short_link}`"
                :fileName="`qr-code-${invitationData.short_link}`"
                label="Undangan Digital"
                buttonLabel="QR Undangan"
                buttonStyle="btn-white btn-align-left"
              />
            </div>
            <button
              slot="reference"
              class="btn btn-sekunder btn-icon margin margin-left-10px"
            >
              <i class="fa fa-lw fa-ellipsis-h"></i>
            </button>
          </el-popover>
        </div>
      </div>
    </div>
    <div
      class="width width-100 display-flex align-center space-between padding padding-top-25px"
    >
      <div class="fonts fonts-11 semibold black">Kelola Undangan</div>
      <div class="display-flex">
        <button
          :class="`btn btn-icon ${gridType === 'grid' ? 'btn-main' : 'btn-white'}`"
          @click="onChangeGrid('grid')"
        >
          <i class="icn fa fa-lg fa-th-large"></i>
        </button>
        <button
          :class="`btn btn-icon ${gridType === 'list' ? 'btn-main' : 'btn-white'}`"
          @click="onChangeGrid('list')"
        >
          <i class="icn fa fa-lg fa-th-list"></i>
        </button>
      </div>
    </div>
    <div
      :class="`${gridType === 'grid' ? 'display-flex wrap' : 'display-list'} margin margin-top-15px`"
    >
      <div
        v-for="(item, i) in menus"
        :key="i"
        :class="`${gridType === 'grid' ? 'width width-row-4 width-row-mobile-2' : 'width width-full'}`"
      >
        <div
          :class="`${gridType === 'grid' ? 'margin margin-10px' : 'margin margin-top-15px margin-bottom-15px'}`"
        >
          <div
            :class="`
                            ${gridType === 'grid' ? 'image image-padding' : 'padding padding-15px border-radius'} 
                            bg-white box-shadow cursor-pointer custom-selection 
                            ${gridType === 'grid' ? 'display-flex column center' : 'display-list'}`"
            @click="onRoute(item.link)"
          >
            <div
              v-if="gridType === 'grid'"
              class="post-middle-absolute display-flex column center align-center"
            >
              <div class="image image-60px image-circle">
                <i :class="`post-middle-absolute ${item.icon}`"></i>
              </div>
              <div class="padding padding-top-15px">
                <div class="fonts fonts-11 semibold black align-center">
                  {{ item.label }}
                </div>
              </div>
            </div>
            <div v-else class="display-flex align-center">
              <div
                class="image image-50px image-circle margin margin-right-15px"
              >
                <i :class="`post-middle-absolute ${item.icon}`"></i>
              </div>
              <div class="fonts fonts-11 semibold black align-center">
                {{ item.label }}
              </div>
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
import AppPopupQrCodeSmall from '../../modules/AppPopupQrCodeSmall'

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
