<template>
  <div id="App" class="margin margin-top-15px">
    <div class="bg-white">
      <div v-if="dataSong" class="width width-100">
        <div class="fonts fonts-14 semibold black">Lagu Sekarang</div>
        <div class="width width-100 padding padding-top-15px">
          <div class="card bg-white box-shadow">
            <div
              class="display-flex space-between align-center margin margin-bottom-15px"
            >
              <div class="width width-55px">
                <div class="image image-padding bg-grey">
                  <i class="post-middle-absolute fa fa-lg fa-microphone"></i>
                </div>
              </div>
              <div class="width width-100px display-flex flex-end">
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
            <div class="width width-100">
              <div class="fonts fonts-11 semibold black">
                {{ dataSong.name }}
              </div>
              <div class="fonts fonts-10 normal grey">
                {{ dataSong.description }}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        class="margin margin-bottom-15px padding padding-top-20px border-bottom"
      ></div>
      <div v-loading="visibleLoading" class="width width-100">
        <div class="display-flex space-between align-center">
          <div class="fonts fonts-14 semibold black">Daftar Lagu</div>
        </div>
        <div
          v-for="(dt, i) in data"
          :key="i"
          class="card bg-white box-shadow margin margin-top-15px margin-bottom-15px"
        >
          <div
            class="display-flex space-between align-center margin margin-bottom-15px"
          >
            <div class="width width-55px">
              <div class="image image-padding bg-grey">
                <i class="post-middle-absolute fa fa-lg fa-microphone"></i>
              </div>
            </div>
            <div class="width width-100px display-flex flex-end">
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
          <div class="width width-100">
            <div class="fonts fonts-11 semibold black">{{ dt.name }}</div>
            <div class="fonts fonts-10 normal grey">{{ dt.description }}</div>
          </div>
        </div>
      </div>
      <div class="width width-100 display-flex flex-end align-center">
        <div class="fonts fonts-10 normal black">Total {{ totalRecord }}</div>
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
import AppLoader from '../../modules/AppLoader'

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
