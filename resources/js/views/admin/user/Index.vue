<template>
  <div id="App" :class="formClass ? 'content-form' : 'content-form hide'">
    <div class="left">
      <div class="bg-white shadow-sm">
        <div
          class="flex flex-row justify-between items-center border-bottom p-4 padding-10-px"
          style="height: 40px"
        >
          <h1 class="small text-black">USERS</h1>
          <div class="flex">
            <button
              class="btn btn-white btn-icon btn-radius"
              @click="onShow('CREATE')"
            >
              <i class="fa fa-lw fa-plus" />
            </button>
            <SearchField
              :placeholder="'Search users ..'"
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
            <el-table-column label="Name">
              <template slot-scope="scope">
                <div>{{ scope.row.name }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Username">
              <template slot-scope="scope">
                <div>{{ scope.row.username }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Email">
              <template slot-scope="scope">
                <div>{{ scope.row.email }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Status" width="150">
              <template slot-scope="scope">
                <div class="flex">
                  <div
                    :class="`card-capsule ${scope.row.status === 'active' && 'active'}`"
                    style="text-transform: capitalize; line-height: 0.6"
                  >
                    {{ scope.row.status }}
                  </div>
                </div>
              </template>
            </el-table-column>
            <el-table-column width="100">
              <template slot-scope="scope">
                <el-popover placement="bottom-end" width="180" trigger="click">
                  <div class="width w-full">
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShow('VIEW', scope.row.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-align-left"></i> Detail
                    </button>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShow('EDIT', scope.row.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-edit"></i> Edit
                    </button>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShowHideDelete(scope.row.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-trash-alt"></i> Delete
                    </button>
                  </div>
                  <button
                    slot="reference"
                    class="btn btn-sekunder btn-icon margin margin-left-10px"
                  >
                    <i class="fa fa-lw fa-ellipsis-h"></i>
                  </button>
                </el-popover>
              </template>
            </el-table-column>
          </el-table>

          <!-- <v-table 
                        :data="datas ? datas : []" 
                        :filters="filters" 
                        :currentPage.sync="currentPage" 
                        :pageSize="limitPage" 
                        @totalPagesChanged="totalPages = $event">
                        <thead slot="head">
                            <v-th class="small-col hide-icon">NO</v-th>
                            <v-th sortKey="name">Name</v-th>
                            <v-th sortKey="email">Email</v-th>
                            <v-th sortKey="username">Username</v-th>
                            <v-th sortKey="status" class="normal-col">Status</v-th>
                            <th class="medium-col"></th>
                        </thead>
                        <tbody slot="body" slot-scope="{displayData}">
                            <tr v-for="(row, index) in displayData" :key="index">
                                <td class="small-col">{{ (index + 1) }}</td>
                                <td>{{ row.name }}</td>
                                <td>{{ row.email }}</td>
                                <td>{{ row.username }}</td>
                                <td class="normal-col">
                                    <div 
                                        :class="'card-capsule ' + (row.status === 'active' ? 'active' : '')" 
                                        style="text-transform: capitalize; display: inline-block; padding-top: 2px; padding-bottom: 2px;">
                                        {{ row.status }}
                                    </div>
                                </td>
                                <td class="medium-col">
                                    <div class="flex justify-content">
                                        <button class="btn btn-transparent btn-small-icon btn-radius" @click="onShow('EDIT', row.id)">
                                            <i class="fa fa-lw fa-pencil-alt" />
                                        </button>
                                        <button class="btn btn-transparent btn-small-icon btn-radius" @click="onShowHideDelete(row.id)">
                                            <i class="fa fa-lw fa-trash-alt" />
                                        </button>
                                        <button class="btn btn-transparent btn-small-icon btn-radius" @click="onShow('VIEW', row.id)">
                                            <i class="fa fa-lw fa-ellipsis-v" />
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </v-table> -->
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
        :role.sync="roles"
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
      roles: [],
      selectedIndex: null,
      selectedData: null,
      selectedMessage: null,
      filters: {
        name: { value: '', keys: ['name'] },
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
    this.getDataRole()
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
      const id = this.onSearchData(this.selectedIndex).id
      const payload = {
        id: id,
      }

      const rest = await axios.post('/api/user/delete', payload, {
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
        this.formTitle === 'CREATE' ? '/api/user/post' : '/api/user/update'

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
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: this.limit,
        offset: this.offset,
        search: this.searchCriteria,
      }

      const rest = await axios.post('/api/user/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.totalPages = rest.data.total_record
        this.datas = data
      }
    },
    async getDataRole() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
        status: 'active',
      }

      const rest = await axios.post('/api/role/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.roles = data
      }
    },
  },
}
</script>
