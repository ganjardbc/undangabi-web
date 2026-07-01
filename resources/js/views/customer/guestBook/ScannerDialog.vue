<template>
  <div id="App">
    <div class="display-popup">
      <div class="post-middle-absolute width width-400px width-mobile">
        <div class="p-4 p-[15px]">
          <div class="card shadow-sm bg-white">
            <div
              class="flex justify-between items-center margin mb-[15px]"
            >
              <div class="text-[11px] font-semibold text-black">Scan QR-Code</div>
              <button class="btn btn-white btn-icon" @click="onClose">
                <i class="fa fa-lg fa-times"></i>
              </button>
            </div>
            <div v-if="!selectedData" class="width w-full">
              <div style="height: 350px">
                <qrcode-stream @decode="onDecode" @init="onInit">
                  <div v-if="loading" class="post-middle-absolute">
                    <AppLoader :title="'Mohon Tunggu'" />
                  </div>
                </qrcode-stream>
              </div>
              <div class="margin margin-top-15px">
                <div class="text-[11px] items-center normal text-black">
                  Scan QR-Code Reservasi Tamu.
                </div>
              </div>
            </div>
            <div v-if="selectedData">
              <div class="margin mb-[5px]">
                <div class="text-[10px] normal text-black">ID Reservasi</div>
                <div class="text-[11px] font-semibold text-black">
                  {{ form.reservation_list_id }}
                </div>
              </div>
              <div class="margin mb-[5px]">
                <div class="text-[10px] normal text-black">Nama Lengkap</div>
                <div class="text-[11px] font-semibold text-black">{{ form.name }}</div>
              </div>
              <div v-if="form.address" class="margin mb-[5px]">
                <div class="text-[10px] normal text-black">Alamat</div>
                <div class="text-[11px] font-semibold text-black">
                  {{ form.address }}
                </div>
              </div>
              <div class="margin mb-[5px]">
                <div class="text-[10px] normal text-black">Jumlah Kehadiran</div>
                <div v-if="form.attendance" class="flex justify-between">
                  <div class="text-[11px] font-semibold text-black">
                    {{ form.attendance }} orang
                  </div>
                  <div
                    class="text-[11px] font-semibold red"
                    style="cursor: pointer"
                    @click="onCleareAttendance"
                  >
                    Ubah
                  </div>
                </div>
                <el-input-number
                  v-if="visibleUpdateAttendance"
                  v-model="form.attendance"
                  placeholder="Jumlah kehadiran"
                  :min="1"
                  :max="100"
                  style="width: 100%; margin-top: 5px; margin-bottom: 10px"
                ></el-input-number>
              </div>
              <div class="margin mb-[5px]">
                <div class="text-[10px] normal text-black">Status</div>
                <div
                  v-if="form.present_type === 'present'"
                  class="flex"
                >
                  <div
                    :class="'card-capsule active'"
                    style="text-transform: capitalize"
                  >
                    Hadir
                  </div>
                </div>
                <div v-else class="flex">
                  <div
                    v-if="form.present_type === 'present'"
                    :class="'card-capsule wip'"
                    style="text-transform: capitalize"
                  >
                    Hadir
                  </div>
                  <div
                    v-if="form.present_type === 'will-present'"
                    :class="'card-capsule wip'"
                    style="text-transform: capitalize"
                  >
                    Akan Hadir
                  </div>
                  <div
                    v-if="form.present_type === 'not-response'"
                    :class="'card-capsule inactive'"
                    style="text-transform: capitalize"
                  >
                    Tidak Hadir
                  </div>
                  <div
                    v-if="form.present_type === 'waiting-response'"
                    :class="'card-capsule todo'"
                    style="text-transform: capitalize"
                  >
                    Menunggu Tanggapan
                  </div>
                  <div
                    class="text-[11px] font-semibold text-black margin margin-left-10px margin-right-10px"
                  >
                    >>
                  </div>
                  <div
                    :class="'card-capsule active'"
                    style="text-transform: capitalize"
                  >
                    Hadir
                  </div>
                </div>
              </div>
              <div class="width w-full margin margin-top-15px">
                <button
                  class="btn btn-full btn-main margin mb-[10px]"
                  @click="openConfirmedPopup"
                >
                  Simpan Data
                </button>
                <button class="btn btn-full btn-sekunder" @click="onReset">
                  Scan Ulang
                </button>
              </div>
            </div>
          </div>
        </div>
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

    <AppPopupLoader v-if="visibleLoading" title="Mohon Tunggu ..." />
  </div>
</template>
<script>
import { mapState, mapActions } from 'vuex'
import AppLoader from '../../../components/modules/AppLoader'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'

export default {
  name: 'App',
  data() {
    return {
      loading: false,
      result: '',
      error: '',
      isAlertSuccess: false,
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      visibleUpdateAttendance: false,
      titleConfirmed: '',
      titleAlert: '',
      iconAlert: 'far fa-4x fa-times-circle',
    }
  },
  mounted() {},
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppLoader,
  },
  computed: {
    ...mapState({
      visibleLoading: (state) => state.customerGuestBook.reservation.loading,
      selectedData: (state) => state.customerGuestBook.reservation.data,
      dataAttendance: (state) => state.customerGuestBook.dataAttendance,
      form: (state) => state.customerGuestBook.form,
    }),
  },
  methods: {
    ...mapActions({
      getByID: 'customerGuestBook/getReservationByID',
      resetSelectedData: 'customerGuestBook/resetSelectedData',
      resetFormData: 'customerGuestBook/resetFormData',
      setFormData: 'customerGuestBook/setFormData',
      createData: 'customerGuestBook/createData',
    }),
    onClose() {
      this.onReset()
      this.$emit('onClose')
      this.$emit('onSuccess')
    },
    onCleareAttendance() {
      this.form.attendance = 0
      this.visibleUpdateAttendance = true
    },
    onReset() {
      this.resetSelectedData()
      this.resetFormData()
    },
    onDecode(result) {
      const spliting = result.split('/')
      const reservationID = spliting[spliting.length - 1]
      this.getData(reservationID)
    },
    openConfirmedPopup() {
      this.visibleConfirmed = true
      this.titleConfirmed = 'Update data tamu ?'
    },
    onClickNo() {
      this.visibleConfirmed = false
    },
    onClickYes() {
      this.submitData()
    },
    onClickOk() {
      this.visibleAlert = false
      this.onReset()
      this.$emit('onClose')
      this.$emit('onSuccess')
    },
    getData(data) {
      const token = `Bearer ${this.$cookies.get('token')}`
      const params = {
        reservation_list_id: data,
        token: token,
      }
      return this.getByID(params)
    },
    submitData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      const params = {
        ...this.form,
        attendance: this.form.attendance ? this.form.attendance : 1,
        present_type: 'present',
        token: token,
      }

      this.visibleConfirmed = false

      this.createData(params).then((res) => {
        if (res.data.status === 'ok') {
          this.$message('Data tamu berhasil di update')
          this.onReset()
        } else {
          this.titleAlert = 'Data tamu gagal di update'
          this.iconAlert = 'far fa-4x fa-times-circle'
          this.visibleAlert = true
        }
      })
    },
    async onInit(promise) {
      this.loading = true
      try {
        await promise
      } catch (error) {
        if (error.name === 'NotAllowedError') {
          this.error = 'ERROR: you need to grant camera access permisson'
        } else if (error.name === 'NotFoundError') {
          this.error = 'ERROR: no camera on this device'
        } else if (error.name === 'NotSupportedError') {
          this.error = 'ERROR: secure context required (HTTPS, localhost)'
        } else if (error.name === 'NotReadableError') {
          this.error = 'ERROR: is the camera already in use?'
        } else if (error.name === 'OverconstrainedError') {
          this.error = 'ERROR: installed cameras are not suitable'
        } else if (error.name === 'StreamApiNotSupportedError') {
          this.error = 'ERROR: Stream API is not supported in this browser'
        }
      } finally {
        this.loading = false
      }
    },
  },
}
</script>
