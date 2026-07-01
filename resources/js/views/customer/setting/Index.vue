<template>
  <div id="App">
    <div class="width w-full">
      <div class="text-[22px] font-semibold text-black">Pengaturan</div>
      <div
        class="card bg-white shadow-sm margin margin-top-20px margin-bottom-20px"
      >
        <div class="fonts-14 font-semibold text-black">Reservasi</div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div
            class="flex display-mobile items-center p-4 padding-bottom-5px"
          >
            <div class="width width-70 width-mobile">
              <div class="text-[11px] font-semibold text-black">
                Tutup atau buka reservasi tamu ?
              </div>
              <div class="text-[10px] normal text-gray-500">
                Jika reservasi tamu ditutup tamu undangan tidak bisa mengisi
                atau mengedit data mereka di buku tamu.
              </div>
            </div>
            <div class="width width-30 width-mobile flex justify-end">
              <el-switch
                v-model="form.is_reservation_enable"
                :active-value="1"
                :inactive-value="0"
                active-text="Aktif"
                inactive-text="Inaktif"
              >
              </el-switch>
            </div>
          </div>
          <div
            v-if="errorMessage.is_reservation_enable"
            class="fonts-12px red"
          >
            {{ errorMessage.is_reservation_enable }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div
            class="flex display-mobile items-center p-4 padding-bottom-5px"
          >
            <div class="width width-70 width-mobile">
              <div class="text-[11px] font-semibold text-black">
                Tunjukan qrcode di undangan tamu ?
              </div>
              <div class="text-[10px] normal text-gray-500">
                Jika qrcode di undangan tamu disembunyikan maka kamu tidak akan
                bisa melakukan perubahan status kehadiran tamu yang datang ke
                acara kamu.
              </div>
            </div>
            <div class="width width-30 width-mobile flex justify-end">
              <el-switch
                v-model="form.is_qrcode_enable"
                :active-value="1"
                :inactive-value="0"
                active-text="Aktif"
                inactive-text="Inaktif"
              >
              </el-switch>
            </div>
          </div>
          <div
            v-if="errorMessage.is_qrcode_enable"
            class="fonts-12px red"
          >
            {{ errorMessage.is_qrcode_enable }}
          </div>
        </div>
      </div>

      <div class="card bg-white shadow-sm margin margin-bottom-20px">
        <div class="fonts-14 font-semibold text-black">Undangan</div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div
            class="flex display-mobile items-center p-4 padding-bottom-5px"
          >
            <div class="width width-70 width-mobile">
              <div class="text-[11px] font-semibold text-black">Privasi</div>
              <div class="text-[10px] normal text-gray-500">
                Ubah pengaturan privasi undangan untuk Publik atau Private
              </div>
            </div>
            <div class="width width-30 width-mobile flex justify-end">
              <el-switch
                v-model="form.privacy"
                active-value="private"
                inactive-value="public"
                active-text="Private"
                inactive-text="Publik"
              >
              </el-switch>
            </div>
          </div>
          <div v-if="errorMessage.privacy" class="fonts-12px red">
            {{ errorMessage.privacy[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div
            class="flex display-mobile items-center p-4 padding-bottom-5px"
          >
            <div class="width width-70 width-mobile">
              <div class="text-[11px] font-semibold text-black">
                Info ProKes
              </div>
              <div class="text-[10px] normal text-gray-500">
                Munculkan Info ProKes di undangan tamu ?
              </div>
            </div>
            <div class="width width-30 width-mobile flex justify-end">
              <el-switch
                v-model="form.is_prokes_enable"
                :active-value="1"
                :inactive-value="0"
                active-text="Aktif"
                inactive-text="Inaktif"
              >
              </el-switch>
            </div>
          </div>
          <div
            v-if="errorMessage.is_prokes_enable"
            class="fonts-12px red"
          >
            {{ errorMessage.is_prokes_enable }}
          </div>
        </div>
      </div>
    </div>

    <div class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white shadow-sm flex items-center justify-end"
      >
        <button class="btn btn-main btn-full" @click="submitData">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Simpan Pengaturan
        </button>
      </div>
    </div>

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
import { mapState, mapActions, mapGetters } from 'vuex'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import AppEmpty from '../../../components/modules/AppEmpty'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan - Pengaturan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: 'Simpan data undangan ?',
      titleAlert: 'Data undangan berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
    }
  },
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppEmpty,
  },
  computed: {
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
    }),
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
    invitationId() {
      return this.$route.params.id
    },
    invitationStoreId() {
      return this.invitationData.id
    },
    invitation() {
      return this.invitationData
    },
    isBronzeInvitation() {
      return this.invitation.type === 'bronze'
    },
    isSilverInvitation() {
      return this.invitation.type === 'silver'
    },
    isGoldInvitation() {
      return (
        this.invitation.type === 'diamond' ||
        this.invitation.type === 'platinum'
      )
    },
    visibleMap() {
      return this.invitation.latitude && this.invitation.longitude
    },
  },
  methods: {
    ...mapActions({
      getCustomerInvitationById: 'customerInvitation/getByID',
      invitationUpdateData: 'customerInvitation/updateData',
    }),
    onClickNo() {
      this.visibleConfirmed = false
    },
    onClickYes() {
      this.visibleConfirmed = false
      this.updateDataCustomerInvitation()
    },
    onClickOk() {
      this.visibleAlert = false
      this.getDataCustomerInvitation()
    },
    submitData() {
      this.visibleConfirmed = true
      this.titleConfirmed = 'Simpan pengaturan ?'
    },
    updateDataCustomerInvitation() {
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      this.invitationUpdateData({ token })
        .then((res) => {
          if (res.data.status === 'ok') {
            this.$message('Pengaturan berhasil di simpan !')
          } else {
            this.visibleAlert = true
            this.titleAlert = 'Pengaturan gagal di simpan !'
            this.iconAlert = 'far fa-4x fa-times-circle'
          }
        })
        .finally(() => {
          this.visibleLoader = false
        })
    },
    getDataCustomerInvitation() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerInvitationById({
        id: this.invitationId,
        token: token,
      })
    },
  },
}
</script>
