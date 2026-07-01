<template>
  <div id="App" class="margin margin-top-15px">
    <div class="bg-white">
      <div v-if="dataTheme" class="width w-full">
        <div class="fonts-14 font-semibold text-black">Tema Sekarang</div>
        <div class="width w-full p-4 pt-[15px]">
          <div class="card bg-white shadow-sm">
            <div class="flex items-center">
              <div class="width width-55px margin margin-right-15px">
                <div
                  class="image image-padding bg-grey"
                  :style="`background-image: url(${themeImageThumbnailUrl + dataTheme.image});`"
                >
                  <i
                    v-if="!dataTheme.image"
                    class="post-middle-absolute fa fa-lg fa-image"
                  ></i>
                </div>
              </div>
              <div style="width: calc(100% - 100px)">
                <div class="text-[11px] font-semibold text-black">
                  {{ dataTheme.name }}
                </div>
                <div class="text-[10px] normal text-gray-500">
                  {{ dataTheme.description }}
                </div>
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
          <div class="fonts-14 font-semibold text-black">Daftar Tema</div>
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
            <div class="flex justify-end">
              <button
                v-if="form.theme_id === dt.id"
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
      getCustomerTheme: 'customerTheme/getData',
      resetFilterTheme: 'customerTheme/resetFilter',
      setPagination: 'customerTheme/setPagination',
    }),
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerTheme({ token })
    },
    onSelectData(value) {
      this.form.theme_id = value
    },
    handleCurrentChange(value) {
      this.setPagination(value)
      this.getData()
    },
  },
}
</script>
