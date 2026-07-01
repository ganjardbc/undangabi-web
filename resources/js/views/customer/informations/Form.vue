<template>
  <div id="App">
    <div
      class="card bg-white shadow-sm margin margin-top-20px margin-bottom-20px"
    >
      <div class="fonts-14 font-semibold text-black">Informasi</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          ID Undangan
          <span class="red"><span class="red">*</span></span>
        </div>
        <el-input
          v-model="form.invitation_id"
          placeholder=""
          :disabled="true"
        ></el-input>
        <div v-if="errorMessage.invitation_id" class="fonts-12px red">
          {{ errorMessage.invitation_id }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Short Link <span class="red">*</span>
        </div>
        <el-input
          v-model="form.short_link"
          @input="formShortLink"
          placeholder=""
        ></el-input>
        <div v-if="errorMessage.short_link" class="fonts-12px red">
          {{ errorMessage.short_link }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Judul <span class="red">*</span>
        </div>
        <el-input v-model="form.title" placeholder=""></el-input>
        <div v-if="errorMessage.title" class="fonts-12px red">
          {{ errorMessage.title }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-10px">
        <div class="text-[11px] font-semibold text-black">
          Kategori <span class="red">*</span>
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
        <div v-if="errorMessage.category_id" class="fonts-12px red">
          {{ errorMessage.category_id[0] }}
        </div>
      </div>
    </div>
    <div class="card bg-white shadow-sm margin margin-top-20px">
      <div class="fonts-14 font-semibold text-black">Jadwal Acara</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Tanggal <span class="red">*</span>
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
        <div v-if="errorMessage.date" class="fonts-12px red">
          {{ errorMessage.date[0] }}
        </div>
      </div>
      <div class="flex display-mobile">
        <div
          class="width width-35 width-mobile p-4 padding-top-10px padding-bottom-5px pr-[15px] padding-mobile-right-0"
        >
          <div class="text-[11px] font-semibold text-black">Jam Mulai</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.startTime"
            :picker-options="timePickerOptions"
            placeholder="Pilih Jam"
            clearable
            @change="onStartTime"
          ></el-time-select>
          <div v-if="errorMessage.time" class="fonts-12px red">
            {{ errorMessage.time }}
          </div>
        </div>
        <div
          class="width width-35 width-mobile p-4 padding-top-10px padding-bottom-5px pr-[15px] padding-mobile-right-0"
        >
          <div class="text-[11px] font-semibold text-black">Jam Berakhir</div>
          <el-time-select
            style="width: 100%"
            v-model="localForm.endTime"
            :picker-options="timePickerOptions"
            placeholder="Pilih Jam"
            clearable
            @change="onEndTime"
          ></el-time-select>
          <div v-if="errorMessage.time" class="fonts-12px red">
            {{ errorMessage.time }}
          </div>
        </div>
        <div
          class="width width-25 width-mobile p-4 padding-top-10px padding-bottom-5px"
        >
          <div class="text-[11px] font-semibold text-black">Zona Waktu</div>
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
          <div v-if="errorMessage.time_zone" class="fonts-12px red">
            {{ errorMessage.time_zone }}
          </div>
        </div>
      </div>
    </div>
    <div
      class="card bg-white shadow-sm margin margin-bottom-20px margin-top-20px"
    >
      <div class="fonts-14 font-semibold text-black">Lokasi Acara</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Alamat <span class="red">*</span>
        </div>
        <el-input
          v-model="form.description"
          placeholder=""
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8 }"
        ></el-input>
        <div v-if="errorMessage.description" class="fonts-12px red">
          {{ errorMessage.description }}
        </div>
      </div>
    </div>
    <div
      class="card bg-white shadow-sm margin margin-top-20px margin-bottom-20px"
    >
      <AppCardCollapse title="Note & Hastag">
        <div class="p-4 padding-top-10px padding-bottom-10px">
          <div class="text-[11px] font-semibold text-black">Note</div>
          <div class="text-[10px] normal text-black">
            Catatan untuk tamu yang diundang
          </div>
          <vue-editor
            v-model="form.note"
            :editorToolbar="editorConfig"
          ></vue-editor>
          <div v-if="errorMessage.note" class="fonts-12px red">
            {{ errorMessage.note }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-10px">
          <div class="text-[11px] font-semibold text-black">Hashtag</div>
          <div class="text-[10px] normal text-black">
            Tambah hashtag diundangan kamu, hashtag ini akan muncul di kalimat
            undangan kamu nanti.
          </div>
          <el-input v-model="form.tag" placeholder="" type="text"></el-input>
          <div v-if="errorMessage.tag" class="fonts-12px red">
            {{ errorMessage.tag }}
          </div>
        </div>
      </AppCardCollapse>
    </div>
    <div
      class="card bg-white shadow-sm margin margin-top-20px margin-bottom-20px"
    >
      <AppCardCollapse title="Quotes">
        <div class="p-4 padding-top-10px padding-bottom-10px">
          <div class="text-[11px] font-semibold text-black">Greeting</div>
          <vue-editor
            v-model="form.greeting_quotes"
            :editorToolbar="editorConfig"
          ></vue-editor>
          <div v-if="errorMessage.greeting_quotes" class="fonts-12px red">
            {{ errorMessage.greeting_quotes }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-10px">
          <div class="text-[11px] font-semibold text-black">Closing</div>
          <vue-editor
            v-model="form.closing_quotes"
            :editorToolbar="editorConfig"
          ></vue-editor>
          <div v-if="errorMessage.closing_quotes" class="fonts-12px red">
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
import AppCardCollapse from '../../../components/modules/AppCardCollapse'

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
