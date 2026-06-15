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
            ID Acara <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.event_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.event_id" class="fonts fonts-12px red">
            {{ formMessage.event_id[0] }}
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
          <div class="fonts fonts-11 semibold black">Deskripsi</div>
          <vue-editor
            v-model="formData.description"
            :editorToolbar="editorConfig"
            :disabled="!visibleSaveButton"
          ></vue-editor>
          <div v-if="formMessage.description" class="fonts fonts-12px red">
            {{ formMessage.description[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Alamat <span class="fonts red">*</span>
          </div>
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
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Tanggal</div>
          <el-date-picker
            style="width: 100%"
            v-model="formData.date"
            type="date"
            placeholder="Pilih Tanggal"
            :picker-options="pickerOptions"
            :disabled="!visibleSaveButton"
            clearable
            format="yyyy-MM-dd"
            value-format="yyyy-MM-dd"
          >
          </el-date-picker>
          <div v-if="formMessage.day" class="fonts fonts-12px red">
            {{ formMessage.day[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Jam Mulai</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.startTime"
            :picker-options="timePickerOptions"
            :disabled="!visibleSaveButton"
            placeholder="Pilih Jam"
            clearable
            @change="onStartTime"
          ></el-time-select>
          <div v-if="formMessage.time" class="fonts fonts-12px red">
            {{ formMessage.time[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Jam Berakhir</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.endTime"
            :picker-options="timePickerOptions"
            :disabled="!visibleSaveButton"
            placeholder="Pilih Jam"
            clearable
            @change="onEndTime"
          ></el-time-select>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Zone Waktu</div>
          <el-select
            v-model="formData.time_zone"
            slot="prepend"
            class="el-select-custom-form"
            :disabled="!visibleSaveButton"
            placeholder=""
            clearable
          >
            <el-option
              v-for="(dt, i) in timeZone"
              :key="i"
              :label="dt"
              :value="dt"
            ></el-option>
          </el-select>
          <div v-if="formMessage.time_zone" class="fonts fonts-12px red">
            {{ formMessage.time_zone[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Live Streaming</div>
          <div class="fonts fonts-10 normal grey">
            Isi dengan link jika acara akan dilakukan secara live-streaming
          </div>
          <el-input
            v-model="formData.streaming_link"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.streaming_link" class="fonts fonts-12px red">
            {{ formMessage.streaming_link[0] }}
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
import { VueEditor } from 'vue2-editor'
import AppSideFormPopup from '../../modules/AppSideFormPopup'

export default {
  name: 'App',
  data() {
    return {
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() < Date.now() - 8.64e7
        },
      },
      timePickerOptions: {
        start: '00:00',
        step: '00:15',
        end: '23:45',
      },
      localForm: {
        startTime: '',
        endTime: '',
      },
    }
  },
  props: {
    visibleForm: false,
    typeForm: {
      type: String,
      default: 'create',
    },
  },
  watch: {
    formData(props) {
      this.setLocalTime(props.time)
    },
  },
  mounted() {
    this.setLocalTime(this.formData.time)
  },
  components: {
    VueEditor,
    AppSideFormPopup,
  },
  computed: {
    ...mapState({
      formData: (state) => state.customerEvents.form,
      formMessage: (state) => state.customerEvents.message,
      days: (state) => state.customerInvitation.days,
      timeZone: (state) => state.customerInvitation.timeZone,
    }),
    titleForm() {
      let title = 'Tambah Acara'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Acara'
          break
        case 'edit':
          title = 'Edit Acara'
          break
        case 'detail':
          title = 'Detail Acara'
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
    onStartTime(value) {
      this.formData.time = `${value} - ${this.localForm.endTime}`
    },
    onEndTime(value) {
      this.formData.time = `${this.localForm.startTime} - ${value}`
    },
    setLocalTime(value) {
      this.localForm.startTime = value.split(' - ')[0]
      this.localForm.endTime = value.split(' - ')[1]
    },
  },
}
</script>
