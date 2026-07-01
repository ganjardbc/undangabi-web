<template>
  <div id="App">
    <div
      class="card bg-white box-shadow margin margin-top-20px margin-bottom-20px"
    >
      <div class="fonts fonts-14 semibold black">Informasi</div>
      <div class="padding padding-top-10px padding-bottom-5px">
        <div class="fonts fonts-11 semibold black">
          ID Undangan
          <span class="fonts red"><span class="fonts red">*</span></span>
        </div>
        <el-input
          v-model="form.invitation_id"
          placeholder=""
          :disabled="true"
        ></el-input>
        <div v-if="errorMessage.invitation_id" class="fonts fonts-12px red">
          {{ errorMessage.invitation_id }}
        </div>
      </div>
      <div class="padding padding-top-10px padding-bottom-5px">
        <div class="fonts fonts-11 semibold black">
          Short Link <span class="fonts red">*</span>
        </div>
        <el-input
          v-model="form.short_link"
          @input="formShortLink"
          placeholder=""
        ></el-input>
        <div v-if="errorMessage.short_link" class="fonts fonts-12px red">
          {{ errorMessage.short_link }}
        </div>
      </div>
      <div class="padding padding-top-10px padding-bottom-5px">
        <div class="fonts fonts-11 semibold black">
          Judul <span class="fonts red">*</span>
        </div>
        <el-input v-model="form.title" placeholder=""></el-input>
        <div v-if="errorMessage.title" class="fonts fonts-12px red">
          {{ errorMessage.title }}
        </div>
      </div>
      <div class="padding padding-top-10px padding-bottom-10px">
        <div class="fonts fonts-11 semibold black">
          Kategori <span class="fonts red">*</span>
        </div>
        <el-select
          v-model="form.category_id"
          slot="prepend"
          class="el-select-custom-form"
          placeholder=""
        >
          <el-option
            v-for="(dt, i) in categories"
            :key="i"
            :label="dt.name"
            :value="dt.id"
          ></el-option>
        </el-select>
        <div v-if="errorMessage.category_id" class="fonts fonts-12px red">
          {{ errorMessage.category_id[0] }}
        </div>
      </div>
    </div>
    <div class="card bg-white box-shadow margin margin-top-20px">
      <div class="fonts fonts-14 semibold black">Jadwal Acara</div>
      <div class="padding padding-top-10px padding-bottom-5px">
        <div class="fonts fonts-11 semibold black">
          Tanggal <span class="fonts red">*</span>
        </div>
        <el-date-picker
          style="width: 100%"
          v-model="form.date"
          type="date"
          placeholder="Pilih Tanggal"
          :picker-options="pickerOptions"
          clearable
          format="yyyy-MM-dd"
          value-format="yyyy-MM-dd"
        >
        </el-date-picker>
        <div v-if="errorMessage.date" class="fonts fonts-12px red">
          {{ errorMessage.date[0] }}
        </div>
      </div>
      <div class="display-flex display-mobile">
        <div
          class="width width-35 width-mobile padding padding-top-10px padding-bottom-5px padding-right-15px padding-mobile-right-0"
        >
          <div class="fonts fonts-11 semibold black">Jam Mulai</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.startTime"
            :picker-options="timePickerOptions"
            placeholder="Pilih Jam"
            clearable
            @change="onStartTime"
          ></el-time-select>
          <div v-if="errorMessage.time" class="fonts fonts-12px red">
            {{ errorMessage.time }}
          </div>
        </div>
        <div
          class="width width-35 width-mobile padding padding-top-10px padding-bottom-5px padding-right-15px padding-mobile-right-0"
        >
          <div class="fonts fonts-11 semibold black">Jam Berakhir</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.endTime"
            :picker-options="timePickerOptions"
            placeholder="Pilih Jam"
            clearable
            @change="onEndTime"
          ></el-time-select>
          <div v-if="errorMessage.time" class="fonts fonts-12px red">
            {{ errorMessage.time }}
          </div>
        </div>
        <div
          class="width width-25 width-mobile padding padding-top-10px padding-bottom-5px"
        >
          <div class="fonts fonts-11 semibold black">Zona Waktu</div>
          <el-select
            v-model="form.time_zone"
            slot="prepend"
            class="el-select-custom-form"
            placeholder="Pilih Zona"
            clearable
          >
            <el-option
              v-for="(dt, i) in timeZone"
              :key="i"
              :label="dt"
              :value="dt"
            ></el-option>
          </el-select>
          <div v-if="errorMessage.time_zone" class="fonts fonts-12px red">
            {{ errorMessage.time_zone }}
          </div>
        </div>
      </div>
    </div>
    <div
      class="card bg-white box-shadow margin margin-bottom-20px margin-top-20px"
    >
      <div class="fonts fonts-14 semibold black">Lokasi Acara</div>
      <div class="padding padding-top-10px padding-bottom-5px">
        <div class="fonts fonts-11 semibold black">
          Alamat <span class="fonts red">*</span>
        </div>
        <el-input
          v-model="form.description"
          placeholder=""
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8 }"
        ></el-input>
        <div v-if="errorMessage.description" class="fonts fonts-12px red">
          {{ errorMessage.description }}
        </div>
      </div>
    </div>
    <div
      class="card bg-white box-shadow margin margin-top-20px margin-bottom-20px"
    >
      <AppCardCollapse title="Note & Hastag">
        <div class="padding padding-top-10px padding-bottom-10px">
          <div class="fonts fonts-11 semibold black">Note</div>
          <div class="fonts fonts-10 normal black">
            Catatan untuk tamu yang diundang
          </div>
          <vue-editor
            v-model="form.note"
            :editorToolbar="editorConfig"
          ></vue-editor>
          <div v-if="errorMessage.note" class="fonts fonts-12px red">
            {{ errorMessage.note }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-10px">
          <div class="fonts fonts-11 semibold black">Hashtag</div>
          <div class="fonts fonts-10 normal black">
            Tambah hashtag diundangan kamu, hashtag ini akan muncul di kalimat
            undangan kamu nanti.
          </div>
          <el-input v-model="form.tag" placeholder="" type="text"></el-input>
          <div v-if="errorMessage.tag" class="fonts fonts-12px red">
            {{ errorMessage.tag }}
          </div>
        </div>
      </AppCardCollapse>
    </div>
    <div
      class="card bg-white box-shadow margin margin-top-20px margin-bottom-20px"
    >
      <AppCardCollapse title="Quotes">
        <div class="padding padding-top-10px padding-bottom-10px">
          <div class="fonts fonts-11 semibold black">Greeting</div>
          <vue-editor
            v-model="form.greeting_quotes"
            :editorToolbar="editorConfig"
          ></vue-editor>
          <div v-if="errorMessage.greeting_quotes" class="fonts fonts-12px red">
            {{ errorMessage.greeting_quotes }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-10px">
          <div class="fonts fonts-11 semibold black">Closing</div>
          <vue-editor
            v-model="form.closing_quotes"
            :editorToolbar="editorConfig"
          ></vue-editor>
          <div v-if="errorMessage.closing_quotes" class="fonts fonts-12px red">
            {{ errorMessage.closing_quotes }}
          </div>
        </div>
      </AppCardCollapse>
    </div>
  </div>
</template>
<script>
import { mapState, mapGetters } from 'vuex'
import { VueEditor } from 'vue2-editor'
import AppCardCollapse from '../../modules/AppCardCollapse'

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
  watch: {
    form(props) {
      this.setLocalTime(props.time)
    },
  },
  mounted() {
    this.setLocalTime(this.form.time)
  },
  components: {
    AppCardCollapse,
    VueEditor,
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
      invitationLoading: 'customerInvitation/loading',
    }),
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      days: (state) => state.customerInvitation.days,
      timeZone: (state) => state.customerInvitation.timeZone,
      categories: (state) => state.customerCategory.data,
    }),
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
  },
  methods: {
    formShortLink(value) {
      this.form.short_link = value.replace(/[ ]/g, '-')
    },
    onStartTime(value) {
      this.form.time = `${value} - ${this.localForm.endTime}`
    },
    onEndTime(value) {
      this.form.time = `${this.localForm.startTime} - ${value}`
    },
    setLocalTime(value) {
      this.localForm.startTime = value.split(' - ')[0]
      this.localForm.endTime = value.split(' - ')[1]
    },
  },
}
</script>
