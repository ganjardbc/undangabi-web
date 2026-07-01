<template>
  <div id="App">
    <AppSideFormPopup
      :title="titleForm"
      :enableSaveButton="visibleSaveButton"
      :visibleForm="visibleForm"
      @onSave="onSave"
      @onClose="onClose"
    >
      <div class="width w-full">
        <div class="p-4 padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            ID Acara <span class="red">*</span>
          </div>
          <el-input
            v-model="formData.event_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.event_id" class="fonts-12px red">
            {{ formMessage.event_id[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            Judul <span class="red">*</span>
          </div>
          <el-input
            v-model="formData.title"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.title" class="fonts-12px red">
            {{ formMessage.title[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Deskripsi</div>
          <vue-editor
            v-model="formData.description"
            :editorToolbar="editorConfig"
            :disabled="!visibleSaveButton"
          ></vue-editor>
          <div v-if="formMessage.description" class="fonts-12px red">
            {{ formMessage.description[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            Alamat <span class="red">*</span>
          </div>
          <el-input
            type="textarea"
            v-model="formData.address"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.address" class="fonts-12px red">
            {{ formMessage.address[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Tanggal</div>
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
          <div v-if="formMessage.day" class="fonts-12px red">
            {{ formMessage.day[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Jam Mulai</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.startTime"
            :picker-options="timePickerOptions"
            :disabled="!visibleSaveButton"
            placeholder="Pilih Jam"
            clearable
            @change="onStartTime"
          ></el-time-select>
          <div v-if="formMessage.time" class="fonts-12px red">
            {{ formMessage.time[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Jam Berakhir</div>
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
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Zone Waktu</div>
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
          <div v-if="formMessage.time_zone" class="fonts-12px red">
            {{ formMessage.time_zone[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Live Streaming</div>
          <div class="text-[10px] normal text-gray-500">
            Isi dengan link jika acara akan dilakukan secara live-streaming
          </div>
          <el-input
            v-model="formData.streaming_link"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.streaming_link" class="fonts-12px red">
            {{ formMessage.streaming_link[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Status</div>
          <div
            v-if="visibleSaveButton"
            class="p-4 pt-[15px] pb-[15px] flex"
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
              <span class="micro"> Active </span>
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
              <span class="micro"> Inactive </span>
            </label>
          </div>
          <el-input
            v-if="!visibleSaveButton"
            placeholder=""
            :value="formData.status === 'active' ? 'Active' : 'Inactive'"
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.status" class="fonts-12px red">
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
import AppSideFormPopup from '../../../components/modules/AppSideFormPopup'

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
