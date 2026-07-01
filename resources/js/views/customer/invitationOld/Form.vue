<template>
  <div id="App">
    <div class="card bg-white shadow-sm margin margin-bottom-20px">
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

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Jadwal Acara</div>
      <div class="p-4 padding-top-10px padding-bottom-10px">
        <div class="text-[11px] font-semibold text-black">
          Hari <span class="red">*</span>
        </div>
        <el-select
          v-model="form.day"
          slot="prepend"
          class="el-select-custom-form"
          placeholder=""
        >
          <el-option
            v-for="(dt, i) in days"
            :key="i"
            :label="dt"
            :value="dt"
          ></el-option>
        </el-select>
        <div v-if="errorMessage.day" class="fonts-12px red">
          {{ errorMessage.day }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Tanggal <span class="red">*</span>
        </div>
        <el-input v-model="form.date" placeholder="" type="date"></el-input>
        <div v-if="errorMessage.date" class="fonts-12px red">
          {{ errorMessage.date }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">Jam</div>
        <div class="text-[10px] normal text-gray-500">
          Isi dengan jam mulai - jam akhir (09.00 - 17.00)
        </div>
        <el-input v-model="form.time" placeholder=""></el-input>
        <div v-if="errorMessage.time" class="fonts-12px red">
          {{ errorMessage.time }}
        </div>
      </div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">Zona Waktu</div>
        <div class="text-[10px] normal text-gray-500">Pilih WIB/WIT/WITA</div>
        <el-select
          v-model="form.time_zone"
          slot="prepend"
          class="el-select-custom-form"
          placeholder=""
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

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Note</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Catatan untuk tamu yang diundang
        </div>
        <el-input
          v-model="form.note"
          placeholder=""
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8 }"
        ></el-input>
        <div v-if="errorMessage.note" class="fonts-12px red">
          {{ errorMessage.note }}
        </div>
      </div>
    </div>

    <div class="card bg-white shadow-sm">
      <div class="fonts-14 font-semibold text-black">Hashtag</div>
      <div class="p-4 padding-top-10px padding-bottom-5px">
        <div class="text-[11px] font-semibold text-black">
          Tambah hashtag diundangan kamu, hashtag ini akan muncul di kalimat
          undangan kamu nanti.
        </div>
        <el-input v-model="form.tag" placeholder="" type="text"></el-input>
        <div v-if="errorMessage.tag" class="fonts-12px red">
          {{ errorMessage.tag }}
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState, mapGetters } from 'vuex'

export default {
  name: 'App',
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
  },
}
</script>
