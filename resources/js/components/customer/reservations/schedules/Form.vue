<template>
  <div id="App">
    <AppSideFormPopup
      :title="titleForm"
      :enableSaveButton="visibleSaveButton"
      :visibleForm="visibleForm"
      @onSave="onSave"
      @onClose="onClose"
    >
      <div class="width width-100">
        <div class="padding padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            ID Jadwal <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.reservation_schedule_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div
            v-if="formMessage.reservation_schedule_id"
            class="fonts fonts-12px red"
          >
            {{ formMessage.reservation_schedule_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Judul <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.title"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.title" class="fonts fonts-12px red">
            {{ formMessage.title[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Tanggal <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.schedule_date"
            type="date"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.schedule_date" class="fonts fonts-12px red">
            {{ formMessage.schedule_date[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Jam <span class="fonts red">*</span>
          </div>
          <div class="fonts fonts-10 normal grey">
            Isi dengan jam mulai - jam akhir (09.00 - 17.00)
          </div>
          <el-input
            v-model="formData.schedule_time"
            type="text"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.schedule_time" class="fonts fonts-12px red">
            {{ formMessage.schedule_time[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Zona Waktu <span class="fonts red">*</span>
          </div>
          <div class="fonts fonts-10 normal grey">Pilih WIB/WIT/WITA</div>
          <el-select
            v-model="formData.schedule_timezone"
            slot="prepend"
            class="el-select-custom-form"
            placeholder=""
            :disabled="!visibleSaveButton"
          >
            <el-option
              v-for="(dt, i) in timeZone"
              :key="i"
              :label="dt"
              :value="dt"
            ></el-option>
          </el-select>
          <div
            v-if="formMessage.schedule_timezone"
            class="fonts fonts-12px red"
          >
            {{ formMessage.schedule_timezone }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Status</div>
          <div
            v-if="visibleSaveButton"
            class="padding padding-top-15px display-flex"
          >
            <label class="radio">
              <input
                type="radio"
                name="status"
                id="active"
                value="active"
                v-model="formData.status"
              />
              <span class="checkmark" />
              <span class="fonts micro"> Active </span>
            </label>
            <label class="radio">
              <input
                type="radio"
                name="status"
                id="inactive"
                value="inactive"
                v-model="formData.status"
              />
              <span class="checkmark" />
              <span class="fonts micro"> Inactive </span>
            </label>
          </div>
          <el-input
            v-if="!visibleSaveButton"
            placeholder=""
            :value="formData.status === 'active' ? 'Active' : 'Inactive'"
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.status" class="fonts fonts-12px red">
            {{ formMessage.status[0] }}
          </div>
        </div>
      </div>
    </AppSideFormPopup>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import AppSideFormPopup from '../../../modules/AppSideFormPopup'

export default {
  name: 'App',
  data() {
    return {}
  },
  props: {
    visibleForm: false,
    typeForm: {
      type: String,
      default: 'create',
    },
  },
  mounted() {},
  components: {
    AppSideFormPopup,
  },
  computed: {
    ...mapState({
      formData: (state) => state.customerReservationSchedules.form,
      formMessage: (state) => state.customerReservationSchedules.message,
      timeZone: (state) => state.customerReservationSchedules.timeZone,
    }),
    titleForm() {
      let title = 'Tambah Jadwal'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Jadwal'
          break
        case 'edit':
          title = 'Edit Jadwal'
          break
        case 'detail':
          title = 'Detail Jadwal'
          break
      }
      return title
    },
    visibleSaveButton() {
      return this.typeForm !== 'detail' ? true : false
    },
  },
  methods: {
    onSave() {
      this.$emit('onSave')
    },
    onClose() {
      this.$emit('onClose')
    },
    onUpdateCover(data) {
      this.$emit('onUpdateCover', data)
    },
  },
}
</script>
