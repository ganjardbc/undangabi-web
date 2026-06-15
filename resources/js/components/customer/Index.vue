<template>
  <div
    id="App"
    class="main-screen padding padding-top-15px padding-bottom-15px"
  >
    <div class="padding padding-left-15px padding-right-15px">
      <div class="display-flex space-between align-center">
        <div class="fonts fonts-22 semibold black">Daftar Undangan</div>
      </div>
      <div class="width width-100 padding padding-top-15px padding-bottom-15px">
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
    <div
      class="width width-100 display-flex flex-end align-center padding padding-top-15px"
    >
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
    <div class="app-main-footer">
      <div class="app-main-footer-center">
        <div
          class="app-main-footer-container bg-white box-shadow display-flex align-center"
        >
          <!-- <Create class="width width-100" /> -->
          <router-link
            :to="{ name: 'customer-create-invitation' }"
            class="btn btn-main btn-div"
          >
            <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Buat Undangan
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState, mapActions } from 'vuex'
import AppLoader from '../modules/AppLoader'
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
