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
          <div class="field-label">PARENT ID</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="parent_id"
            id="parent_id"
            v-model="formData.parent_id"
            readonly
          />
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage && formMessage.parent_id && formMessage.parent_id[0]
            }}
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
            <div class="micro text-black">
              Is this parent still available ?
            </div>
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
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">ABOUT</div>
          <textarea
            name="about"
            id="about"
            class="field field-sekunder field-textarea"
            v-model="formData.about"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.about && formMessage.about[0] }}
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
              name="bride_id"
              id="bride_id"
              v-model="formData.bride_id"
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
              name="bride_id"
              id="bride_id"
              v-model="formData.bride_id"
              readonly
            />
          </div>
          <div
            v-if="formMessage"
            class="micro font-bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.bride_id && formMessage.bride_id[0] }}
          </div>
        </div>
        <FormBride
          :data.sync="dataBride"
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
import FormBride from '../brides/FormBride'
import FormSong from '../songs/FormSong'

const tabs = [
  { id: 1, label: 'Data', status: 'active' },
  { id: 2, label: 'Bride', status: '' },
]

const payload = {
  id: '',
  parent_id: '',
  name: '',
  about: '',
  status: 'active',
  is_available: 0,
  bride_id: '',
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
      dataBride: null,
    }
  },
  mounted() {
    this.formData = { ...payload }
    this.getDataCategory()
  },
  components: {
    FormSong,
    FormBride,
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
              parent_id: 'PR-' + time,
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
        bride_id: data.id,
      }
      this.dataBride = data
    },
    onChoose(data, type) {
      console.log('data', data)
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
          id: props.parent.id,
          parent_id: props.parent.parent_id,
          name: props.parent.name,
          about: props.parent.about,
          status: props.parent.status,
          is_available: props.parent.is_available,
          bride_id: props.parent.bride_id,
        }
        this.image = props.parent.image
          ? this.parentImageThumbnailUrl + props.parent.image
          : ''
        this.dataBride = props.bride
      } else {
        this.formData = { ...payload }
        this.image = ''
        this.dataBride = null
      }
      this.onChangeTabs(0)
    },
    message: function (props, prevProps) {
      if (props) {
        this.formMessage = props
      } else {
        this.formMessage = []
      }
      console.log('props', props)
    },
  },
}
</script>
