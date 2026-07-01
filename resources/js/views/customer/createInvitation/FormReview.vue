<template>
  <div id="App" class="space-y-6">
    <!-- Informasi Review Card -->
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <h2 class="text-xl font-serif text-[#141413] border-b border-[#e6dfd8] pb-3">Informasi Acara</h2>
      
      <div class="space-y-3">
        <div class="grid grid-cols-3 text-sm">
          <span class="text-[#6c6a64] font-medium">ID Undangan</span>
          <span class="col-span-2 text-[#141413] font-semibold">: {{ form.invitation_id }}</span>
        </div>
        <div v-if="errorMessage.invitation_id" class="text-xs text-[#c64545]">
          {{ errorMessage.invitation_id[0] }}
        </div>

        <div class="grid grid-cols-3 text-sm">
          <span class="text-[#6c6a64] font-medium">Short Link</span>
          <span class="col-span-2 text-[#141413] font-mono">: {{ form.short_link }}</span>
        </div>
        <div v-if="errorMessage.short_link" class="text-xs text-[#c64545]">
          {{ errorMessage.short_link[0] }}
        </div>

        <div class="grid grid-cols-3 text-sm">
          <span class="text-[#6c6a64] font-medium">Judul Undangan</span>
          <span class="col-span-2 text-[#141413] font-semibold">: {{ form.title }}</span>
        </div>
        <div v-if="errorMessage.title" class="text-xs text-[#c64545]">
          {{ errorMessage.title[0] }}
        </div>

        <div class="grid grid-cols-3 text-sm">
          <span class="text-[#6c6a64] font-medium">Tanggal Acara</span>
          <span class="col-span-2 text-[#141413]">: {{ form.date | moment('dddd, Do MMMM YYYY') }}</span>
        </div>
        <div v-if="errorMessage.date" class="text-xs text-[#c64545]">
          {{ errorMessage.date[0] }}
        </div>

        <div v-if="form.time" class="grid grid-cols-3 text-sm">
          <span class="text-[#6c6a64] font-medium">Jam Acara</span>
          <span class="col-span-2 text-[#141413]">: {{ form.time }} {{ form.time_zone }}</span>
        </div>

        <div class="grid grid-cols-3 text-sm">
          <span class="text-[#6c6a64] font-medium">Alamat / Deskripsi</span>
          <span class="col-span-2 text-[#141413] line-clamp-3">: {{ form.description }}</span>
        </div>
        <div v-if="errorMessage.description" class="text-xs text-[#c64545]">
          {{ errorMessage.description[0] }}
        </div>
      </div>
    </div>

    <!-- Packet, Theme, and Song Review Cards -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <!-- Packet -->
      <div class="bg-[#faf9f5] rounded-xl p-5 border border-[#e6dfd8] flex flex-col justify-between">
        <div>
          <span class="block text-xs font-semibold text-[#6c6a64] uppercase tracking-wider mb-3">Paket</span>
          <div v-if="errorMessage.type" class="text-xs text-[#c64545] mb-2">
            {{ errorMessage.type[0] }}
          </div>
          <div class="flex items-center space-x-3">
            <div class="h-10 w-10 rounded bg-[#efe9de] flex items-center justify-center text-[#cc785c]">
              <i class="fa fa-lg fa-flag"></i>
            </div>
            <div>
              <h4 class="text-sm font-bold text-[#141413] capitalize">{{ selectedPacket.title }}</h4>
              <p class="text-xs text-[#cc785c] mt-0.5">{{ selectedPacket.price }}</p>
            </div>
          </div>
        </div>
        <div class="mt-4 pt-3 border-t border-[#e6dfd8] flex justify-end">
          <el-tag type="success" size="mini" effect="dark" class="rounded-full">Terpilih</el-tag>
        </div>
      </div>

      <!-- Theme -->
      <div class="bg-[#faf9f5] rounded-xl p-5 border border-[#e6dfd8] flex flex-col justify-between">
        <div>
          <span class="block text-xs font-semibold text-[#6c6a64] uppercase tracking-wider mb-3">Tema</span>
          <div v-if="errorMessage.theme_id" class="text-xs text-[#c64545] mb-2">
            {{ errorMessage.theme_id[0] }}
          </div>
          <div class="flex items-center space-x-3">
            <div class="h-10 w-10 rounded overflow-hidden bg-gray-100 flex-shrink-0">
              <div
                v-if="selectedTheme.image"
                class="w-full h-full bg-cover bg-center"
                :style="`background-image: url(${themeImageThumbnailUrl + selectedTheme.image});`"
              ></div>
              <div v-else class="w-full h-full flex items-center justify-center">
                <i class="far fa-image text-[#8e8b82] text-sm"></i>
              </div>
            </div>
            <div>
              <h4 class="text-sm font-bold text-[#141413] capitalize">{{ selectedTheme.name }}</h4>
              <p class="text-xs text-[#6c6a64] mt-0.5 line-clamp-1">{{ selectedTheme.description || 'Tidak ada deskripsi.' }}</p>
            </div>
          </div>
        </div>
        <div class="mt-4 pt-3 border-t border-[#e6dfd8] flex justify-end">
          <el-tag type="success" size="mini" effect="dark" class="rounded-full">Terpilih</el-tag>
        </div>
      </div>

      <!-- Song -->
      <div class="bg-[#faf9f5] rounded-xl p-5 border border-[#e6dfd8] flex flex-col justify-between">
        <div>
          <span class="block text-xs font-semibold text-[#6c6a64] uppercase tracking-wider mb-3">Lagu Latar</span>
          <div v-if="errorMessage.song_id" class="text-xs text-[#c64545] mb-2">
            {{ errorMessage.song_id[0] }}
          </div>
          <div class="flex items-center space-x-3">
            <div class="h-10 w-10 rounded bg-[#efe9de] flex items-center justify-center text-[#cc785c]">
              <i class="fa fa-lg fa-music"></i>
            </div>
            <div>
              <h4 class="text-sm font-bold text-[#141413] capitalize">{{ selectedSong.name }}</h4>
              <p class="text-xs text-[#6c6a64] mt-0.5 line-clamp-1">{{ selectedSong.description || 'Tanpa deskripsi.' }}</p>
            </div>
          </div>
        </div>
        <div class="mt-4 pt-3 border-t border-[#e6dfd8] flex justify-end">
          <el-tag type="success" size="mini" effect="dark" class="rounded-full">Terpilih</el-tag>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import moment from 'moment'
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
      selectedTheme: (state) => state.customerInvitation.selectedTheme,
      selectedSong: (state) => state.customerInvitation.selectedSong,
      selectedPacket: (state) => state.customerInvitation.selectedPacket,
      dataPaket: (state) => state.customerPacket.data,
    }),
    selectedDataPaket() {
      return this.dataPaket.find((item) => item.value === this.form.type)
    },
  },
}
</script>
