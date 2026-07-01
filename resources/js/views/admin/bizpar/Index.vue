<template>
  <div id="App" :class="formClass ? 'content-form' : 'content-form hide'">
    <div class="left">
      <div class="bg-white shadow-sm">
        <div
          class="flex flex-row justify-between items-center border-bottom p-4 padding-10-px"
          style="height: 40px"
        >
          <h1 class="small text-black">BIZPARS</h1>
          <div class="flex">
            <el-button
              type="primary"
              icon="el-icon-plus"
              circle
              @click="onShow('CREATE')"
            ></el-button>
            <SearchField
              :value="filters.key.value"
              :placeholder="'Search bizpars ..'"
              style="width: 280px; margin-left: 10px"
              @onSearch="onSearch"
            />
          </div>
        </div>

        <div class="table-container">
          <el-table
            :data="datas ? datas : []"
            empty-text="No Data"
            style="width: 100%"
          >
            <el-table-column type="index" width="60" :index="indexMethod">
            </el-table-column>
            <el-table-column label="Key">
              <template slot-scope="scope">
                <div>{{ scope.row.key }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Value">
              <template slot-scope="scope">
                <div>{{ scope.row.value }}</div>
              </template>
            </el-table-column>
            <el-table-column width="100">
              <template slot-scope="scope">
                <el-popover placement="bottom-end" width="180" trigger="click">
                  <div class="width w-full">
                    <el-button
                      type="text"
                      icon="el-icon-info"
                      class="w-full text-left"
                      style="justify-content: flex-start; display: flex; padding: 8px 12px; margin: 0;"
                      @click="onShow('VIEW', scope.row.id)"
                    >
                      Detail
                    </el-button>
                    <el-button
                      type="text"
                      icon="el-icon-edit"
                      class="w-full text-left"
                      style="justify-content: flex-start; display: flex; padding: 8px 12px; margin: 0;"
                      @click="onShow('EDIT', scope.row.id)"
                    >
                      Edit
                    </el-button>
                    <el-button
                      type="text"
                      icon="el-icon-delete"
                      class="w-full text-left text-red-600 hover:text-red-500"
                      style="justify-content: flex-start; display: flex; padding: 8px 12px; margin: 0; color: #f56c6c;"
                      @click="onShowHideDelete(scope.row.id)"
                    >
                      Delete
                    </el-button>
                  </div>
                  <el-button
                    slot="reference"
                    icon="el-icon-more"
                    circle
                    size="small"
                    class="margin margin-left-10px"
                  ></el-button>
                </el-popover>
              </template>
            </el-table-column>
          </el-table>
        </div>

        <div
          class="p-4 padding-10-px flex items-center justify-end"
          style="height: 40px"
        >
          <div class="text-[10px] font-semibold text-gray-500">Total {{ totalPages }}</div>
          <el-pagination
            background
            @current-change="handleCurrentChange"
            :current-page.sync="currentPage"
            :page-size.sync="limit"
            :pager-count="5"
            layout="prev, pager, next"
            :total.sync="totalPages"
          >
          </el-pagination>
        </div>
      </div>
    </div>

    <div class="right">
      <Form
        :data.sync="selectedData"
        :message.sync="selectedMessage"
        :title="formTitle"
        :onSave="(data) => onFormSave(data)"
        :onClose="onClose"
      >
      </Form>
    </div>

    <AppAlert
      v-if="visibleAlertDelete"
      :isLoader="visibleLoaderAction"
      :title="'This action will remove data permanently, delete this data ?'"
      :onClose="onShowHideDelete"
      :onSave="removeData"
    />

    <AppAlert
      v-if="visibleAlertSave"
      :isLoader="visibleLoaderAction"
      :title="'Proceed this data ?'"
      :onClose="onShowHideSave"
      :onSave="saveData"
    />
  </div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import AppLoader from '../../../components/modules/AppLoader'
import AppAlert from '../../../components/modules/AppAlert'
import SearchField from '../../../components/modules/SearchField'
import AppButtonMenu from '../../../components/modules/AppButtonMenu'
import Form from './Form'

export default {
  name: 'App',
  data() {
    return {
      visibleAlertDelete: false,
      visibleAlertSave: false,
      visibleLoader: false,
      visibleLoaderAction: false,
      formTitle: 'CREATE',
      formClass: false,
      datas: [],
      selectedIndex: null,
      selectedData: null,
      selectedMessage: null,
      filters: {
        key: { value: '', keys: ['key'] },
        value: { value: '', keys: ['value'] },
        type: { value: '', keys: ['type'] },
      },
      searchCriteria: '',
      limit: 10,
      offset: 0,
      limitPage: 30,
      currentPage: 1,
      totalPages: 0,
    }
  },
  mounted() {
    this.getData()
  },
  components: {
    AppAlert,
    AppLoader,
    AppButtonMenu,
    SearchField,
    Form,
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      token: 'auth/token',
    }),
  },
  methods: {
    indexMethod(index) {
      return index + 1 + this.offset
    },
    handleCurrentChange(index) {
      this.currentPage = index
      this.offset = (index - 1) * this.limit
      this.getData()
    },
    onSearch(value) {
      this.searchCriteria = value
      this.handleCurrentChange(1)
    },
    totalPagesChanged(data) {
      this.totalPages = data
    },
    nameLength(row) {
      return row.key.length
    },
    onSearchData(id) {
      let payload = null
      this.datas.map((dt) => {
        if (dt.id === id) {
          payload = { ...dt }
        }
        return null
      })
      return payload
    },
    onSave() {
      this.visibleAlertDelete = false
      this.visibleAlertSave = false
      this.formClass = false
    },
    onClose() {
      this.formClass = false
    },
    onShow(title, index = null) {
      this.formClass = true
      this.formTitle = title
      this.selectedData = index >= 0 ? this.onSearchData(index) : null
      this.selectedMessage = null
    },
    onShowHideDelete(index = null) {
      this.visibleAlertDelete = !this.visibleAlertDelete
      this.selectedIndex = index
    },
    onShowHideSave() {
      this.visibleAlertSave = !this.visibleAlertSave
    },
    onFormSave(data = null) {
      this.onShowHideSave()
      this.selectedData = data ? data : null
    },
    async removeData() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const bizparId = this.onSearchData(this.selectedIndex).key
      const payload = {
        key: bizparId,
      }

      const rest = await axios.post('/api/bizpar/delete', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        this.onShowHideDelete()
        this.onClose()
        this.visibleLoaderAction = false

        const data = rest.data
        if (data.status === 'ok') {
          this.getData()
        } else {
          alert('Proceed failed')
        }
      } else {
        alert('Proceed failed')
        this.visibleLoaderAction = false
      }
    },
    async saveData() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = this.selectedData
      const url =
        this.formTitle === 'CREATE' ? '/api/bizpar/post' : '/api/bizpar/update'

      const rest = await axios.post(url, payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        this.onShowHideSave()
        this.visibleLoaderAction = false

        const data = rest.data.data
        if (data.length !== 0) {
          this.onClose()
          this.getData()
        } else {
          this.selectedMessage = rest.data.message
        }
      } else {
        alert('Proceed failed')
        this.visibleLoaderAction = false
      }
    },
    async getData() {
      this.visibleLoader = true
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: this.limit,
        offset: this.offset,
        search: this.searchCriteria,
      }

      const rest = await axios.post('/api/bizpar/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.totalPages = rest.data.total_record
        this.datas = data
        this.visibleLoader = false
      } else {
        this.visibleLoader = false
      }
    },
  },
}
</script>
