<template>
  <div id="App" :class="formClass ? 'content-form' : 'content-form hide'">
    <div class="left">
      <div class="bg-white shadow-sm">
        <div
          class="flex flex-row justify-between items-center border-bottom p-4 padding-10-px"
          style="height: 40px"
        >
          <h1 class="small text-black">DIGITAL GITS</h1>
          <div class="flex">
            <button
              class="btn btn-white btn-icon btn-radius"
              @click="onShow('CREATE')"
            >
              <i class="fa fa-lw fa-plus" />
            </button>
            <SearchField
              :placeholder="'Search digital gits ..'"
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
                <div>{{ scope.row.comment.name }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Invitation">
              <template slot-scope="scope">
                <div>{{ scope.row.invitation.title }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Status" width="150">
              <template slot-scope="scope">
                <div class="flex">
                  <div
                    :class="`card-capsule ${scope.row.comment.status === 'active' && 'active'}`"
                    style="text-transform: capitalize; line-height: 0.6"
                  >
                    {{ scope.row.comment.status }}
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
                      @click="onShow('VIEW', scope.row.comment.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-align-left"></i> Detail
                    </button>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShow('EDIT', scope.row.comment.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-edit"></i> Edit
                    </button>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShowHideDelete(scope.row.comment.id)"
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
        :uploadImage="(data) => uploadImage(data)"
        :removeImage="removeImage"
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
      selectedForm: null,
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
      dataUser: null,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
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
    nameLength(row) {
      return row.key.length
    },
    onSearchData(id) {
      let payload = null
      this.datas.map((dt) => {
        if (dt.comment.id === id) {
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
      this.selectedForm = data ? data : null
      console.log('onFormSave', data)
    },
    onChangeImage(data) {
      this.selectedData = {
        ...this.selectedData,
        comment: {
          ...this.selectedData.comment,
          image: data,
        },
      }
    },
    async removeData() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const id = this.onSearchData(this.selectedIndex).comment.comment_id
      const payload = {
        comment_id: id,
      }

      const rest = await axios.post('/api/comment/delete', payload, {
        headers: { Authorization: token },
      })
      console.log('rest', rest)

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
      const payload = this.selectedForm
      const url =
        this.formTitle === 'CREATE'
          ? '/api/comment/post'
          : '/api/comment/update'

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
    async uploadImage(data) {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = this.selectedData.comment
      const url = '/api/comment/uploadImage'

      let formData = new FormData()
      formData.append('comment_id', payload.comment_id)
      formData.append('image', data)

      const rest = await axios.post(url, formData, {
        headers: {
          Authorization: token,
          'Content-Type': 'multipart/form-data',
        },
      })

      if (rest && rest.status === 200) {
        this.visibleLoaderAction = false

        const data = rest.data.data
        if (data && data.image) {
          this.onChangeImage(data && data.image)
          this.getData()
          this.selectedMessage = []
        } else {
          this.selectedMessage = rest.data.message
        }
      } else {
        alert('Proceed failed')
      }
    },
    async removeImage() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = this.selectedData.comment
      const url = '/api/comment/removeImage'

      let formData = new FormData()
      formData.append('comment_id', payload.comment_id)

      var a = confirm('remove this image ?')
      if (a) {
        const rest = await axios.post(url, formData, {
          headers: {
            Authorization: token,
            'Content-Type': 'multipart/form-data',
          },
        })

        if (rest && rest.status === 200) {
          this.visibleLoaderAction = false

          const data = rest.data.data
          this.onChangeImage(data && data.image)
          this.getData()
        } else {
          alert('Proceed failed')
        }
      }
    },
    async getData() {
      this.visibleLoader = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      let payload = {
        limit: this.limit,
        offset: this.offset,
        search: this.searchCriteria,
      }

      if (this.dataUser.role_name !== 'admin') {
        payload.user_id = this.dataUser.id
      }

      const rest = await axios.post('/api/comment/getAll', payload, {
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
