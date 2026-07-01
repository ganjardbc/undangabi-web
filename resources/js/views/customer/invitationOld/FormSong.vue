<template>
  <div id="App">
    <div class="bg-white">
      <div v-if="dataSong" class="width w-full">
        <div class="fonts-14 font-semibold text-black">Lagu Sekarang</div>
        <div class="width w-full p-4 pt-[15px]">
          <div class="card bg-white shadow-sm">
            <div
              class="flex justify-between items-center margin mb-[15px]"
            >
              <div class="width width-55px">
                <div class="image image-padding bg-grey">
                  <i class="post-middle-absolute fa fa-lg fa-microphone"></i>
                </div>
              </div>
              <div class="width width-100px flex justify-end">
                <button
                  :class="`btn btn-icon ${selectedSong.id === dataSong.id ? 'btn-sekunder' : 'btn-sekunder'}`"
                  :disabled="selectedSong.id === dataSong.id ? false : isPlayed"
                  @click="onSelectedSong(dataSong)"
                >
                  <i
                    :class="`fa fa-lg ${selectedSong.id === dataSong.id ? 'fa-stop' : 'fa-play'}`"
                  ></i>
                </button>
              </div>
            </div>
            <div class="width w-full">
              <div class="text-[11px] font-semibold text-black">
                {{ dataSong.name }}
              </div>
              <div class="text-[10px] normal text-gray-500">
                {{ dataSong.description }}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        class="margin mb-[15px] p-4 padding-top-20px border-bottom"
      ></div>
      <div v-loading="visibleLoading" class="width w-full">
        <div class="flex justify-between items-center">
          <div class="fonts-14 font-semibold text-black">Daftar Lagu</div>
        </div>
        <div
          v-for="(dt, i) in data"
          :key="i"
          class="card bg-white shadow-sm margin margin-top-15px mb-[15px]"
        >
          <div
            class="flex justify-between items-center margin mb-[15px]"
          >
            <div class="width width-55px">
              <div class="image image-padding bg-grey">
                <i class="post-middle-absolute fa fa-lg fa-microphone"></i>
              </div>
            </div>
            <div class="width width-100px flex justify-end">
              <button
                :class="`margin margin-right-10px btn btn-icon ${selectedSong.id === dt.id ? 'btn-sekunder' : 'btn-sekunder'}`"
                :disabled="selectedSong.id === dt.id ? false : isPlayed"
                @click="onSelectedSong(dt)"
              >
                <i
                  :class="`fa fa-lg ${selectedSong.id === dt.id ? 'fa-stop' : 'fa-play'}`"
                ></i>
              </button>
              <button
                v-if="form.song_id === dt.id"
                class="btn btn-main btn-icon"
              >
                <i class="fa fa-lg fa-check-circle"></i>
              </button>
              <button
                v-else
                class="btn btn-sekunder btn-icon"
                @click="onSelectData(dt.id)"
              >
                <i class="fa fa-lg fa-check-circle"></i>
              </button>
            </div>
          </div>
          <div class="width w-full">
            <div class="text-[11px] font-semibold text-black">{{ dt.name }}</div>
            <div class="text-[10px] normal text-gray-500">{{ dt.description }}</div>
          </div>
        </div>
      </div>
      <div class="width w-full flex justify-end items-center">
        <div class="text-[10px] normal text-black">Total {{ totalRecord }}</div>
        <el-pagination
          background
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-size="limit"
          :pager-count="5"
          layout="prev, pager, next"
          :total="totalRecord"
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
    // currentPage () {
    //     return this.offset + 1
    // },
    dataSong() {
      return this.selectedRaw && this.selectedRaw.song
    },
  },
  methods: {
    ...mapActions({
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
    onSelectData(value) {
      this.form.song_id = value
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
