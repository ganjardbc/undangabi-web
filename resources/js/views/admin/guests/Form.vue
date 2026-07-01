<template>
  <div id="form">
    <AppSideForm
      :title="title"
      :enableSaveButton="this.title !== 'VIEW' ? true : false"
      :onSave="onButtonSave"
      :onClose="onClose"
    >
      <AppTabs
        :selectedIndex="selectedIndex"
        :data="tabs"
        :isFull="true"
        :onChange="(data) => onChangeTabs(data)"
        class="margin margin-bottom-15-px"
      />

      <div v-if="selectedIndex === 0">
        <div
          v-if="this.title !== 'CREATE' ? true : false"
          class="field-group margin margin-bottom-15-px"
        >
          <div class="field-label">IMAGE</div>
          <AppImage
            :image.sync="image"
            :isEnable="this.title !== 'VIEW' ? true : false"
            :onUpload="(data) => uploadImage(data)"
            :onRemove="removeImage"
          />
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.image && formMessage.image[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">ID</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="id"
            id="id"
            v-model="formData.id"
            readonly
          />
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">GUEST ID</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="guest_id"
            id="guest_id"
            v-model="formData.guest_id"
            readonly
          />
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.guest_id && formMessage.guest_id[0] }}
          </div>
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
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.name && formMessage.name[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">ADDRESS</div>
          <textarea
            name="address"
            id="address"
            class="field field-sekunder field-textarea"
            v-model="formData.address"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.address && formMessage.address[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">COMMENTS</div>
          <textarea
            name="comments"
            id="comments"
            class="field field-sekunder field-textarea"
            v-model="formData.comments"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.comments && formMessage.comments[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">PRESENT</div>
          <div class="micro text-black margin margin-bottom-10-px">
            Is this guest will present ?
          </div>
          <select
            class="cf-input slc slc-sekunder"
            name="present_type"
            id="present_type"
            v-model="formData.present_type"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in dataPresent"
              :value="ctr.value"
              :key="index"
            >
              {{ ctr.label }}
            </option>
          </select>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.present_type &&
              formMessage.present_type[0]
            }}
          </div>
        </div>
        <div
          v-if="
            formData.present_type === 'present' ||
            formData.present_type === 'will-present'
          "
          class="field-group margin margin-bottom-15-px"
        >
          <div class="field-label">ATTENDANCE</div>
          <div class="micro text-black margin margin-bottom-10-px">
            How many people will attendance ?
          </div>
          <select
            class="cf-input slc slc-sekunder"
            name="attendance"
            id="attendance"
            v-model="formData.attendance"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in dataAttendance"
              :value="ctr.value"
              :key="index"
            >
              {{ ctr.label }}
            </option>
          </select>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage && formMessage.attendance && formMessage.attendance[0]
            }}
          </div>
        </div>
        <div
          v-if="
            formData.present_type === 'present' ||
            formData.present_type === 'will-present'
          "
          class="field-group margin margin-bottom-15-px"
        >
          <div class="field-label">RSVP</div>
          <select
            class="cf-input slc slc-sekunder"
            name="rsvp"
            id="rsvp"
            v-model="formData.rsvp"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in dataBizpar"
              :value="ctr.value"
              :key="index"
            >
              {{ ctr.description }}
            </option>
          </select>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.rsvp && formMessage.rsvp[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-25-px">
          <div class="field-label">STATUS</div>
          <div class="flex">
            <label class="radio">
              <input
                type="radio"
                name="status"
                id="active"
                value="active"
                v-model="formData.status"
                :readonly="this.title === 'VIEW' ? true : false"
              />
              <span class="checkmark" />
              <span class="micro"> Active </span>
            </label>

            <label class="radio">
              <input
                type="radio"
                name="status"
                id="inactive"
                value="inactive"
                v-model="formData.status"
                :readonly="this.title === 'VIEW' ? true : false"
              />
              <span class="checkmark" />
              <span class="micro"> Inactive </span>
            </label>
          </div>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.status && formMessage.status[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">AVAILABLE</div>
          <div class="flex justify-between">
            <div class="micro text-black">Is this guest still available ?</div>
            <label class="switch green">
              <input
                type="checkbox"
                name="is_available"
                id="is_available"
                v-model="formData.is_available"
                :readonly="this.title === 'VIEW' ? true : false"
              />
              <span class="slider round" />
            </label>
          </div>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.is_available &&
              formMessage.is_available[0]
            }}
          </div>
        </div>
      </div>

      <div v-if="selectedIndex === 1">
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">ID</div>
          <div v-if="this.title !== 'VIEW'" class="card-search full">
            <input
              type="search"
              placeholder=""
              class="field"
              name="invitation_id"
              id="invitation_id"
              v-model="formData.invitation_id"
              readonly
            />
            <button class="btn btn-icon btn-white" @click="onButtonInvitation">
              <i class="fa fa-1x fa-search" />
            </button>
          </div>
          <div v-else>
            <input
              type="search"
              placeholder=""
              class="field field-sekunder"
              style="width: 100%"
              name="invitation_id"
              id="invitation_id"
              v-model="formData.invitation_id"
              readonly
            />
          </div>
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
        <FormInvitation
          :data.sync="dataInvitation"
          :enablePopup="visiblePopupInvitation"
          :onChange="(data) => onChangeInvitation(data)"
        />
      </div>
    </AppSideForm>
  </div>
</template>

<script>
import axios from 'axios'
import AppTabs from '../../../components/modules/AppTabs'
import AppSideForm from '../../../components/modules/AppSideForm'
import AppImage from '../../../components/modules/AppImage'
import AppPopupForm from '../../../components/modules/AppPopupForm'
import AppAlert from '../../../components/modules/AppAlert'
import FormInvitation from '../invitations/FormInvitation'

const tabs = [
  { id: 1, label: 'Data', status: 'active' },
  { id: 2, label: 'Invitation', status: '' },
]

const payload = {
  id: '',
  guest_id: '',
  name: '',
  phone: '',
  address: '',
  comments: '',
  attendance: 0,
  present_type: '',
  rsvp: '',
  is_present: '',
  status: 'active',
  is_available: 0,
  invitation_id: '',
}

export default {
  name: 'form',
  data() {
    return {
      visiblePopupInvitation: false,
      selectedIndex: 0,
      isView: false,
      tabs: tabs,
      image: '',
      formData: { ...payload },
      formMessage: [],
      dataCategory: [],
      dataBizpar: [],
      dataPresent: [
        { value: 'present', label: 'Present' },
        { value: 'will-present', label: 'Will Present' },
        { value: 'not-present', label: 'Not Present' },
        { value: 'waiting-response', label: 'Waiting Response' },
      ],
      dataAttendance: [
        { value: '1', label: '1 Person' },
        { value: '2', label: '2 Persons' },
        { value: '3', label: '3 Persons' },
      ],
      dataInvitation: null,
    }
  },
  mounted() {
    this.formData = { ...payload }
    this.getDataCategory()
    this.getDataBizpar()
  },
  components: {
    FormInvitation,
    AppTabs,
    AppAlert,
    AppPopupForm,
    AppSideForm,
    AppImage,
  },
  props: {
    data: {
      required: true,
    },
    message: {
      required: false,
    },
    title: {
      type: String,
      required: true,
    },
    uploadImage: {
      type: Function,
      required: false,
    },
    removeImage: {
      type: Function,
      required: false,
    },
    onSave: {
      type: Function,
      required: true,
    },
    onClose: {
      type: Function,
      required: true,
    },
  },
  methods: {
    onChangeTabs(data) {
      this.selectedIndex = data
    },
    onButtonSave() {
      const time = new Date().getTime()
      const newPayload =
        this.title === 'CREATE'
          ? {
              ...this.formData,
              guest_id: 'GE-' + time,
            }
          : { ...this.formData }
      this.onSave(newPayload)
    },
    onButtonInvitation() {
      this.visiblePopupInvitation = !this.visiblePopupInvitation
    },
    onChangeInvitation(data) {
      this.formData = {
        ...this.formData,
        invitation_id: data.id,
      }
      this.dataInvitation = data
    },
    onChoose(data, type) {
      switch (type) {
        case 'product':
          this.onOpenProduct()
          this.dataDetail = data.details
          this.dataToping = data.topings
          this.formData = {
            ...this.formData,
            product_name: data.product.name,
            product_id: data.product.id,
            product_detail: '',
            proddetail_id: 0,
            price: 0,
            product_toping: '',
            toping_id: '',
            toping_price: '',
            quantity: 0,
            subtotal: 0,
          }
          break
        case 'detail':
          this.onOpenDetail()
          this.formData = {
            ...this.formData,
            product_detail: data.name,
            proddetail_id: data.id,
            price: data.price,
          }
          break
        case 'toping':
          this.onOpenToping()
          this.formData = {
            ...this.formData,
            product_toping: data.name,
            toping_id: data.id,
            toping_price: data.price,
          }
          break
        default:
          this.onOpenProduct()
          break
      }
      this.onTotal()
    },
    async getDataCategory() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
        status: 'active',
      }

      const rest = await axios.post('/api/category/getAll', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.dataCategory = data
      }
    },
    async getDataBizpar() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
        type: 'rsvp',
      }

      const rest = await axios.post('/api/bizpar/getByType', payload, {
        headers: { Authorization: token },
      })

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.dataBizpar = data
      }
    },
  },
  watch: {
    data: function (props, prevProps) {
      if (props) {
        this.formData = {
          ...this.formData,
          id: props.guest.id,
          guest_id: props.guest.guest_id,
          name: props.guest.name,
          phone: props.guest.phone,
          address: props.guest.address,
          comments: props.guest.comments,
          attendance: props.guest.attendance,
          present_type: props.guest.present_type,
          rsvp: props.guest.rsvp,
          is_present: props.guest.is_present,
          status: props.guest.status,
          is_available: props.guest.is_available,
          invitation_id: props.guest.invitation_id,
        }
        this.image = props.guest.image
          ? this.guestImageThumbnailUrl + props.guest.image
          : ''
        this.dataInvitation = props.invitation
      } else {
        this.formData = { ...payload }
        this.image = ''
        this.dataInvitation = null
      }
      this.onChangeTabs(0)
    },
    message: function (props, prevProps) {
      if (props) {
        this.formMessage = props
      } else {
        this.formMessage = []
      }
    },
  },
}
</script>
