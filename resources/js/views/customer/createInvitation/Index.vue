<template>
  <div id="App" class="w-full bg-[#faf9f5] min-h-screen p-6 rounded-xl">
    <div class="max-w-4xl mx-auto space-y-6">
      <!-- Title Block -->
      <div class="border-b border-canvas pb-6">
        <h1 class="text-3xl font-serif text-[#141413] tracking-tight">Buat Undangan</h1>
        <p class="text-sm text-[#6c6a64] mt-2">
          Isi informasi berikut untuk membuat undangan. Setelah undangan dibuat, masuk ke menu "Kelola Undangan" untuk mengisi data pengantin, acara, dll.
        </p>
      </div>

      <!-- Form Wizard Step Header -->
      <div class="bg-[#efe9de] rounded-xl p-6 border border-canvas">
        <el-steps :active="activeIndex" finish-status="success" align-center class="custom-wizard-steps">
          <el-step title="Informasi"></el-step>
          <el-step title="Paket"></el-step>
          <el-step title="Tema"></el-step>
          <el-step title="Lagu Latar"></el-step>
          <el-step title="Review"></el-step>
        </el-steps>
      </div>

      <!-- Step Content Area -->
      <div class="bg-white rounded-xl p-8 border border-canvas min-h-[300px]">
        <FormInformation v-if="activeIndex === 0" />
        <FormPacket v-if="activeIndex === 1" />
        <FormTheme v-if="activeIndex === 2" />
        <FormSong v-if="activeIndex === 3" />
        <FormReview v-if="activeIndex === 4" />
      </div>

      <!-- Step Navigation (Footer Actions) -->
      <div class="flex justify-end items-center bg-[#efe9de] rounded-xl p-4 border border-canvas">
        <el-button @click="goBack" class="font-medium">
          {{ activeIndex === 0 ? 'Batalkan' : 'Kembali' }}
        </el-button>
        <el-button
          type="primary"
          :disabled="disabledNextButton"
          @click="onNext"
          class="font-medium"
        >
          {{ activeIndex === totalIndex ? 'Buat Undangan' : 'Selanjutnya' }}
        </el-button>
      </div>
    </div>

    <!-- Modals & Alert Popups -->
    <AppPopupConfirmed
      v-if="visibleConfirmed"
      :title="titleConfirmed"
      @onClickNo="onClickNo"
      @onClickYes="onClickYes"
    />

    <AppPopupAlert
      v-if="visibleAlert"
      :title="titleAlert"
      :icon="iconAlert"
      @onClickOk="onClickOk"
    />

    <AppPopupLoader v-if="visibleLoader" title="Mohon Tunggu ..." />
  </div>
</template>
<script>
import { mapState, mapActions } from 'vuex'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import FormInformation from './FormInformation'
import FormPacket from './FormPacket'
import FormTheme from './FormTheme'
import FormSong from './FormSong'
import FormReview from './FormReview'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Buat Undangan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      visibleUpdateCover: false,
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: 'Simpan data undangan ?',
      titleAlert: 'Data undangan berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
      totalIndex: 4,
      formSatus: false,
    }
  },
  mounted() {
    this.getDataCategory()
    this.resetForm()
    this.setFormData()
  },
  computed: {
    ...mapState({
      activeIndex: (state) => state.customerInvitation.activeIndex,
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
    }),
    requeiredFullInformation() {
      let status = true
      if (
        this.form.invitation_id &&
        this.form.short_link &&
        this.form.title &&
        this.form.date &&
        this.form.description
      )
        status = false
      return status
    },
    requeiredPacket() {
      let status = true
      if (this.form.type) status = false
      return status
    },
    requeiredTheme() {
      let status = true
      if (this.form.theme_id) status = false
      return status
    },
    requeiredSong() {
      let status = true
      if (this.form.song_id) status = false
      return status
    },
    disabledNextButton() {
      let status = false
      if (this.activeIndex === 0) {
        status = this.requeiredFullInformation
      }
      if (this.activeIndex === 1) {
        status = this.requeiredPacket
      }
      if (this.activeIndex === 2) {
        status = this.requeiredTheme
      }
      if (this.activeIndex === 3) {
        status = this.requeiredSong
      }
      return status
    },
  },
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    FormInformation,
    FormPacket,
    FormTheme,
    FormSong,
    FormReview,
  },
  methods: {
    ...mapActions({
      onChangeActiveIndex: 'customerInvitation/onChangeActiveIndex',
      setFormData: 'customerInvitation/setFormData',
      resetForm: 'customerInvitation/resetForm',
      createData: 'customerInvitation/createData',
      getCategory: 'customerCategory/getData',
    }),
    onChangeTabs(data) {
      this.selectedIndex = data
    },
    onClickNo() {
      this.visibleConfirmed = false
    },
    onClickYes() {
      this.visibleConfirmed = false
      this.createDataCustomerInvitation()
    },
    onClickOk() {
      this.visibleAlert = false
      if (this.formSatus) {
        this.$router.replace({ name: 'customer-dashboard' })
      }
    },
    submitData() {
      this.visibleConfirmed = true
      this.titleConfirmed = 'Simpan data undangan ?'
    },
    goBack() {
      if (this.activeIndex === 0) {
        this.$router.replace({ name: 'customer-dashboard' })
      } else {
        const data = this.activeIndex - 1
        this.onChangeActiveIndex(data)
      }
    },
    onNext() {
      if (this.activeIndex === this.totalIndex) {
        this.submitData()
      } else {
        const data = this.activeIndex + 1
        this.onChangeActiveIndex(data)
      }
    },
    createDataCustomerInvitation() {
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      this.createData({ token })
        .then((res) => {
          if (res.data.status === 'ok') {
            this.formSatus = true
            this.visibleAlert = true
            this.titleAlert = 'Data undangan berhasil di buat !'
            this.iconAlert = 'far fa-4x fa-check-circle'
          } else {
            this.formSatus = false
            this.visibleAlert = true
            this.titleAlert = 'Data undangan gagal di buat !'
            this.iconAlert = 'far fa-4x fa-times-circle'
          }
        })
        .finally(() => {
          this.visibleLoader = false
        })
    },
    getDataCategory() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCategory({ token: token, status: 'active' }).then((res) => {
        this.form.category_id = 1
      })
    },
  },
}
</script>
