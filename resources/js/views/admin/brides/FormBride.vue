<template>
  <div id="FormBride">
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">BRIDE ID</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="bride_id"
        id="bride_id"
        v-model="formData.bride_id"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">NAME</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="name"
        id="name"
        v-model="formData.name"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">STATUS</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="status"
        id="status"
        v-model="formData.status"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">ABOUT</div>
      <textarea
        name="about"
        id="about"
        class="field field-sekunder field-textarea"
        v-model="formData.about"
        readonly
      ></textarea>
    </div>

    <AppPopupForm
      v-if="visiblePopup"
      :title="'Choose Invitation'"
      :onClose="onClose"
    >
      <div style="overflow-x: auto">
        <table>
          <thead>
            <th class="normal-col">BRIDE ID</th>
            <th>NAME</th>
            <th class="small-col"></th>
          </thead>
          <tbody>
            <tr v-for="(dt, index) in datas" :key="index">
              <td class="normal-col">{{ dt.bride_id }}</td>
              <td>{{ dt.name }}</td>
              <td class="small-col">
                <button
                  v-if="formData.id !== dt.id"
                  class="btn btn-small-icon btn-sekunder"
                  @click="onChoose(dt)"
                >
                  <i class="fa fa-1x fa-plus"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </AppPopupForm>

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
      :title="'Choose this data ?'"
      :onClose="onShowHideSave"
      :onSave="saveData"
    />
  </div>
</template>

<script>
import axios from 'axios'
import AppPopupForm from '../../../components/modules/AppPopupForm'
import AppAlert from '../../../components/modules/AppAlert'

const payload = {
  id: '',
  bride_id: '',
  title: '',
  description: '',
  day: '',
  date: '',
  type: '',
  status: '',
  is_available: 0,
  theme_id: '',
  song_id: '',
}

export default {
  name: 'FormBride',
  data() {
    return {
      visibleAlertDelete: false,
      visibleAlertSave: false,
      visibleLoader: false,
      visibleLoaderAction: false,
      visiblePopup: false,
      selectedID: 0,
      formData: null,
      datas: [],
      formMessage: [],
      payload: { ...payload },
      dataUser: null,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
    this.formData = this.data ? { ...this.data } : { ...payload }
    this.getData()
  },
  components: {
    AppPopupForm: AppPopupForm,
    AppAlert: AppAlert,
  },
  props: {
    onChange: {
      type: Function,
      requred: true,
    },
    enablePopup: {
      type: Boolean,
      requred: false,
    },
    data: {
      requred: true,
    },
  },
  methods: {
    onShowHideDelete(index = null) {
      this.visibleAlertDelete = !this.visibleAlertDelete
      this.payload = this.datas[index] ? this.datas[index] : payload
      this.formMessage = []
    },
    onShowHideSave() {
      this.visibleAlertSave = !this.visibleAlertSave
      this.formMessage = []
    },
    onChoose: function (index) {
      this.visibleAlertSave = !this.visibleAlertSave
      this.selectedID = index
      this.formMessage = []
    },
    onClose: function () {
      this.visiblePopup = false
      this.payload = { ...payload }
    },
    saveData: function () {
      this.onChange(this.selectedID)
      this.onShowHideSave()
      this.visiblePopup = false
    },
    async getData() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
        user_id: this.dataUser.id,
      }
      const rest = await axios.post('/api/bride/getAll', payload, {
        headers: { Authorization: token },
      })
      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.datas =
          data &&
          data.map((dt) => {
            return { ...dt.bride }
          })
      }
    },
  },
  watch: {
    data: function (props, prevProps) {
      if (props) {
        this.formData = props
      } else {
        this.formData = { ...payload }
      }
    },
    enablePopup: function (props, prevProps) {
      if (!this.visiblePopup) {
        this.visiblePopup = true
      } else {
        this.visiblePopup = false
      }
    },
  },
}
</script>
