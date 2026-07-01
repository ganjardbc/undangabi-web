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
          <div class="field-label">EVENT ID</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="event_id"
            id="event_id"
            v-model="formData.event_id"
            readonly
          />
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.event_id && formMessage.event_id[0] }}
          </div>
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
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.title && formMessage.title[0] }}
          </div>
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
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.day && formMessage.day[0] }}
          </div>
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
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.date && formMessage.date[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">TIME</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="time"
            id="time"
            v-model="formData.time"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.time && formMessage.time[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">TIME ZONE</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="time_zone"
            id="time_zone"
            v-model="formData.time_zone"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage && formMessage.time_zone && formMessage.time_zone[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">STREAMING LINK</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="streaming_link"
            id="streaming_link"
            v-model="formData.streaming_link"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="micro font-semibold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.streaming_link &&
              formMessage.streaming_link[0]
            }}
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
          <div class="field-label">DESCRIPTION</div>
          <textarea
            name="description"
            id="description"
            class="field field-sekunder field-textarea"
            v-model="formData.description"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.description &&
              formMessage.description[0]
            }}
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
            <div class="micro text-black">Is this event still available ?</div>
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
import FormSong from '../songs/FormSong'

const tabs = [
  { id: 1, label: 'Data', status: 'active' },
  { id: 2, label: 'Invitation', status: '' },
]

const payload = {
  id: '',
  event_id: '',
  title: '',
  description: '',
  day: '',
  date: '',
  time: '',
  time_zone: '',
  address: '',
  streaming_link: '',
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
      dataInvitation: null,
    }
  },
  mounted() {
    this.formData = { ...payload }
    this.getDataCategory()
  },
  components: {
    FormSong,
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
              event_id: 'EV-' + time,
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
  },
  watch: {
    data: function (props, prevProps) {
      if (props) {
        this.formData = {
          ...this.formData,
          id: props.event.id,
          event_id: props.event.event_id,
          title: props.event.title,
          description: props.event.description,
          day: props.event.day,
          date: props.event.date,
          time: props.event.time,
          time_zone: props.event.time_zone,
          address: props.event.address,
          streaming_link: props.event.streaming_link,
          status: props.event.status,
          is_available: props.event.is_available,
          invitation_id: props.event.invitation_id,
        }
        this.image = props.event.image
          ? this.eventImageThumbnailUrl + props.event.image
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
