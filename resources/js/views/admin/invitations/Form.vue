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
            class="fonts micro bold"
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
          <div
            v-if="formMessage"
            class="fonts micro bold"
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
          <div class="field-label">OWNER ID</div>
          <select
            v-if="this.title !== 'VIEW'"
            class="cf-input slc slc-sekunder"
            name="user_id"
            id="user_id"
            v-model="formData.user_id"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in listUser"
              :value="ctr.id"
              :key="index"
            >
              {{ ctr.name }}
            </option>
          </select>
          <input
            v-else
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="user_id"
            id="user_id"
            v-model="formData.user_id"
            readonly
          />
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.user_id && formMessage.user_id[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">KATEGORI</div>
          <select
            v-if="this.title !== 'VIEW'"
            class="cf-input slc slc-sekunder"
            name="category_id"
            id="category_id"
            v-model="formData.category_id"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in categories"
              :value="ctr.id"
              :key="index"
            >
              {{ ctr.name }}
            </option>
          </select>
          <input
            v-else
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="category_id"
            id="category_id"
            v-model="formData.category_id"
            readonly
          />
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.category_id &&
              formMessage.category_id[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">PRIVACY</div>
          <select
            v-if="this.title !== 'VIEW'"
            class="cf-input slc slc-sekunder"
            name="privacy"
            id="privacy"
            v-model="formData.privacy"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in privacyList"
              :value="ctr.value"
              :key="index"
            >
              {{ ctr.label }}
            </option>
          </select>
          <input
            v-else
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="privacy"
            id="privacy"
            v-model="formData.privacy"
            readonly
          />
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.privacy && formMessage.privacy[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">TYPE</div>
          <select
            v-if="this.title !== 'VIEW'"
            class="cf-input slc slc-sekunder"
            name="type"
            id="type"
            v-model="formData.type"
            :readonly="this.title === 'VIEW' ? true : false"
          >
            <option
              v-for="(ctr, index) in dataBizpar"
              :value="ctr.value"
              :key="index"
            >
              {{ ctr.value }}
            </option>
          </select>
          <input
            v-else
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="type"
            id="type"
            v-model="formData.type"
            readonly
          />
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.type && formMessage.type[0] }}
          </div>
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
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage && formMessage.short_link && formMessage.short_link[0]
            }}
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
            class="fonts micro semibold"
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
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.day && formMessage.day[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">DATE (YYYY-MM-DD)</div>
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
            class="fonts micro semibold"
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
            class="fonts micro semibold"
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
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage && formMessage.time_zone && formMessage.time_zone[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">LATITUDE</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="latitude"
            id="latitude"
            v-model="formData.latitude"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.latitude && formMessage.latitude[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">LONGITUDE</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="longitude"
            id="longitude"
            v-model="formData.longitude"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage && formMessage.longitude && formMessage.longitude[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">TAG</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="tag"
            id="tag"
            v-model="formData.tag"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.tag && formMessage.tag[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">DESCRIPTION / ADDRESS</div>
          <textarea
            name="description"
            id="description"
            class="field field-sekunder field-textarea"
            v-model="formData.description"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.description &&
              formMessage.description[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">YOUTUBE EMBEDED</div>
          <textarea
            name="video"
            id="video"
            class="field field-sekunder field-textarea"
            v-model="formData.video"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.video && formMessage.video[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">NOTE</div>
          <textarea
            name="note"
            id="note"
            class="field field-sekunder field-textarea"
            v-model="formData.note"
            :readonly="this.title === 'VIEW' ? true : false"
          ></textarea>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.note && formMessage.note[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-25-px">
          <div class="field-label">STATUS</div>
          <div class="display-flex">
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
              <span class="fonts micro"> Active </span>
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
              <span class="fonts micro"> Inactive </span>
            </label>
          </div>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.status && formMessage.status[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">AVAILABLE</div>
          <div class="display-flex space-between">
            <div class="fonts micro black">
              Is this invitation still available ?
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
            class="fonts micro bold"
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
          <div class="field-label">FREE TRIAL</div>
          <div class="display-flex space-between">
            <div class="fonts micro black">
              Is this invitation still free trial ?
            </div>
            <label class="switch green">
              <input
                type="checkbox"
                name="is_free_trial"
                id="is_free_trial"
                v-model="formData.is_free_trial"
                :readonly="this.title === 'VIEW' ? true : false"
              />
              <span class="slider round" />
            </label>
          </div>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.is_free_trial &&
              formMessage.is_free_trial[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">GUEST BOOK</div>
          <div class="display-flex space-between">
            <div class="fonts micro black">Is this reservation enable ?</div>
            <label class="switch green">
              <input
                type="checkbox"
                name="is_reservation_enable"
                id="is_reservation_enable"
                v-model="formData.is_reservation_enable"
                :readonly="this.title === 'VIEW' ? true : false"
              />
              <span class="slider round" />
            </label>
          </div>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.is_reservation_enable &&
              formMessage.is_reservation_enable[0]
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
              name="theme_id"
              id="theme_id"
              v-model="formData.theme_id"
              readonly
            />
            <button class="btn btn-icon btn-white" @click="onButtonTheme">
              <i class="fa fa-1x fa-search" />
            </button>
          </div>
          <div v-else>
            <input
              type="search"
              placeholder=""
              class="field field-sekunder"
              style="width: 100%"
              name="theme_id"
              id="theme_id"
              v-model="formData.theme_id"
              readonly
            />
          </div>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.theme_id && formMessage.theme_id[0] }}
          </div>
        </div>
        <FormTheme
          :data.sync="dataTheme"
          :enablePopup="visiblePopupTheme"
          :onChange="(data) => onChangeTheme(data)"
        />
      </div>

      <div v-if="selectedIndex === 2">
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">ID</div>
          <div v-if="this.title !== 'VIEW'" class="card-search full">
            <input
              type="search"
              placeholder=""
              class="field"
              name="song_id"
              id="song_id"
              v-model="formData.song_id"
              readonly
            />
            <button class="btn btn-icon btn-white" @click="onButtonSong">
              <i class="fa fa-1x fa-search" />
            </button>
          </div>
          <div v-else>
            <input
              type="search"
              placeholder=""
              class="field field-sekunder"
              style="width: 100%"
              name="song_id"
              id="song_id"
              v-model="formData.song_id"
              readonly
            />
          </div>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.song_id && formMessage.song_id[0] }}
          </div>
        </div>
        <FormSong
          :data.sync="dataSong"
          :enablePopup="visiblePopupSong"
          :onChange="(data) => onChangeSong(data)"
        />
      </div>

      <div v-if="selectedIndex === 3">
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">PRICE</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="price"
            id="price"
            v-model="formData.price"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.price && formMessage.price[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">DISCOUNT</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="discount"
            id="discount"
            v-model="formData.discount"
            :readonly="this.title === 'VIEW' ? true : false"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{ formMessage && formMessage.discount && formMessage.discount[0] }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">TOTAL PRICE</div>
          <input
            type="text"
            placeholder=""
            class="field field-sekunder"
            name="total_price"
            id="total_price"
            v-model="onTotalPrice"
            :readonly="true"
          />
          <div
            v-if="formMessage"
            class="fonts micro semibold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.total_price &&
              formMessage.total_price[0]
            }}
          </div>
        </div>
        <div class="field-group margin margin-bottom-15-px">
          <div class="field-label">PAYMENT STATUS</div>
          <div class="display-flex space-between">
            <div class="fonts micro black">Is this payment paid ?</div>
            <label class="switch green">
              <input
                type="checkbox"
                name="payment_status"
                id="payment_status"
                v-model="formData.payment_status"
                :readonly="this.title === 'VIEW' ? true : false"
              />
              <span class="slider round" />
            </label>
          </div>
          <div
            v-if="formMessage"
            class="fonts micro bold"
            style="color: red; margin-top: 5px"
          >
            {{
              formMessage &&
              formMessage.payment_status &&
              formMessage.payment_status[0]
            }}
          </div>
        </div>
      </div>
    </AppSideForm>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import axios from 'axios'
import AppTabs from '../../modules/AppTabs'
import AppSideForm from '../../modules/AppSideForm'
import AppImage from '../../modules/AppImage'
import AppPopupForm from '../../modules/AppPopupForm'
import AppAlert from '../../modules/AppAlert'
import FormTheme from '../themes/FormTheme'
import FormSong from '../songs/FormSong'

const tabs = [
  { id: 1, label: 'Data', status: 'active' },
  { id: 2, label: 'Theme', status: '' },
  { id: 3, label: 'Song', status: '' },
  { id: 4, label: 'Payment', status: '' },
]

const payload = {
  id: '',
  invitation_id: '',
  short_link: '',
  title: '',
  description: '',
  day: '',
  date: '',
  time: '',
  time_zone: '',
  latitude: '',
  longitude: '',
  tag: '',
  note: '',
  type: '',
  status: 'active',
  is_available: 0,
  is_free_trial: 0,
  is_reservation_enable: 0,
  theme_id: '',
  song_id: '',
  category_id: '',
  price: 0,
  discount: 0,
  total_price: 0,
  payment_status: 0,
}

export default {
  name: 'form',
  data() {
    return {
      visiblePopupTheme: false,
      visiblePopupSong: false,
      selectedIndex: 0,
      isView: false,
      tabs: tabs,
      image: '',
      formData: { ...payload },
      formMessage: [],
      dataCategory: [],
      dataTheme: null,
      dataSong: null,
      dataBizpar: [],
    }
  },
  mounted() {
    this.formData = { ...payload }
    this.getDataBizpar()
  },
  components: {
    FormSong,
    FormTheme,
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
    listUser: {
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
  computed: {
    ...mapState({
      privacyList: (state) => state.customerInvitation.privacyList,
      categories: (state) => state.customerCategory.data,
    }),
    onTotalPrice() {
      const totalPrice = this.formData.price - this.formData.discount
      this.formData.total_price = totalPrice
      return totalPrice
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
              invitation_id: 'IV-' + time,
            }
          : { ...this.formData }
      this.onSave(newPayload)
    },
    onButtonTheme() {
      this.visiblePopupTheme = !this.visiblePopupTheme
    },
    onButtonSong() {
      this.visiblePopupSong = !this.visiblePopupSong
    },
    onChangeTheme(data) {
      this.formData = {
        ...this.formData,
        theme_id: data.id,
      }
    },
    onChangeSong(data) {
      this.formData = {
        ...this.formData,
        song_id: data.id,
      }
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
    async getDataBizpar() {
      const token = 'Bearer '.concat(this.$cookies.get('token'))
      const payload = {
        limit: 1000,
        offset: 0,
        type: 'packet',
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
          id: props.invitation.id,
          invitation_id: props.invitation.invitation_id,
          short_link: props.invitation.short_link,
          title: props.invitation.title,
          description: props.invitation.description,
          video: props.invitation.video,
          day: props.invitation.day,
          date: props.invitation.date,
          time: props.invitation.time,
          time_zone: props.invitation.time_zone,
          latitude: props.invitation.latitude,
          longitude: props.invitation.longitude,
          tag: props.invitation.tag,
          note: props.invitation.note,
          type: props.invitation.type,
          privacy: props.invitation.privacy,
          status: props.invitation.status,
          is_available: props.invitation.is_available,
          is_free_trial: props.invitation.is_free_trial,
          is_reservation_enable: props.invitation.is_reservation_enable,
          theme_id: props.invitation.theme_id,
          song_id: props.invitation.song_id,
          category_id: props.invitation.category_id,
          price: props.invitation.price,
          discount: props.invitation.discount,
          total_price: props.invitation.total_price,
          payment_status: props.invitation.payment_status,
          user_id: props.invitation.user_id,
        }
        this.image = props.invitation.cover
          ? this.invitationImageThumbnailUrl + props.invitation.cover
          : ''
        this.dataTheme = props.theme
        this.dataSong = props.song
      } else {
        this.formData = { ...payload }
        this.image = ''
        this.dataTheme = null
        this.dataSong = null
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
