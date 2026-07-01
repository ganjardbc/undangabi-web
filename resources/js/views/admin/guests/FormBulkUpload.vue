<template>
  <div id="BulkUpload" class="display-popup">
    <div class="card-alert shadow-sm post-middle">
      <div class="flex justify-content items-center">
        <div style="width: 100%">
          <div class="micro font-semibold">
            {{ label ? label : 'Guest Bulk Upload' }}
          </div>
        </div>
        <button class="btn btn-small-icon btn-white" @click="onClose">
          <i class="fa fa-lg fa-times"></i>
        </button>
      </div>
      <div>
        <div style="padding-top: 15px; padding-bottom: 15px">
          <div class="field-group margin margin-bottom-15-px">
            <div class="field-label">INVITATION</div>
            <el-select
              v-model="formData.invitation_id"
              placeholder="Choose invitation"
              style="width: 100%"
              clearable
              @change="onChangeInvitationId"
            >
              <el-option
                v-for="(item, index) in dataInvitation"
                :key="index"
                :label="`${item.title}`"
                :value="item.id"
              >
              </el-option>
            </el-select>
            <div
              v-if="formMessage"
              class="micro font-bold"
              style="color: red; margin-top: 5px"
            >
              {{
                formMessage &&
                formMessage.invitation_id &&
                formMessage.invitation_id[0]
              }}
            </div>
          </div>

          <div class="field-group margin margin-bottom-15-px">
            <div class="field-label">BRIDE (optional)</div>
            <el-select
              v-model="formData.bride_id"
              placeholder="Choose bride"
              style="width: 100%"
              clearable
            >
              <el-option
                v-for="(item, index) in dataBride"
                :key="index"
                :label="`${item.name}`"
                :value="item.id"
              >
              </el-option>
            </el-select>
            <div
              v-if="formMessage"
              class="micro font-bold"
              style="color: red; margin-top: 5px"
            >
              {{
                formMessage && formMessage.bride_id && formMessage.bride_id[0]
              }}
            </div>
          </div>

          <div class="field-group">
            <div class="field-label">FILE (csv, xls, xlsx)</div>
            <input
              type="file"
              placeholder=""
              name="file"
              id="file"
              ref="file"
              accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
              @change="previewFiles"
            />
            <div
              v-if="formMessage"
              class="micro font-bold"
              style="color: red; margin-top: 5px"
            >
              {{ formMessage && formMessage.file && formMessage.file[0] }}
            </div>
          </div>
        </div>
        <div class="flex justify-content">
          <button
            class="btn btn-main btn-full margin margin-right-5-px"
            @click="onSave"
          >
            Upload File
          </button>
          <button
            class="btn btn-grey btn-full margin margin-left-5-px"
            @click="onClose"
          >
            Cancel
          </button>
        </div>
      </div>
    </div>

    <AppAlert v-if="visibleLoaderAction" :isLoader="true" />
  </div>
</template>
<script>
import axios from 'axios'
import AppAlert from '../../../components/modules/AppAlert'

export default {
  data() {
    return {
      visibleLoaderAction: false,
      formData: {
        invitation_id: '',
        bride_id: '',
        file: '',
      },
      formMessage: null,
      dataInvitation: null,
      dataUser: null,
      dataBride: null,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
    this.getDataInvitation()
    // this.getDataBride()
  },
  components: {
    AppAlert,
  },
  props: {
    label: {
      default: null,
    },
    onClose: {
      default: null,
    },
    onSuccess: {
      default: null,
    },
  },
  methods: {
    onReset() {
      this.formData = {
        invitation_id: '',
        file: '',
      }
    },
    onSave() {
      this.uploadFile()
    },
    previewFiles(event) {
      const file = event.target.files[0]
      this.formData.file = file
    },
    findInvitation(id) {
      return this.dataInvitation.find((item) => item.id === id)
    },
    onChangeInvitationId() {
      this.getDataBride()
    },
    async uploadFile() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = this.formData
      const url = '/api/guest/bulkUpload'

      let formData = new FormData()
      formData.append('invitation_id', payload.invitation_id)
      formData.append('bride_id', payload.bride_id)
      formData.append('file', payload.file)

      const rest = await axios.post(url, formData, {
        headers: {
          Authorization: token,
          'Content-Type': 'multipart/form-data',
        },
      })

      if (rest && rest.status === 200) {
        this.visibleLoaderAction = false

        const data = rest.data.data
        if (data) {
          this.onClose()
          this.onReset()
          this.onSuccess()
          this.formMessage = []
        } else {
          this.formMessage = rest.data.message
        }
      } else {
        alert('Proceed failed')
      }
    },
    async getDataInvitation() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
      }
      const rest = await axios.post('/api/invitation/getAll', payload, {
        headers: { Authorization: token },
      })
      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.dataInvitation =
          data &&
          data.map((dt) => {
            return { ...dt.invitation }
          })
      }
    },
    async getDataBride() {
      this.visibleLoader = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const invitation = this.findInvitation(this.formData.invitation_id)
      let payload = {
        limit: 1000,
        offset: 0,
        search: '',
        invitation_id: invitation ? invitation.invitation_id : '',
      }

      const rest = await axios.post('/api/bride/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.dataBride =
          data &&
          data.map((dt) => {
            return { ...dt.bride, invitation: dt.invitation }
          })
      }
    },
  },
}
</script>
