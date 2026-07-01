<template>
  <div id="App" class="margin margin-top-15px">
    <div class="bg-white">
      <div v-if="dataTheme" class="width width-100">
        <div class="fonts fonts-14 semibold black">Tema Sekarang</div>
        <div class="width width-100 padding padding-top-15px">
          <div class="card bg-white box-shadow">
            <div class="display-flex align-center">
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
                <div class="fonts fonts-11 semibold black">
                  {{ dataTheme.name }}
                </div>
                <div class="fonts fonts-10 normal grey">
                  {{ dataTheme.description }}
                </div>
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
          <div class="fonts fonts-14 semibold black">Daftar Tema</div>
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
