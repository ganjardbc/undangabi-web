<template>
  <div id="BulkUpload" class="display-popup">
    <div class="card-alert shadow-sm post-middle">
      <div
        class="flex justify-between items-center margin mb-[15px]"
      >
        <div class="text-[11px] font-semibold">
          {{ label ? label : 'Reservasi Bulk Upload' }}
        </div>
        <button class="btn btn-icon btn-white" @click="onClose">
          <i class="fa fa-lg fa-times"></i>
        </button>
      </div>
      <div class="width w-full">
        <div v-if="invitationData" class="p-4 padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Invitation</div>
          <div class="micro text-black">{{ invitationData.title }}</div>
        </div>
        <div class="p-4 pb-[15px]">
          <div class="p-4 padding-top-10px padding-bottom-5px">
            <div class="text-[11px] font-semibold text-black">
              File (csv, xls, xlsx)
            </div>
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

          <div
            v-if="dataBride && dataBride.length > 0"
            class="p-4 padding-top-10px padding-bottom-5px"
          >
            <div class="text-[11px] font-semibold text-black">
              Special Invitation (optional)
            </div>
            <div class="micro text-black margin margin-bottom-10-px">
              Choose bride, if this invitation for specific bride guests.
            </div>
            <el-select
              v-model="formData.bride_id"
              placeholder="Select bride"
              style="width: 100%"
              clearable
            >
              <el-option
                v-for="(item, index) in dataBride"
                :key="index"
                :label="`${item.bride.name}`"
                :value="item.bride.id"
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
import { mapGetters, mapState } from 'vuex'
import AppAlert from '../../../../components/modules/AppAlert'

export default {
  data() {
    return {
      visibleLoaderAction: false,
      formData: {
        bride_id: '',
        file: '',
      },
      formMessage: null,
      dataUser: null,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
  },
  components: {
    AppAlert,
  },
  props: {
    label: {
      default: null,
    },
  },
  computed: {
    ...mapState({
      dataBride: (state) => state.customerReservationLists.bride.data,
    }),
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
  },
  methods: {
    onReset() {
      this.formData = {
        bride_id: '',
        file: '',
      }
    },
    onSave() {
      this.uploadFile()
    },
    onClose() {
      this.$emit('onClose')
    },
    onSuccess() {
      this.$emit('onSuccess')
    },
    previewFiles(event) {
      const file = event.target.files[0]
      this.formData.file = file
    },
    async uploadFile() {
      this.visibleLoaderAction = true

      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = this.formData

      let formData = new FormData()
      formData.append('invitation_id', this.invitationData.id)
      formData.append('bride_id', payload.bride_id)
      formData.append('file', payload.file)

      const rest = await axios.post(
        '/api/reservationLists/bulkUpload',
        formData,
        {
          headers: {
            Authorization: token,
            'Content-Type': 'multipart/form-data',
          },
        }
      )

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
  },
}
</script>
