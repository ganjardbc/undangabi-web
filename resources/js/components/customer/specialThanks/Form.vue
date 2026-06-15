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
              :style="`background-image: url(${specialthankImageThumbnailUrl + formData.image});`"
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
            ID Special Thanks <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.specialthanks_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.specialthanks_id" class="fonts fonts-12px red">
            {{ formMessage.specialthanks_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Nama <span class="fonts red">*</span>
          </div>
          <div class="display-flex space-between margin margin-bottom-10px">
            <div class="fonts fonts-9 black">Ubah field menjadi editor ?</div>
            <el-switch
              v-model="formData.is_editor"
              :active-value="1"
              :inactive-value="0"
              :disabled="!visibleSaveButton"
            ></el-switch>
          </div>
          <vue-editor
            v-if="formData.is_editor"
            v-model="formData.name"
            :editorToolbar="editorConfig"
            :disabled="!visibleSaveButton"
          ></vue-editor>
          <el-input
            v-else
            v-model="formData.name"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.name" class="fonts fonts-12px red">
            {{ formMessage.name[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Link</div>
          <el-input
            v-model="formData.link"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.link" class="fonts fonts-12px red">
            {{ formMessage.link[0] }}
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
import { VueEditor } from 'vue2-editor'
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
    VueEditor,
  },
  computed: {
    ...mapState({
      formData: (state) => state.customerSpecialThanks.form,
      formMessage: (state) => state.customerSpecialThanks.message,
    }),
    titleForm() {
      let title = 'Tambah Spesial Thanks'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Spesial Thanks'
          break
        case 'edit':
          title = 'Edit Spesial Thanks'
          break
        case 'detail':
          title = 'Detail Spesial Thanks'
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
