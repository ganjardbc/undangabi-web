<template>
  <div id="FormInvitation">
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">INVITATION ID</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="invitation_id"
        id="invitation_id"
        v-model="formData.invitation_id"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">SHORT LINK</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="short_link"
        id="short_link"
        v-model="formData.short_link"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">TITLE</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="title"
        id="title"
        v-model="formData.title"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">DAY</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="day"
        id="day"
        v-model="formData.day"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">DATE</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="date"
        id="date"
        v-model="formData.date"
        readonly
      />
    </div>
    <div class="field-group margin margin-bottom-15-px">
      <div class="field-label">TYPE</div>
      <input
        type="text"
        placeholder=""
        class="field field-sekunder"
        name="type"
        id="type"
        v-model="formData.type"
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
      <div class="field-label">DESCRIPTION</div>
      <textarea
        name="description"
        id="description"
        class="field field-sekunder field-textarea"
        v-model="formData.description"
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
            <th class="normal-col">INVITATION ID</th>
            <th>TITLE</th>
            <th class="small-col"></th>
          </thead>
          <tbody>
            <tr v-for="(dt, index) in datas" :key="index">
              <td class="normal-col">{{ dt.invitation_id }}</td>
              <td>{{ dt.title }}</td>
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
  invitation_id: '',
  short_link: '',
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
  name: 'FormInvitation',
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
      const rest = await axios.post('/api/invitation/getAll', payload, {
        headers: { Authorization: token },
      })
      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.datas =
          data &&
          data.map((dt) => {
            return { ...dt.invitation }
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
