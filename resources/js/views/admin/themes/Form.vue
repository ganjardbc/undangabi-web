<template>
  <div id="form">
    <AppSideForm
      :title="title"
      :enableSaveButton="this.title !== 'VIEW' ? true : false"
      :onSave="onButtonSave"
      :onClose="onClose"
    >
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
        <div class="field-label">THEME ID</div>
        <input
          type="text"
          placeholder=""
          class="field field-sekunder"
          name="theme_id"
          id="theme_id"
          v-model="formData.theme_id"
          readonly
        />
        <div
          v-if="formMessage"
          class="fonts micro bold"
          style="color: red; margin-top: 5px"
        >
          {{ formMessage && formMessage.theme_id && formMessage.theme_id[0] }}
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
          class="fonts micro semibold"
          style="color: red; margin-top: 5px"
        >
          {{ formMessage && formMessage.name && formMessage.name[0] }}
        </div>
      </div>
      <div class="field-group margin margin-bottom-15-px">
        <div class="field-label">CATEGORY</div>
        <select
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
        <div
          v-if="formMessage"
          class="fonts micro bold"
          style="color: red; margin-top: 5px"
        >
          {{
            formMessage && formMessage.category_id && formMessage.category_id[0]
          }}
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
          class="fonts micro bold"
          style="color: red; margin-top: 5px"
        >
          {{
            formMessage && formMessage.description && formMessage.description[0]
          }}
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
          <div class="fonts micro black">Is this theme still available ?</div>
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
    </AppSideForm>

    <AppPopupForm
      v-if="visiblePopupProduct"
      :title="'Choose Product'"
      :onClose="onOpenProduct"
    >
      <div style="overflow-x: auto">
        <table>
          <thead>
            <th class="normal-col">PRODUCT ID</th>
            <th>NAME</th>
            <th class="small-col"></th>
          </thead>
          <tbody>
            <tr v-for="(dt, index) in dataProduct" :key="index">
              <td class="normal-col">{{ dt.product.product_id }}</td>
              <td>{{ dt.product.name }}</td>
              <td class="small-col">
                <button
                  v-if="formData.product_id !== dt.product.id"
                  class="btn btn-small-icon btn-sekunder"
                  @click="onChoose(dt, 'product')"
                >
                  <i class="fa fa-1x fa-plus"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </AppPopupForm>

    <AppPopupForm
      v-if="visiblePopupDetail"
      :title="'Choose Detail'"
      :onClose="onOpenDetail"
    >
      <div style="overflow-x: auto">
        <table>
          <thead>
            <th class="normal-col">DETAIL ID</th>
            <th>NAME</th>
            <th class="normal-col">PRICE</th>
            <th class="small-col"></th>
          </thead>
          <tbody>
            <tr v-for="(dt, index) in dataDetail" :key="index">
              <td class="normal-col">{{ dt.proddetail_id }}</td>
              <td>{{ dt.name }}</td>
              <td class="normal-col">{{ dt.price }}</td>
              <td class="small-col">
                <button
                  v-if="formData.proddetail_id !== dt.id"
                  class="btn btn-small-icon btn-sekunder"
                  @click="onChoose(dt, 'detail')"
                >
                  <i class="fa fa-1x fa-plus"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </AppPopupForm>

    <AppPopupForm
      v-if="visiblePopupToping"
      :title="'Choose Toping'"
      :onClose="onOpenToping"
    >
      <div style="overflow-x: auto">
        <table>
          <thead>
            <th class="normal-col">TOPING ID</th>
            <th>NAME</th>
            <th class="normal-col">PRICE</th>
            <th class="small-col"></th>
          </thead>
          <tbody>
            <tr v-for="(dt, index) in dataToping" :key="index">
              <td class="normal-col">{{ dt.toping_id }}</td>
              <td>{{ dt.name }}</td>
              <td class="normal-col">{{ dt.price }}</td>
              <td class="small-col">
                <button
                  v-if="formData.toping_id !== dt.id"
                  class="btn btn-small-icon btn-sekunder"
                  @click="onChoose(dt, 'toping')"
                >
                  <i class="fa fa-1x fa-plus"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </AppPopupForm>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import AppSideForm from '../../modules/AppSideForm'
import AppImage from '../../modules/AppImage'
import AppPopupForm from '../../modules/AppPopupForm'
import AppAlert from '../../modules/AppAlert'

const payload = {
  id: '',
  theme_id: '',
  name: '',
  description: '',
  status: 'active',
  is_available: 0,
  category_id: '',
}

export default {
  name: 'form',
  data() {
    return {
      visiblePopupToping: false,
      visiblePopupDetail: false,
      visiblePopupProduct: false,
      isView: false,
      image: '',
      formData: { ...payload },
      formMessage: [],
      dataCategory: [],
      dataProduct: [],
      dataDetail: [],
      dataToping: [],
    }
  },
  mounted() {
    this.formData = { ...payload }
  },
  components: {
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
  computed: {
    ...mapState({
      categories: (state) => state.customerCategory.data,
    }),
  },
  methods: {
    onTotal: function () {
      let qty = this.formData.quantity
      let price = this.formData.price
      let tpPrice = this.formData.toping_price
      let ttl = (tpPrice + price) * qty
      this.formData = {
        ...this.formData,
        subtotal: ttl,
      }
    },
    onOpenToping() {
      this.visiblePopupToping = !this.visiblePopupToping
    },
    onOpenDetail() {
      this.visiblePopupDetail = !this.visiblePopupDetail
    },
    onOpenProduct() {
      this.visiblePopupProduct = !this.visiblePopupProduct
    },
    onButtonSave() {
      const time = new Date().getTime()
      const newPayload =
        this.title === 'CREATE'
          ? {
              ...this.formData,
              theme_id: 'TH-' + time,
            }
          : { ...this.formData }
      this.onSave(newPayload)
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
  },
  watch: {
    data: function (props, prevProps) {
      if (props) {
        this.formData = {
          ...this.formData,
          id: props.id,
          theme_id: props.theme_id,
          name: props.name,
          description: props.description,
          status: props.status,
          is_available: props.is_available,
          category_id: props.category_id,
        }
        this.image = props.image
          ? this.themeImageThumbnailUrl + props.image
          : ''
      } else {
        this.formData = { ...payload }
        this.image = ''
      }
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
