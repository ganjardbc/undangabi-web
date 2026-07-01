<template>
  <div id="App">
    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Informasi</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          ID Undangan <span class="red">*</span>
        </div>
        <el-input
          v-model="form.invitation_id"
          placeholder=""
          :disabled="true"
        ></el-input>
        <div v-if="errorMessage.invitation_id" class="fonts-12px red">
          {{ errorMessage.invitation_id[0] }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Short Link <span class="red">*</span>
        </div>
        <div class="text-[10px] normal text-black">Contoh: sinta-rio</div>
        <el-input
          v-model="form.short_link"
          @input="formShortLink"
          placeholder=""
        ></el-input>
        <div v-if="errorMessage.short_link" class="fonts-12px red">
          {{ errorMessage.short_link[0] }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Judul <span class="red">*</span>
        </div>
        <div class="text-[10px] normal text-black">Contoh: Sinta & Rio</div>
        <el-input v-model="form.title" placeholder=""></el-input>
        <div v-if="errorMessage.title" class="fonts-12px red">
          {{ errorMessage.title[0] }}
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

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
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

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Lokasi Acara</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Alamat / Deskripsi <span class="red">*</span>
        </div>
        <el-input
          v-model="form.description"
          placeholder=""
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8 }"
        ></el-input>
        <div v-if="errorMessage.description" class="fonts-12px red">
          {{ errorMessage.description[0] }}
        </div>
      </div>
    </div>

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Pengaturan</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div
          class="flex display-mobile items-center p-4 padding-bottom-5px"
        >
          <div class="width width-70 width-mobile">
            <div class="text-[11px] font-semibold text-black">Privasi</div>
            <div class="text-[10px] normal text-gray-500">
              Ubah pengaturan privasi undangan untuk Publik atau Privat
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
    </div>
  </div>
</template>
<script>
import { mapState, mapGetters } from 'vuex'

export default {
  name: 'App',
  data() {
    return {
      localForm: {
        startTime: '',
        endTime: '',
      },
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
    }
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
      invitationLoading: 'customerInvitation/loading',
    }),
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      timeZone: (state) => state.customerInvitation.timeZone,
      privacyList: (state) => state.customerInvitation.privacyList,
      categories: (state) => state.customerCategory.data,
    }),
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
  },
}
</script>
