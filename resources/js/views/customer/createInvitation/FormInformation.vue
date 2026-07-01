<template>
  <div id="App" class="space-y-6">
    <!-- Section 1: Informasi Dasar -->
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <h2 class="text-xl font-serif text-[#141413] border-b border-[#e6dfd8] pb-3">Informasi Dasar</h2>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">ID Undangan *</label>
          <el-input
            v-model="form.invitation_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="errorMessage.invitation_id" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.invitation_id[0] }}
          </div>
        </div>

        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-1">Short Link *</label>
          <el-input
            v-model="form.short_link"
            @input="formShortLink"
            placeholder=""
          ></el-input>
          <div v-if="errorMessage.short_link" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.short_link[0] }}
          </div>
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 pt-2">
        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-1">Judul *</label>
          <el-input v-model="form.title" placeholder=""></el-input>
          <div v-if="errorMessage.title" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.title[0] }}
          </div>
        </div>

        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">Kategori *</label>
          <el-select
            v-model="form.category_id"
            class="w-full"
            placeholder="Pilih Kategori"
          >
            <el-option
              v-for="(dt, i) in categories"
              :key="i"
              :label="dt.name"
              :value="dt.id"
            ></el-option>
          </el-select>
          <div v-if="errorMessage.category_id" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.category_id[0] }}
          </div>
        </div>
      </div>
    </div>

    <!-- Section 2: Jadwal Acara -->
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <h2 class="text-xl font-serif text-[#141413] border-b border-[#e6dfd8] pb-3">Jadwal Acara</h2>
      
      <div>
        <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">Tanggal *</label>
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
        <div v-if="errorMessage.date" class="text-xs text-[#c64545] mt-1">
          {{ errorMessage.date[0] }}
        </div>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 pt-2">
        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">Jam Mulai</label>
          <el-time-select
            style="width: 100%"
            v-model="localForm.startTime"
            :picker-options="timePickerOptions"
            placeholder="Pilih Jam"
            clearable
            @change="onStartTime"
          ></el-time-select>
          <div v-if="errorMessage.time" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.time }}
          </div>
        </div>

        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">Jam Berakhir</label>
          <el-time-select
            style="width: 100%"
            v-model="localForm.endTime"
            :picker-options="timePickerOptions"
            placeholder="Pilih Jam"
            clearable
            @change="onEndTime"
          ></el-time-select>
          <div v-if="errorMessage.time" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.time }}
          </div>
        </div>

        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">Zona Waktu</label>
          <el-select
            v-model="form.time_zone"
            class="w-full"
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
          <div v-if="errorMessage.time_zone" class="text-xs text-[#c64545] mt-1">
            {{ errorMessage.time_zone }}
          </div>
        </div>
      </div>
    </div>

    <!-- Section 3: Lokasi Acara -->
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <h2 class="text-xl font-serif text-[#141413] border-b border-[#e6dfd8] pb-3">Lokasi Acara</h2>
      <div>
        <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider mb-2">Alamat / Deskripsi *</label>
        <el-input
          v-model="form.description"
          placeholder="Tuliskan alamat lengkap lokasi acara..."
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8 }"
        ></el-input>
        <div v-if="errorMessage.description" class="text-xs text-[#c64545] mt-1">
          {{ errorMessage.description[0] }}
        </div>
      </div>
    </div>

    <!-- Section 4: Pengaturan Privasi -->
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <h2 class="text-xl font-serif text-[#141413] border-b border-[#e6dfd8] pb-3">Pengaturan Privasi</h2>
      <div class="flex justify-between items-center py-2">
        <div>
          <label class="block text-xs font-semibold text-[#141413] uppercase tracking-wider">Tipe Privasi</label>
          <p class="text-xs text-[#6c6a64] mt-1">
            Ubah pengaturan privasi undangan untuk Publik atau Privat
          </p>
        </div>
        <div>
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
      <div v-if="errorMessage.privacy" class="text-xs text-[#c64545] mt-1">
        {{ errorMessage.privacy[0] }}
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
