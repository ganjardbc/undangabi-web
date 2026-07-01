<template>
  <div id="App">
    <div id="header" class="box-shadow">
      <div id="header-container">
        <div class="hc-logo">
          <router-link
            :to="{ name: 'customer-dashboard' }"
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
              <router-link :to="{ name: 'home' }" class="hc-link">
                <button class="btn btn-sekunder width width-mobile">
                  <i class="icn icn-left fa fa-lg fa-home"></i> Home
                </button>
              </router-link>
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
                    v-if="user && user.role_name === 'admin'"
                    class="margin margin-bottom-15px padding padding-top-15px border-bottom"
                  ></div>
                  <router-link
                    v-if="user && user.role_name === 'admin'"
                    :to="{ name: 'dashboard' }"
                    target="_blank"
                  >
                    <button class="btn btn-white btn-full btn-align-left">
                      <i class="icn icn-left fa fa-lg fa-user"></i> Admin Panel
                    </button>
                  </router-link>
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
                <div slot="reference" class="hc-link">
                  <button class="btn btn-sekunder width width-mobile">
                    <i class="icn icn-left far fa-lg fa-user"></i>
                    {{ (user && user.name) || '-' }}
                  </button>
                </div>
              </el-popover>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="body">
      <div class="padding padding-top-15px">
        <router-view />
      </div>
    </div>
    <AppToast />
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'
import logo from '../../../img/logo.png'
import AppToast from '../modules/AppToast'

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
