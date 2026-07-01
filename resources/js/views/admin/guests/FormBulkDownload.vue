<template>
  <div id="BulkUpload" class="display-popup">
    <div class="card-alert box-shadow post-middle">
      <div class="display-flex justify-content align-center">
        <div style="width: 100%">
          <div class="fonts micro semibold">
            {{ label ? label : 'Guest Bulk Download' }}
          </div>
        </div>
        <button class="btn btn-small-icon btn-white" @click="onClose">
          <i class="fa fa-lg fa-times"></i>
        </button>
      </div>
      <div>
        <div style="padding-top: 15px; padding-bottom: 15px">
          <div class="field-group">
            <div class="field-label">INVITATION ID</div>
            <el-select
              v-model="formData.invitation_id"
              placeholder="Choose invitation"
              style="width: 100%"
              clearable
            >
              <el-option
                v-for="(item, index) in dataInvitation"
                :key="index"
                :label="`${item.invitation_id} : ${item.title}`"
                :value="item.invitation_id"
              >
              </el-option>
            </el-select>
            <div
              v-if="formMessage"
              class="fonts micro bold"
              style="color: red; margin-top: 5px"
            >
              {{ formMessage && formMessage.file && formMessage.file[0] }}
            </div>
          </div>
        </div>
        <div class="display-flex justify-content">
          <button
            :disabled="!formData.invitation_id"
            class="btn btn-main btn-full margin margin-right-5-px"
            @click="onSave"
          >
            Download File
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
import AppAlert from '../../modules/AppAlert'

export default {
  data() {
    return {
      visibleLoaderAction: false,
      formData: {
        invitation_id: '',
      },
      formMessage: null,
      dataInvitation: null,
      dataUser: null,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
    this.getData()
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
  },
  methods: {
    onReset() {
      this.formData = {
        invitation_id: '',
      }
    },
    onSave() {
      this.downloadFile()
    },
    async downloadFile() {
      let url = '/download/guest/export/' + this.formData.invitation_id
      let routeData = this.$router.resolve({ path: url })
      window.open(routeData.href, '_blank')
    },
    async getData() {
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
  },
}
</script>
