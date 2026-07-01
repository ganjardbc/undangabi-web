<template>
  <div id="App" class="w-full space-y-6">
    <div class="bg-white rounded-xl border border-gray-200/80 p-5 shadow-sm space-y-4">
      <div class="flex justify-between items-center">
        <div class="text-xl font-bold text-gray-900">Daftar Undangan</div>
      </div>
      <div class="w-full">
        <el-input
          placeholder="Cari undangan"
          v-model="formFilter.search"
          class="subject-input-with-select"
          @input="handleFilterSearch"
          clearable
        >
          <el-button
            slot="append"
            icon="el-icon-search"
            @click="getData"
          ></el-button>
        </el-input>
      </div>
    </div>

    <div v-loading="visibleLoading">
      <Card :data.sync="data" />
    </div>

    <div class="w-full flex justify-between items-center pt-4 border-t border-gray-150">
      <div class="text-xs text-gray-500 font-medium">Total {{ totalRecord }}</div>
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

    <div class="relative w-full h-[70px]">
      <div class="fixed max-w-7xl w-[calc(100%-32px)] bottom-4 left-1/2 -translate-x-1/2 z-40">
        <div
          class="bg-white/95 backdrop-blur-md border border-gray-200/80 shadow-md rounded-xl flex items-center p-3"
        >
          <!-- <Create class="width w-full" /> -->
          <router-link
            :to="{ name: 'customer-create-invitation' }"
            class="w-full inline-flex items-center justify-center bg-amber-400 hover:bg-amber-500 text-gray-900 font-semibold py-2.5 px-6 rounded-full shadow-sm transition duration-150 no-underline"
          >
            <i class="fa fa-lg fa-plus-circle mr-2"></i> Buat Undangan
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState, mapActions } from 'vuex'
import AppLoader from '../../components/modules/AppLoader'
import Card from './Card'
import Create from './Create'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Daftar Undangan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      dataUser: null,
      currentPage: 0,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
    this.resetFilter()
    this.getData()
  },
  components: {
    AppLoader,
    Card,
    Create,
  },
  computed: {
    ...mapState({
      data: (state) => state.customerInvitation.data,
      formFilter: (state) => state.customerInvitation.filter,
      visibleLoading: (state) => state.customerInvitation.loading,
      visibleLoadMore: (state) => state.customerInvitation.loadMore,
      totalRecord: (state) => state.customerInvitation.totalRecord,
      limit: (state) => state.customerInvitation.limit,
      offset: (state) => state.customerInvitation.offset,
    }),
  },
  methods: {
    ...mapActions({
      getCustomerInvitation: 'customerInvitation/getData',
      resetFilter: 'customerInvitation/resetFilter',
      setPagination: 'customerInvitation/setPagination',
    }),
    getData() {
      const token = `Bearer ${this.$cookies.get('token')}`
      const role = this.$cookies.get('role')
      this.getCustomerInvitation({
        id: this.dataUser.id,
        role: role.role_name,
        token: token,
      })
    },
    handleCurrentChange(value) {
      this.setPagination(value)
      this.getData()
    },
    handleFilterSearch() {
      this.currentPage = 1
      this.handleCurrentChange(1)
    },
  },
}
</script>
