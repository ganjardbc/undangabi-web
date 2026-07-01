<template>
  <div id="App" class="space-y-6">
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <div class="border-b border-[#e6dfd8] pb-3 flex justify-between items-center">
        <div>
          <h2 class="text-xl font-serif text-[#141413]">Pilih Paket Undangan</h2>
          <p class="text-xs text-[#6c6a64] mt-1">Perubahan paket akan merubah harga dan fitur dari undangan.</p>
        </div>
      </div>

      <div v-if="errorMessage.type" class="text-xs text-[#c64545]">
        {{ errorMessage.type[0] }}
      </div>

      <div v-loading="visibleLoading" class="grid grid-cols-1 md:grid-cols-2 gap-6 pt-2">
        <div
          v-for="(dt, i) in data"
          :key="i"
          :class="[
            'bg-[#efe9de] rounded-xl p-5 border transition-all duration-200 cursor-pointer flex flex-col justify-between',
            form.type === dt.value ? 'border-[#cc785c] ring-2 ring-[#cc785c]/10' : 'border-[#e6dfd8] hover:border-[#6c6a64]'
          ]"
          @click="onSelectData(dt)"
        >
          <div class="flex justify-between items-start space-x-4">
            <div class="h-16 w-16 rounded-lg overflow-hidden bg-[#faf9f5] border border-[#e6dfd8] flex-shrink-0 flex items-center justify-center">
              <div
                v-if="dt.image"
                class="w-full h-full bg-cover bg-center"
                :style="`background-image: url(${themeImageThumbnailUrl + dt.image});`"
              ></div>
              <i v-else class="far fa-image text-[#8e8b82] text-xl"></i>
            </div>
            
            <div class="flex-1 min-w-0">
              <h3 class="text-base font-bold text-[#141413] truncate capitalize">{{ dt.title }}</h3>
              <p class="text-sm font-serif text-[#cc785c] mt-1">{{ dt.price }}</p>
            </div>

            <div>
              <el-button
                :type="form.type === dt.value ? 'primary' : 'default'"
                icon="el-icon-check"
                circle
                size="small"
                class="pointer-events-none"
              ></el-button>
            </div>
          </div>
        </div>
      </div>

      <div class="flex justify-between items-center pt-6 border-t border-[#e6dfd8]">
        <div class="text-xs text-[#6c6a64]">Total {{ totalRecord }} Paket</div>
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
