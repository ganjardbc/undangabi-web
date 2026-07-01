<template>
  <div id="register" class="bg-canvas flex items-center justify-center p-4 font-sans">
    <div class="w-full max-w-lg">
      <div class="bg-white rounded-lg shadow-sm border border-hairline p-8">
        <form action="#" @submit.prevent="submit" class="w-full">
          <div class="flex justify-center mb-6">
            <img
              :src="logo"
              alt="undang-abi"
              class="h-10 w-auto object-contain"
            />
          </div>

          <div class="flex justify-between items-center mb-5">
            <h3 class="text-lg font-semibold text-ink font-sans">Register</h3>
            <router-link
              :to="{ name: 'login' }"
              class="text-sm font-medium text-primary hover:text-primary-active transition-colors duration-150 no-underline"
            >
              Login ke akun kamu?
            </router-link>
          </div>

          <div class="mb-4">
            <div class="text-xs font-semibold text-body mb-1.5">Nama Lengkap</div>
            <el-input
              :disabled="visibleButton"
              placeholder=""
              v-model="form.name"
            />
            <div
              v-if="textError.name && visibleError"
              class="text-xs text-red-600 mt-1"
            >
              {{ textError.name && textError.name[0] }}
            </div>
          </div>

          <div class="mb-4">
            <div class="text-xs font-semibold text-body mb-1.5">Email Kamu</div>
            <el-input
              type="email"
              :disabled="visibleButton"
              placeholder=""
              v-model="form.email"
            />
            <div
              v-if="textError.email && visibleError"
              class="text-xs text-red-600 mt-1"
            >
              {{ textError.email && textError.email[0] }}
            </div>
          </div>

          <div class="mb-4">
            <div class="text-xs font-semibold text-body mb-1.5">Buat Username</div>
            <el-input
              :disabled="visibleButton"
              placeholder=""
              @input="formUsername"
              v-model="form.username"
            />
            <div
              v-if="textError.username && visibleError"
              class="text-xs text-red-600 mt-1"
            >
              {{ textError.username && textError.username[0] }}
            </div>
          </div>

          <div class="mb-6">
            <div class="text-xs font-semibold text-body mb-1.5">Buat Password</div>
            <el-input
              type="password"
              :disabled="visibleButton"
              placeholder=""
              v-model="form.password"
              show-password
            />
            <div
              v-if="textError.password && visibleError"
              class="text-xs text-red-600 mt-1"
            >
              {{ textError.password && textError.password[0] }}
            </div>
          </div>

          <div class="mb-3">
            <el-button
              type="primary"
              class="w-full"
              native-type="submit"
              :disabled="visibleButton"
            >
              Daftar Sekarang
            </el-button>
          </div>

          <div class="mb-2">
            <router-link
              :to="{ name: 'login' }"
              class="w-full inline-flex justify-center items-center px-4 py-2.5 text-sm font-semibold rounded-md text-muted hover:text-ink bg-canvas border border-hairline hover:bg-surface-soft transition-all duration-300 text-center no-underline"
            >
              Login
            </router-link>
          </div>
        </form>
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
import AppWrapper from '../../components/modules/AppWrapper'
import AppButton from '../../components/modules/AppButton'
import AppForm from '../../components/modules/AppForm'
import AppText from '../../components/modules/AppText'
import AppAlert from '../../components/modules/AppAlert'

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
