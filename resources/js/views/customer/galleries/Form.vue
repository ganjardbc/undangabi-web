<template>
  <div id="App">
    <AppSideFormPopup
      :title="titleForm"
      :enableSaveButton="visibleSaveButton"
      :visibleForm="visibleForm"
      @onSave="onSave"
      @onClose="onClose"
    >
      <div class="width width-100">
        <div v-if="typeForm !== 'create'" class="padding padding-bottom-15px">
          <div
            class="width width-150px width-center padding padding-bottom-15px"
          >
            <div
              class="image image-padding bg-grey"
              :style="`background-image: url(${galleryImageThumbnailUrl + formData.image});`"
            >
              <i
                v-if="!formData.image"
                class="post-middle-absolute fa fa-lg fa-image"
              ></i>
            </div>
          </div>
          <div class="display-flex center">
            <button class="btn btn-sekunder" @click="onUpdateCover(formData)">
              <i class="icn icn-left fa fa-lg fa-camera"></i> Ubah Cover
            </button>
          </div>
        </div>
        <div class="padding padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            ID Galeri <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.gallery_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.gallery_id" class="fonts fonts-12px red">
            {{ formMessage.gallery_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Tipe <span class="fonts red">*</span>
          </div>
          <el-select
            v-model="formData.type"
            placeholder="Pilih tipe"
            :disabled="!visibleSaveButton"
            style="width: 100%"
          >
            <el-option
              v-for="(item, index) in dataType"
              :key="index"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
          <div v-if="formMessage" class="fonts fonts-12px red">
            {{ formMessage && formMessage.type && formMessage.type[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Deskripsi <span class="fonts red">*</span>
          </div>
          <el-input
            type="textarea"
            v-model="formData.description"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.description" class="fonts fonts-12px red">
            {{ formMessage.description[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Status</div>
          <div
            v-if="visibleSaveButton"
            class="padding padding-top-15px display-flex"
          >
            <label class="radio">
              <input
                type="radio"
                name="status"
                id="active"
                value="active"
                v-model="formData.status"
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
              />
              <span class="checkmark" />
              <span class="fonts micro"> Inactive </span>
            </label>
          </div>
          <el-input
            v-if="!visibleSaveButton"
            placeholder=""
            :value="formData.status === 'active' ? 'Active' : 'Inactive'"
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.status" class="fonts fonts-12px red">
            {{ formMessage.status[0] }}
          </div>
        </div>
      </div>
    </AppSideFormPopup>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import AppSideFormPopup from '../../modules/AppSideFormPopup'

export default {
  name: 'App',
  data() {
    return {}
  },
  props: {
    visibleForm: false,
    typeForm: {
      type: String,
      default: 'create',
    },
  },
  mounted() {},
  components: {
    AppSideFormPopup,
  },
  computed: {
    ...mapState({
      formData: (state) => state.customerGallery.form,
      formMessage: (state) => state.customerGallery.message,
      dataType: (state) => state.customerGallery.dataType,
    }),
    titleForm() {
      let title = 'Tambah Cover atau Galeri Foto'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Cover atau Galeri Foto'
          break
        case 'edit':
          title = 'Edit Cover atau Galeri Foto'
          break
        case 'detail':
          title = 'Detail Cover atau Galeri Foto'
          break
      }
      return title
    },
    visibleSaveButton() {
      return this.typeForm !== 'detail' ? true : false
    },
  },
  methods: {
    onSave() {
      this.$emit('onSave')
    },
    onClose() {
      this.$emit('onClose')
    },
    onUpdateCover(data) {
      this.$emit('onUpdateCover', data)
    },
  },
}
</script>
