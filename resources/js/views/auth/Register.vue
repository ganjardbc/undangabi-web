<template>
  <div id="register" class="main-screen" style="padding-top: 50px">
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
                alt="undangabi"
                class="post-center"
                style="width: 100%"
              />
            </div>

            <div class="display-flex space-between" style="margin-bottom: 20px">
              <h3 style="margin-top: 8px">Register</h3>
              <router-link
                :to="{ name: 'login' }"
                class="btn btn-main-reverse"
                style="padding-left: 0; padding-right: 0"
              >
                Login ke akun kamu ?
              </router-link>
            </div>

            <div class="padding padding-top-10px padding-bottom-5px">
              <div class="fonts fonts-11 semibold black">Nama Lengkap</div>
              <el-input
                :disabled="visibleButton"
                placeholder=""
                v-model="form.name"
              />
              <div
                v-if="textError.name && visibleError"
                class="fonts fonts-10 normal red"
                style="margin-bottom: 5px"
              >
                {{ textError.name && textError.name[0] }}
              </div>
            </div>

            <div class="padding padding-top-10px padding-bottom-5px">
              <div class="fonts fonts-11 semibold black">Email Kamu</div>
              <el-input
                type="email"
                :disabled="visibleButton"
                placeholder=""
                v-model="form.email"
              />
              <div
                v-if="textError.email && visibleError"
                class="fonts fonts-10 normal red"
                style="margin-bottom: 5px"
              >
                {{ textError.email && textError.email[0] }}
              </div>
            </div>

            <div class="padding padding-top-10px padding-bottom-5px">
              <div class="fonts fonts-11 semibold black">Buat Username</div>
              <el-input
                :disabled="visibleButton"
                placeholder=""
                @input="formUsername"
                v-model="form.username"
              />
              <div
                v-if="textError.username && visibleError"
                class="fonts fonts-10 normal red"
                style="margin-bottom: 5px"
              >
                {{ textError.username && textError.username[0] }}
              </div>
            </div>

            <div class="padding padding-top-10px padding-bottom-30px">
              <div class="fonts fonts-11 semibold black">Buat Password</div>
              <el-input
                type="password"
                :disabled="visibleButton"
                placeholder=""
                v-model="form.password"
                show-password
              />
              <div
                v-if="textError.password && visibleError"
                class="fonts fonts-10 normal red"
                style="margin-bottom: 5px"
              >
                {{ textError.password && textError.password[0] }}
              </div>
            </div>

            <div style="margin-bottom: 10px" type="center">
              <button
                class="btn btn-main"
                style="width: 100%"
                type="submit"
                :disabled="visibleButton"
              >
                Daftar Sekarang
              </button>
            </div>

            <div style="margin-bottom: 10px" type="center">
              <router-link
                :to="{ name: 'login' }"
                class="btn btn-white"
                style="padding-left: 0; padding-right: 0"
              >
                Login
              </router-link>
            </div>
          </form>
        </div>
      </div>
    </div>

    <AppAlert
      v-if="visiblePopup"
      :isLoader="visibleLoader"
      :enableEnglish="false"
      :title="'Pendaftaran berhasil, lanjutkan login ?'"
      :onClose="onClose"
      :onSave="onLogin"
    />
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
  name: 'register',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Register',
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
    this.$gtag.event('register', { method: 'Google' })
  },
  data() {
    return {
      logo: logo,
      visiblePopup: false,
      visibleLoader: false,
      visibleButton: false,
      visibleError: false,
      textError: 'error',
      form: {
        name: '',
        email: '',
        username: '',
        password: '',
      },
    }
  },
  methods: {
    ...mapActions({
      register: 'auth/register',
    }),
    formUsername(value) {
      this.form.username = value.replace(/[ ]/g, '_')
    },
    onClose() {
      this.visiblePopup = false
      this.visibleLoader = false
    },
    onLogin() {
      this.visiblePopup = false
      this.visibleLoader = false
      this.$router.push({ name: 'login' })
    },
    async submit() {
      this.visiblePopup = true
      this.visibleLoader = true
      this.visibleError = false
      this.visibleButton = true
      const rest = await this.register(this.form)
      if (rest.data.status === 'ok') {
        this.visiblePopup = true
        this.visibleLoader = false
      } else {
        this.visiblePopup = false
        this.visibleLoader = false
        this.visibleButton = false
        this.visibleError = true
        this.textError = rest.data.message
      }
    },
  },
}
</script>
