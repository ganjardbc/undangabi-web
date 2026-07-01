<template>
  <div id="Login" class="bg-canvas flex items-center justify-center p-4 font-sans">
    <div class="w-full max-w-sm">
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
            <h3 class="text-lg font-semibold text-ink font-sans">Sign-In</h3>
            <router-link
              :to="{ name: 'register' }"
              class="text-sm font-medium text-primary hover:text-primary-active transition-colors duration-150 no-underline"
            >
              Buat akun?
            </router-link>
          </div>

          <div class="mb-4">
            <div class="text-xs font-semibold text-body mb-1.5">Username</div>
            <el-input :disabled="visibleButton" v-model="form.username" />
            <div
              v-if="textError['username']"
              class="text-xs text-red-600 mt-1"
            >
              {{ textError['username'][0] }}
            </div>
          </div>

          <div class="mb-6">
            <div class="text-xs font-semibold text-body mb-1.5">Password</div>
            <el-input
              type="password"
              :disabled="visibleButton"
              v-model="form.password"
              show-password
            />
            <div
              v-if="textError['password']"
              class="text-xs text-red-600 mt-1"
            >
              {{ textError['password'][0] }}
            </div>
          </div>

          <div
            v-if="typeof textError === 'string' && textError !== ''"
            class="text-xs text-red-600 text-center mb-4"
          >
            {{ textError }}
          </div>

          <div class="mb-3">
            <el-button
              type="primary"
              class="w-full"
              native-type="submit"
              :loading="visibleButton"
            >
              Cek Akun
            </el-button>
          </div>

          <div class="mb-2">
            <router-link
              :to="{ name: 'register' }"
              class="w-full inline-flex justify-center items-center text-center no-underline"
            >
              <el-button class="w-full">
                Register
              </el-button>
            </router-link>
          </div>
        </form>
      </div>
    </div>

    <AppAlert v-if="visiblePopup" :isLoader="true" />
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
