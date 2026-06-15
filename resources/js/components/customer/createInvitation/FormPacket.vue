<template>
  <div id="App">
    <div class="bg-white margin margin-bottom-20px">
      <div v-loading="visibleLoading" class="width width-100">
        <div class="display-flex space-between align-center">
          <div>
            <div class="fonts fonts-14 semibold black">
              Pilih Paket Undangan
            </div>
            <div class="fonts fonts-11 normal black">
              Perubahan paket akan merubah harga dan fitur dari undangan.
            </div>
            <div
              v-if="errorMessage.type"
              class="fonts fonts-12px red margin margin-bottom-5px"
            >
              {{ errorMessage.type[0] }}
            </div>
          </div>
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
              <div
                class="image image-padding bg-grey"
                :style="`background-image: url(${themeImageThumbnailUrl + dt.image});`"
              >
                <i
                  v-if="!dt.image"
                  class="post-middle-absolute fa fa-lg fa-image"
                ></i>
              </div>
            </div>
            <div class="display-flex flex-end">
              <button
                v-if="form.type === dt.value"
                class="btn btn-main btn-icon"
              >
                <i class="fa fa-lg fa-check-circle"></i>
              </button>
              <button
                v-else
                class="btn btn-sekunder btn-icon"
                @click="onSelectData(dt)"
              >
                <i class="fa fa-lg fa-check-circle"></i>
              </button>
            </div>
          </div>
          <div class="width width-100">
            <div class="fonts fonts-11 semibold black">{{ dt.title }}</div>
            <div class="fonts fonts-10 normal grey">{{ dt.price }}</div>
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
      visibleLoading: false,
      currentPage: 0,
      limit: 5,
    }
  },
  mounted() {},
  components: {
    AppLoader,
  },
  computed: {
    ...mapGetters({
      packetLoading: 'customerPacket/loading',
    }),
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      selectedRaw: (state) => state.customerInvitation.selectedRaw,
      data: (state) => state.customerPacket.data,
    }),
    dataTheme() {
      return this.selectedRaw && this.selectedRaw.theme
    },
    totalRecord() {
      return this.data.length
    },
  },
  methods: {
    ...mapActions({
      onChangePacket: 'customerInvitation/onChangePacket',
    }),
    onSelectData(data) {
      this.form.type = data.value
      this.onChangePacket(data)
    },
    handleCurrentChange(value) {
      this.currentPage = value
    },
  },
}
</script>
