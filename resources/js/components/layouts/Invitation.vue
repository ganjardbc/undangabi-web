<template>
  <div id="invitation">
    <div :class="`invitation-sidebar ${visibleSideBar && 'show'}`">
      <div class="invitation-header">
        <div
          class="invitation-header-content display-flex space-between align-center"
        >
          <h1 class="text-logo fonts medium bold black">Menu</h1>
          <div class="close">
            <button
              class="btn btn-icon btn-rounded btn-white"
              @click="visibleSideBar = false"
            >
              <i class="fa fa-lg fa-times"></i>
            </button>
          </div>
        </div>
      </div>
      <div class="invitation-content">
        <div
          class="padding padding-top-15px padding-bottom-15px padding-left-13px padding-right-13px border-bottom"
        >
          <button
            class="btn btn-sekunder btn-full"
            @click="backToInvitationList"
          >
            <i class="icn icn-left far fa-lg fa-envelope-open"></i>
            Daftar Undangan
          </button>
        </div>
        <div class="padding padding-top-15px padding-bottom-15px">
          <AppGridMenu
            :data.sync="sidebar"
            @onClickMenu="visibleSideBar = false"
          />
        </div>
      </div>
    </div>
    <div class="invitation-main">
      <div class="invitation-main-header">
        <div
          class="invitation-main-header-container display-flex space-between align-center"
        >
          <div class="invitation-main-header-left">
            <button
              class="mobile-visible btn btn-icon btn-rounded btn-white margin margin-right-5px"
              @click="visibleSideBar = true"
            >
              <i class="fa fa-lg fa-bars"></i>
            </button>
          </div>
          <div class="invitation-main-header-middle">
            <router-link :to="{ name: 'invitation-home' }" style="height: 30px">
              <img :src="logo" alt="undangabi" style="height: 30px" />
            </router-link>
          </div>
          <div class="invitation-main-header-right">
            <el-popover placement="bottom-end" width="250" trigger="click">
              <div
                v-loading="invitationLoading"
                class="display-flex align-center column padding padding-top-10px"
              >
                <div class="width width-100px">
                  <div
                    class="image image-padding"
                    :style="`background-image: url(${invitationData ? invitationImageThumbnailUrl + invitationData.cover : ''});`"
                  >
                    <i
                      v-if="invitationData && !invitationData.cover"
                      class="post-middle-absolute fa fa-lg fa-image"
                    ></i>
                  </div>
                </div>
                <div class="width width-100 padding padding-top-15px">
                  <h2 class="fonts fonts-12 semibold black align-center">
                    {{ invitationData && invitationData.title }}
                  </h2>
                  <div class="fonts fonts-10 black capitalize align-center">
                    {{ invitationCategory }} | {{ invitationType }}
                  </div>
                </div>
                <div
                  class="width width-100 margin margin-bottom-15px padding padding-top-15px border-bottom"
                ></div>
                <router-link
                  :to="{
                    name: 'generate-only',
                    params: {
                      id: invitationData && invitationData.short_link,
                    },
                  }"
                  target="_blank"
                  class="width width-100 margin margin-bottom-5px"
                >
                  <button class="btn btn-white btn-full btn-align-left">
                    <i class="icn icn-left far fa-lg fa-envelope-open"></i>
                    Lihat Undangan
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
                  class="width width-100 margin margin-bottom-5px"
                >
                  <button class="btn btn-white btn-full btn-align-left">
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
                  <button class="btn btn-white btn-full btn-align-left">
                    <i class="icn icn-left fa fa-lg fa-lock"></i> Private
                    Generator
                  </button>
                </router-link>
              </div>
              <button
                slot="reference"
                class="btn btn-icon btn-rounded btn-white margin margin-left-5px"
              >
                <i class="far fa-lg fa-envelope-open"></i>
              </button>
            </el-popover>
            <el-popover placement="bottom-end" width="250" trigger="click">
              <div class="width width-100 padding padding-top-10px">
                <div class="display-flex column align-center">
                  <div
                    class="image image-circle image-80px margin margin-bottom-10px"
                    style="text-align: center"
                  >
                    <i
                      v-if="!image"
                      class="post-top fa fa-2x fa-user-circle"
                      style="color: #999"
                    />
                  </div>
                  <div class="fonts fonts-11 semibold black">
                    {{ user && user.name }}
                  </div>
                  <div class="fonts fonts-9 normal black">
                    {{ user && user.role_name }}
                  </div>
                </div>
                <div
                  class="margin margin-bottom-15px padding padding-top-15px border-bottom"
                ></div>
                <button
                  class="btn btn-sekunder btn-full btn-center"
                  @click="onLogout"
                >
                  <i class="fonts red icn icn-left fa fa-lg fa-power-off"></i>
                  Logout
                </button>
              </div>
              <button
                slot="reference"
                class="btn btn-icon btn-rounded btn-white margin margin-left-5px"
              >
                <i class="far fa-lg fa-user"></i>
              </button>
            </el-popover>
          </div>
        </div>
      </div>
      <div class="invitation-main-content">
        <div
          v-if="!invitationData.payment_status"
          class="width width-100 padding padding-bottom-15px"
        >
          <el-alert
            type="error"
            :closable="false"
            class="payment-status-container"
          >
            <div
              class="width width-100 display-flex space-between align-center display-mobile"
            >
              <div class="width width-50 width-mobile">
                <div class="fonts fonts-16px semibold red">
                  Undangan Belum Dibayar
                </div>
                <div class="fonts fonts-12px normal red">
                  Segera lakukan pembayaran untuk undangan ini sebelum di
                  Non-Aktifkan oleh Admin.
                </div>
              </div>
              <div
                class="width width-200px width-mobile padding padding-mobile-top-15px"
              >
                <button
                  class="btn btn-red btn-full"
                  @click="visiblePopupPayment = true"
                >
                  Lakukan Pembayaran
                </button>
              </div>
            </div>
          </el-alert>
        </div>

        <AppDoPayment
          v-if="visiblePopupPayment"
          :data.sync="invitationData"
          @onClose="visiblePopupPayment = false"
        />

        <router-view />
      </div>
    </div>

    <AppToast />
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import logo from '../../../img/logo.png'
import AppGridMenu from '../modules/AppGridMenu'
import AppToast from '../modules/AppToast'
import AppDoPayment from '../modules/AppDoPayment'

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
<style>
.payment-status-container .el-alert__content {
  width: 100%;
}
</style>
