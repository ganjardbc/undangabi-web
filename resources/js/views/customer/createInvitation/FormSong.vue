<template>
  <div id="App" class="space-y-6">
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <div class="border-b border-[#e6dfd8] pb-3 flex justify-between items-center">
        <div>
          <h2 class="text-xl font-serif text-[#141413]">Pilih Lagu Latar</h2>
          <p class="text-xs text-[#6c6a64] mt-1">Pilih alunan musik yang menemani tamu saat membuka undangan Anda.</p>
        </div>
      </div>

      <div v-if="errorMessage.song_id" class="text-xs text-[#c64545]">
        {{ errorMessage.song_id[0] }}
      </div>

      <div v-loading="visibleLoading" class="space-y-3 pt-2">
        <div
          v-for="(dt, i) in data"
          :key="i"
          :class="[
            'bg-[#efe9de] rounded-xl p-4 border flex items-center justify-between transition-all duration-200 cursor-pointer',
            form.song_id === dt.id ? 'border-[#cc785c] ring-2 ring-[#cc785c]/10' : 'border-[#e6dfd8] hover:border-[#6c6a64]'
          ]"
          @click="onSelectData(dt)"
        >
          <!-- Left side icon and text -->
          <div class="flex items-center space-x-4">
            <div class="h-12 w-12 rounded-full bg-[#faf9f5] border border-[#e6dfd8] flex items-center justify-center text-[#cc785c]">
              <i class="fa fa-lg fa-microphone"></i>
            </div>
            <div>
              <h3 class="text-sm font-semibold text-[#141413] capitalize">{{ dt.name }}</h3>
              <p class="text-xs text-[#6c6a64] mt-0.5">{{ dt.description || 'Tanpa deskripsi.' }}</p>
            </div>
          </div>

          <!-- Action buttons right side -->
          <div class="flex items-center space-x-2" @click.stop>
            <el-button
              :type="selectedSong.id === dt.id ? 'danger' : 'default'"
              :icon="selectedSong.id === dt.id ? 'el-icon-video-pause' : 'el-icon-video-play'"
              circle
              size="small"
              :disabled="selectedSong.id === dt.id ? false : isPlayed"
              @click="onSelectedSong(dt)"
            ></el-button>

            <el-button
              :type="form.song_id === dt.id ? 'primary' : 'default'"
              icon="el-icon-check"
              circle
              size="small"
              @click="onSelectData(dt)"
            ></el-button>
          </div>
        </div>
      </div>

      <div class="flex justify-between items-center pt-6 border-t border-[#e6dfd8]">
        <div class="text-xs text-[#6c6a64]">Total {{ totalRecord }} Lagu</div>
        <el-pagination
          background
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-size="limit"
          :pager-count="5"
          layout="prev, pager, next"
          :total="totalRecord"
          class="custom-pagination"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState, mapGetters, mapActions } from 'vuex'
import AppLoader from '../../../components/modules/AppLoader'

export default {
  name: 'App',
  data() {
    return {
      currentPage: 0,
    }
  },
  mounted() {
    this.resetFilterSong()
    this.getData()
  },
  components: {
    AppLoader,
  },
  computed: {
    ...mapGetters({
      songLoading: 'customerSong/loading',
    }),
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      selectedRaw: (state) => state.customerInvitation.selectedRaw,
      data: (state) => state.customerSong.data,
      totalRecord: (state) => state.customerSong.totalRecord,
      limit: (state) => state.customerSong.limit,
      offset: (state) => state.customerSong.offset,
      visibleLoading: (state) => state.customerSong.loading,
      visibleLoadMore: (state) => state.customerSong.loadMore,
      selectedSong: (state) => state.customerSong.selectedSong,
      audio: (state) => state.customerSong.audio,
      isPlayed: (state) => state.customerSong.isPlayed,
    }),
    dataSong() {
      return this.selectedRaw && this.selectedRaw.song
    },
  },
  methods: {
    ...mapActions({
      onChangeSong: 'customerInvitation/onChangeSong',
      getCustomerSong: 'customerSong/getData',
      resetFilterSong: 'customerSong/resetFilter',
      setAudio: 'customerSong/setAudio',
      setIsPlayed: 'customerSong/setIsPlayed',
      setSelectedSong: 'customerSong/setSelectedSong',
      setPagination: 'customerSong/setPagination',
    }),
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerSong({ token })
    },
    onSelectData(data) {
      this.form.song_id = data.id
      this.onChangeSong(data)
    },
    onSelectedSong(value) {
      if (!this.selectedSong) {
        const song = this.songUrl + value.song
        const defaultAudio = new Audio(song)
        this.setAudio(defaultAudio)
      }
      if (this.selectedSong.id === value.id) {
        // pause
        this.setIsPlayed(false)
        this.setSelectedSong('')
        this.audio.pause()
      } else {
        // play new song
        this.setIsPlayed(true)
        this.setSelectedSong(value)
        this.audio.play()
      }
    },
    handleCurrentChange(value) {
      this.setPagination(value)
      this.getData()
    },
  },
}
</script>
