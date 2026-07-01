<template>
  <div id="App" :class="formClass ? 'content-form' : 'content-form hide'">
    <div class="left">
      <div class="bg-white shadow-sm">
        <div
          class="flex flex-row justify-between items-center border-bottom p-4 padding-10-px"
          style="height: 40px"
        >
          <h1 class="small text-black">INVITATIONS</h1>
          <div class="flex">
            <button
              class="btn btn-white btn-icon btn-radius"
              @click="onShow('CREATE')"
            >
              <i class="fa fa-lw fa-plus" />
            </button>
            <SearchField
              :placeholder="'Search invitations ..'"
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
            <el-table-column label="Title">
              <template slot-scope="scope">
                <router-link
                  :to="{
                    name: 'generate-only',
                    params: {
                      id: scope.row.invitation.short_link,
                    },
                  }"
                  target="_blank"
                  class="text-[10px] font-semibold link text-gray-500"
                >
                  {{ scope.row.invitation.title }}
                </router-link>
              </template>
            </el-table-column>
            <el-table-column label="Theme">
              <template slot-scope="scope">
                <div>{{ scope.row.theme.name }}</div>
              </template>
            </el-table-column>
            <el-table-column label="Type" width="150">
              <template slot-scope="scope">
                <div style="text-transform: capitalize">
                  {{ scope.row.invitation.type }}
                </div>
              </template>
            </el-table-column>
            <el-table-column label="Privacy" width="150">
              <template slot-scope="scope">
                <div style="text-transform: capitalize">
                  {{ scope.row.invitation.privacy }}
                </div>
              </template>
            </el-table-column>
            <el-table-column label="Payment" width="150">
              <template slot-scope="scope">
                <span>{{
                  scope.row.invitation.payment_status ? 'Paid' : 'Unpaid'
                }}</span>
              </template>
            </el-table-column>
            <el-table-column label="Status" width="150">
              <template slot-scope="scope">
                <div class="flex">
                  <div
                    v-if="scope.row.invitation.is_free_trial"
                    :class="`card-capsule ${scope.row.invitation.is_free_trial ? 'wip' : 'active'}`"
                    style="text-transform: capitalize; line-height: 0.6"
                  >
                    {{
                      scope.row.invitation.is_free_trial ? 'Free Trial' : 'Pro'
                    }}
                    <span v-if="scope.row.invitation.exp_free_trial_date > 0">
                      <VueCountdown
                        :time="scope.row.invitation.exp_free_trial_date"
                        v-slot="{ days }"
                      >
                        <span> - {{ days }} Hari</span>
                      </VueCountdown>
                    </span>
                  </div>
                  <div
                    v-else
                    :class="`card-capsule ${scope.row.invitation.status === 'active' && 'active'}`"
                    style="text-transform: capitalize; line-height: 0.6"
                  >
                    {{ scope.row.invitation.status }}
                  </div>
                </div>
              </template>
            </el-table-column>
            <el-table-column width="100">
              <template slot-scope="scope">
                <el-popover placement="bottom-end" width="180" trigger="click">
                  <div class="width w-full">
                    <router-link
                      :to="`/download/invitation/receipt/${scope.row.invitation.invitation_id}`"
                      target="_blank"
                    >
                      <button class="btn btn-white btn-full btn-align-left">
                        <i class="icn icn-left fa fa-lw fa-receipt" /> Receipt
                      </button>
                    </router-link>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShow('VIEW', scope.row.invitation.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-align-left"></i> Detail
                    </button>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShow('EDIT', scope.row.invitation.id)"
                    >
                      <i class="icn icn-left fa fa-lw fa-edit"></i> Edit
                    </button>
                    <button
                      class="btn btn-white btn-full btn-align-left"
                      @click="onShowHideDelete(scope.row.invitation.id)"
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
        :listUser.sync="listUser"
        :message.sync="selectedMessage"
        :title="formTitle"
        :uploadImage="(data) => uploadImage(data)"
        :removeImage="removeImage"
        :onSave="(data) => onFormSave(data)"
        :onClose="onClose"
      >
      </Form>
    </div>

    <InvitationText
      v-if="visibleAlertInv"
      :data="selectedInv"
      :onClose="onShowHideInv"
    />

    <FormReceipt
      v-if="visibleFormReceipt"
      :data="selectedData"
      :onClose="onClosePrintReceipt"
    />

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
import moment from 'moment'
import VueCountdown from '@chenfengyuan/vue-countdown'
import axios from 'axios'
import { mapGetters, mapActions } from 'vuex'
import AppLoader from '../../../components/modules/AppLoader'
import AppAlert from '../../../components/modules/AppAlert'
import SearchField from '../../../components/modules/SearchField'
import AppButtonMenu from '../../../components/modules/AppButtonMenu'
import Form from './Form'
import InvitationText from './InvitationText'
import FormReceipt from './FormReceipt'

export default {
  name: 'App',
  data() {
    return {
      visibleFormReceipt: false,
      visibleAlertInv: false,
      visibleAlertDelete: false,
      visibleAlertSave: false,
      visibleLoader: false,
      visibleLoaderAction: false,
      formTitle: 'CREATE',
      formClass: false,
      datas: [],
      selectedInv: null,
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
      listUser: [],
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
    this.getData()
    this.getDataCategory()
    this.getDataUser()
  },
  components: {
    InvitationText,
    VueCountdown,
    AppAlert,
    AppLoader,
    AppButtonMenu,
    SearchField,
    Form,
    FormReceipt,
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      token: 'auth/token',
    }),
  },
  methods: {
    ...mapActions({
      getCategory: 'customerCategory/getData',
    }),
    getDataCategory() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCategory({ token: token, status: 'active' })
    },
    indexMethod(index) {
      return index + 1 + this.offset
    },
    handleCurrentChange(index) {
      this.currentPage = index
      this.offset = (index - 1) * this.limit
      this.getData()
    },
    nameLength(row) {
      return row.key.length
    },
    onSearch(value) {
      this.searchCriteria = value
      this.handleCurrentChange(1)
    },
    onSearchData(id) {
      let payload = null
      this.datas.map((dt) => {
        if (dt.invitation.id === id) {
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
    onShowHideInv(index = null) {
      this.selectedInv = index >= 0 ? this.onSearchData(index) : null
      this.visibleAlertInv = !this.visibleAlertInv
    },
    onShowPrintReceipt(index = null) {
      this.selectedData = index >= 0 ? this.onSearchData(index) : null
      this.visibleFormReceipt = true
    },
    onClosePrintReceipt() {
      this.visibleFormReceipt = false
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
    },
    onChangeImage(data) {
      this.selectedData = {
        ...this.selectedData,
        invitation: {
          ...this.selectedData.invitation,
          cover: data,
        },
      }
    },
    async removeData() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const id = this.onSearchData(this.selectedIndex).invitation.invitation_id
      const payload = {
        invitation_id: id,
      }

      const rest = await axios.post('/api/invitation/delete', payload, {
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
      const payload = this.selectedForm
      const url =
        this.formTitle === 'CREATE'
          ? '/api/invitation/post'
          : '/api/invitation/update'

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
      const payload = this.selectedData.invitation
      const url = '/api/invitation/uploadImage'

      let formData = new FormData()
      formData.append('invitation_id', payload.invitation_id)
      formData.append('cover', data)

      const rest = await axios.post(url, formData, {
        headers: {
          Authorization: token,
          'Content-Type': 'multipart/form-data',
        },
      })

      if (rest && rest.status === 200) {
        this.visibleLoaderAction = false

        const data = rest.data.data
        if (data && data.cover) {
          this.onChangeImage(data && data.cover)
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
      const payload = this.selectedData.invitation
      const url = '/api/invitation/removeImage'

      let formData = new FormData()
      formData.append('invitation_id', payload.invitation_id)

      var a = confirm('remove this cover ?')
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
          this.onChangeImage(data && data.cover)
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

      const rest = await axios.post('/api/invitation/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.totalPages = rest.data.total_record
        this.datas =
          data &&
          data.map((dt) => {
            const now = new Date()

            // Expire Date
            const crn_date = moment(dt.invitation.created_at).add(1, 'Y')
            const time = new Date(crn_date).getTime()
            const exp_date = time - now

            // Free Trial Date
            const free_trial_date = moment(dt.invitation.created_at).add(7, 'd')
            const time_free_trial = new Date(free_trial_date).getTime()
            const exp_free_trial_date = time_free_trial - now
            return {
              ...dt,
              invitation: {
                ...dt.invitation,
                exp_date: exp_date,
                exp_free_trial_date: exp_free_trial_date,
              },
            }
          })
        this.visibleLoader = false
      } else {
        this.visibleLoader = false
      }
    },
    async getDataUser() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
      }

      const rest = await axios.post('/api/user/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.listUser = data
      }
    },
  },
}
</script>
