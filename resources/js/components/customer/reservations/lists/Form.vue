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
            ID Reservasi <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.reservation_list_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div
            v-if="formMessage.reservation_list_id"
            class="fonts fonts-12px red"
          >
            {{ formMessage.reservation_list_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Nama Lengkap <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.name"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.name" class="fonts fonts-12px red">
            {{ formMessage.name[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Alamat</div>
          <el-input
            type="textarea"
            v-model="formData.address"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.address" class="fonts fonts-12px red">
            {{ formMessage.address[0] }}
          </div>
        </div>
        <div
          v-if="!isCreateForm"
          class="padding padding-top-10px padding-bottom-5px"
        >
          <div class="fonts fonts-11 semibold black">Ucapan & Do'a</div>
          <el-input
            type="textarea"
            v-model="formData.comments"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.comments" class="fonts fonts-12px red">
            {{ formMessage.comments[0] }}
          </div>
        </div>
        <div
          v-if="!isCreateForm"
          class="padding padding-top-10px padding-bottom-5px"
        >
          <div class="fonts fonts-11 semibold black">
            Kehadiran <span class="fonts red">*</span>
          </div>
          <div class="fonts micro black margin margin-bottom-10-px">
            Apakah tamu ini akan hadir ?
          </div>
          <el-select
            v-model="formData.present_type"
            placeholder="Pilih kehadiran"
            :disabled="!visibleSaveButton"
            style="width: 100%"
            @change="onChangePresentType"
          >
            <el-option
              v-for="(item, index) in dataPresent"
              :key="index"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
          <div v-if="formMessage" class="fonts fonts-12px red">
            {{
              formMessage &&
              formMessage.present_type &&
              formMessage.present_type[0]
            }}
          </div>
        </div>
        <div
          v-if="!isCreateForm && formData.present_type === 'will-present'"
          class="padding padding-top-10px padding-bottom-5px"
        >
          <div class="fonts fonts-11 semibold black">Jumlah Kehadiran</div>
          <div class="fonts micro black margin margin-bottom-10-px">
            Berapa banyak orang yang akan menghadiri acara ini ?
          </div>
          <el-input-number
            v-model="formData.attendance"
            placeholder="Jumlah kehadiran"
            :min="1"
            :max="100"
            :disabled="!visibleSaveButton"
            style="width: 100%"
          ></el-input-number>
          <div v-if="formMessage" class="fonts fonts-12px red">
            {{
              formMessage && formMessage.attendance && formMessage.attendance[0]
            }}
          </div>
        </div>
        <div
          v-if="!isCreateForm && formData.present_type === 'will-present'"
          class="padding padding-top-10px padding-bottom-5px"
        >
          <div class="fonts fonts-11 semibold black">Jadwal Tamu</div>
          <div class="fonts micro black margin margin-bottom-10-px">
            Pilih jadwal kedatangan tamu undangan.
          </div>
          <el-select
            v-model="formData.reservation_schedule_id"
            placeholder="Pilih jadwal"
            :disabled="!visibleSaveButton"
            clearable
            style="width: 100%"
          >
            <el-option
              v-for="(item, index) in dataSchedule"
              :key="index"
              :label="`${item.reservationSchedule.title} (${item.reservationSchedule.schedule_time} ${item.reservationSchedule.schedule_timezone})`"
              :value="item.reservationSchedule.id"
            >
            </el-option>
          </el-select>
          <div v-if="formMessage" class="fonts fonts-12px red">
            {{
              formMessage &&
              formMessage.reservation_schedule_id &&
              formMessage.reservation_schedule_id[0]
            }}
          </div>
        </div>
        <div
          v-if="dataBride && dataBride.length > 0"
          class="padding padding-top-10px padding-bottom-5px"
        >
          <div class="fonts fonts-11 semibold black">Undangan Khusus</div>
          <div class="fonts micro black margin margin-bottom-10-px">
            Pilih pengantin, jika undangan ini khusus untuk salah satu
            pengantin.
          </div>
          <el-select
            v-model="formData.bride_id"
            placeholder="Pilih pengantin"
            :disabled="!visibleSaveButton"
            clearable
            style="width: 100%"
          >
            <el-option
              v-for="(item, index) in dataBride"
              :key="index"
              :label="item.bride.name"
              :value="item.bride.id"
            >
            </el-option>
          </el-select>
          <div v-if="formMessage" class="fonts fonts-12px red">
            {{ formMessage && formMessage.bride_id && formMessage.bride_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Status</div>
          <div
            v-if="visibleSaveButton"
            class="padding padding-top-15px padding-bottom-15px display-flex"
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
      formData: (state) => state.customerReservationLists.form,
      formMessage: (state) => state.customerReservationLists.message,
      dataPresent: (state) => state.customerReservationLists.dataPresent,
      dataBride: (state) => state.customerReservationLists.bride.data,
      dataSchedule: (state) => state.customerReservationLists.schedule.data,
    }),
    titleForm() {
      let title = 'Tambah Reservasi'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Reservasi'
          break
        case 'edit':
          title = 'Edit Reservasi'
          break
        case 'detail':
          title = 'Detail Reservasi'
          break
      }
      return title
    },
    isCreateForm() {
      return this.typeForm === 'create' ? true : false
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
    onChangePresentType() {
      this.formData.attendance = 0
      this.formData.reservation_schedule_id = ''
    },
  },
}
</script>
