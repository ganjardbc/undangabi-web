<template>
  <div id="App" class="w-full space-y-6 bg-[#faf9f5]">
    <!-- Header Area -->
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center border-b border-[#e6dfd8] space-y-4 md:space-y-0">
      <div>
        <h1 class="text-3xl font-serif text-[#141413] tracking-tight">Daftar Undangan</h1>
        <p class="text-sm text-[#6c6a64] mt-1">Kelola dan lihat daftar undangan digital Anda di sini.</p>
      </div>
      <router-link
        :to="{ name: 'customer-create-invitation' }"
        class="inline-flex items-center justify-center bg-[#cc785c] hover:bg-[#a9583e] text-white font-medium py-2.5 px-6 rounded-lg shadow-sm transition duration-150 no-underline text-sm"
      >
        <i class="fa fa-plus mr-2"></i> Buat Undangan Baru
      </router-link>
    </div>

    <!-- Filter & Search Panel -->
    <div class="w-full">
      <el-input
        placeholder="Cari undangan..."
        v-model="formFilter.search"
        @input="handleFilterSearch"
        clearable
        class="custom-search-input"
      >
        <el-button
          slot="append"
          icon="el-icon-search"
          @click="getData"
          class="bg-[#cc785c] text-white border-none"
        ></el-button>
      </el-input>
    </div>

    <!-- Cards List -->
    <div v-loading="visibleLoading">
      <Card :data.sync="data" />
    </div>

    <!-- Pagination -->
    <div class="w-full flex flex-col sm:flex-row justify-between items-center border-t border-[#e6dfd8] space-y-4 sm:space-y-0">
      <div class="text-sm text-[#6c6a64]">Menampilkan <span class="font-semibold text-[#141413]">{{ totalRecord }}</span> undangan</div>
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
