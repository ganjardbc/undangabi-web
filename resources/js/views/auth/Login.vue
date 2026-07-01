<template>
  <div id="Login" class="main-screen" style="padding-top: 50px">
    <div class="width width-400px width-mobile width-center">
      <div class="padding padding-left-15px padding-right-15px">
        <div class="card border-full border-radius">
          <form action="#" @submit.prevent="submit" style="width: 100%">
            <div
              class="image image-all"
              style="
                width: 200px;
                padding-bottom: 30%;
                margin: auto;
                margin-bottom: 0;
                background-color: rgba(0, 0, 0, 0);
              "
            >
              <img
                :src="logo"
                alt="HNF"
                class="post-center"
                style="width: 100%"
              />
            </div>

            <div class="display-flex space-between" style="margin-bottom: 20px">
              <h3 style="margin-top: 8px">Sign-In</h3>
              <router-link
                :to="{ name: 'register' }"
                class="btn btn-main-reverse"
                style="padding-left: 0; padding-right: 0"
              >
                Buat akun ?
              </router-link>
            </div>

            <div class="padding padding-top-10px padding-bottom-5px">
              <div class="fonts fonts-11 semibold black">Username</div>
              <el-input :disabled="visibleButton" v-model="form.username" />
              <div
                v-if="textError['username']"
                class="fonts fonts-10 normal red"
                style="margin-top: 5px"
              >
                {{ textError['username'][0] }}
              </div>
            </div>

            <div class="padding padding-top-10px padding-bottom-30px">
              <div class="fonts fonts-11 semibold black">Password</div>
              <el-input
                type="password"
                :disabled="visibleButton"
                v-model="form.password"
                show-password
              />
              <div
                v-if="textError['password']"
                class="fonts fonts-10 normal red"
                style="margin-top: 5px"
              >
                {{ textError['password'][0] }}
              </div>
            </div>

            <div
              v-if="typeof textError === 'string' && textError !== ''"
              class="fonts fonts-10 normal red"
              style="text-align: center; margin-bottom: 15px"
            >
              {{ textError }}
            </div>

            <div style="margin-bottom: 10px">
              <button
                class="btn btn-main"
                style="width: 100%"
                type="submit"
                :disabled="visibleButton"
              >
                Cek Akun
              </button>
            </div>

            <div style="margin-bottom: 10px" type="center">
              <router-link
                :to="{ name: 'register' }"
                class="btn btn-white"
                style="padding-left: 0; padding-right: 0"
              >
                Register
              </router-link>
            </div>
          </form>
        </div>
      </div>
    </div>

    <AppAlert v-if="visiblePopup" :isLoader="true" />
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import logo from '../../../img/logo.png'
import AppWrapper from '../modules/AppWrapper'
import AppButton from '../modules/AppButton'
import AppForm from '../modules/AppForm'
import AppText from '../modules/AppText'
import AppAlert from '../modules/AppAlert'

export default {
  name: 'Login',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Login',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },

  components: {
    AppWrapper,
    AppButton,
    AppText,
    AppForm,
    AppAlert,
  },

  mounted() {
    this.$gtag.event('login', { method: 'Google' })
  },

  data() {
    return {
      visiblePopup: false,
      visibleError: false,
      visibleButton: false,
      textError: '',
      logo: logo,
      form: {
        username: '',
        password: '',
        remember: false,
      },
    }
  },

  methods: {
    ...mapActions({
      setCookieAuth: 'auth/setCookieAuth',
      signIn: 'auth/signIn',
    }),

    submit() {
      this.visiblePopup = true
      this.visibleError = false
      this.visibleButton = true
      this.signIn(this.form)
        .then((rest) => {
          if (rest.data.status === 'ok') {
            const data = rest.data.data
            this.setCookieAuth(data)
            if (data.user.role_name === 'admin') {
              this.$router.replace({ name: 'customer-dashboard' })
            } else {
              this.$router.replace({ name: 'customer-dashboard' })
            }
          } else {
            this.visibleError = true
            this.textError = rest.data.message
          }
        })
        .catch((error) => {
          this.visibleError = true
          this.textError = error.message
        })
        .finally(() => {
          this.visiblePopup = false
          this.visibleButton = false
        })
    },
  },
}
</script>
