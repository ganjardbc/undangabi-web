<template>
  <div id="App" class="space-y-6">
    <div class="bg-[#faf9f5] rounded-xl p-6 border border-[#e6dfd8] space-y-4">
      <div class="border-b border-[#e6dfd8] pb-3 flex justify-between items-center">
        <div>
          <h2 class="text-xl font-serif text-[#141413]">Pilih Tema Undangan</h2>
          <p class="text-xs text-[#6c6a64] mt-1">Pilih desain tema visual yang cocok untuk hari bahagia Anda.</p>
        </div>
      </div>

      <div v-if="errorMessage.theme_id" class="text-xs text-[#c64545]">
        {{ errorMessage.theme_id[0] }}
      </div>

      <div v-loading="visibleLoading" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 pt-2">
        <div
          v-for="(dt, i) in data"
          :key="i"
          :class="[
            'bg-[#efe9de] rounded-xl overflow-hidden border transition-all duration-200 cursor-pointer flex flex-col justify-between shadow-sm',
            form.theme_id === dt.id ? 'border-[#cc785c] ring-2 ring-[#cc785c]/10' : 'border-[#e6dfd8] hover:border-[#6c6a64]'
          ]"
          @click="onSelectData(dt)"
        >
          <!-- Image Section -->
          <div class="h-44 w-full bg-gray-100 relative overflow-hidden">
            <div
              v-if="dt.image"
              class="w-full h-full bg-cover bg-center transition-transform duration-300 hover:scale-105"
              :style="`background-image: url(${themeImageThumbnailUrl + dt.image});`"
            ></div>
            <div v-else class="w-full h-full flex items-center justify-center">
              <i class="far fa-image text-[#8e8b82] text-3xl"></i>
            </div>
            
            <div class="absolute top-3 right-3">
              <el-button
                :type="form.theme_id === dt.id ? 'primary' : 'default'"
                icon="el-icon-check"
                circle
                size="small"
                class="pointer-events-none"
              ></el-button>
            </div>
          </div>

          <!-- Description Section -->
          <div class="p-4 flex-1 flex flex-col justify-between">
            <div>
              <h3 class="text-sm font-bold text-[#141413] capitalize">{{ dt.name }}</h3>
              <p class="text-xs text-[#6c6a64] mt-1 line-clamp-2">{{ dt.description || 'Tidak ada deskripsi.' }}</p>
            </div>
          </div>
        </div>
      </div>

      <div class="flex justify-between items-center pt-6 border-t border-[#e6dfd8]">
        <div class="text-xs text-[#6c6a64]">Total {{ totalRecord }} Tema</div>
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
    this.resetFilterTheme()
    this.getData()
  },
  components: {
    AppLoader,
  },
  computed: {
    ...mapGetters({
      themeLoading: 'customerTheme/loading',
    }),
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      selectedRaw: (state) => state.customerInvitation.selectedRaw,
      data: (state) => state.customerTheme.data,
      totalRecord: (state) => state.customerTheme.totalRecord,
      limit: (state) => state.customerTheme.limit,
      offset: (state) => state.customerTheme.offset,
      visibleLoading: (state) => state.customerTheme.loading,
      visibleLoadMore: (state) => state.customerTheme.loadMore,
    }),
    dataTheme() {
      return this.selectedRaw && this.selectedRaw.theme
    },
  },
  methods: {
    ...mapActions({
      onChangeTheme: 'customerInvitation/onChangeTheme',
      getCustomerTheme: 'customerTheme/getData',
      resetFilterTheme: 'customerTheme/resetFilter',
      setPagination: 'customerTheme/setPagination',
    }),
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerTheme({ token })
    },
    onSelectData(data) {
      this.form.theme_id = data.id
      this.onChangeTheme(data)
    },
    handleCurrentChange(value) {
      this.setPagination(value)
      this.getData()
    },
  },
}
</script>
