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
              class="image image-padding image-circle bg-grey"
              :style="`background-image: url(${brideImageThumbnailUrl + formData.image});`"
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
            ID Pengantin <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.bride_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.bride_id" class="fonts fonts-12px red">
            {{ formMessage.bride_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Nama Lengkap <span class="fonts red">*</span>
          </div>
          <!-- <div class="display-flex space-between margin margin-bottom-10px">
            <div class="fonts fonts-9 black">Ubah field menjadi editor ?</div>
            <el-switch
              v-model="formData.is_name_editor"
              :active-value="1"
              :inactive-value="0"
              :disabled="!visibleSaveButton"></el-switch>
          </div> -->
          <vue-editor
            v-if="formData.is_name_editor"
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
          <div class="fonts fonts-11 semibold black">
            Nama Panggilan
          </div>
          <!-- <div class="display-flex space-between margin margin-bottom-10px">
            <div class="fonts fonts-9 black">Ubah field menjadi editor ?</div>
            <el-switch
              v-model="formData.is_nick_name_editor"
              :active-value="1"
              :inactive-value="0"
              :disabled="!visibleSaveButton"></el-switch>
          </div> -->
          <vue-editor
            v-if="formData.is_nick_name_editor"
            v-model="formData.nick_name"
            :editorToolbar="editorConfig"
            :disabled="!visibleSaveButton"
          ></vue-editor>
          <el-input
            v-else
            v-model="formData.nick_name"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.nick_name" class="fonts fonts-12px red">
            {{ formMessage.nick_name[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Orang Tua <span class="fonts red">*</span>
          </div>
          <div class="display-flex space-between margin margin-bottom-10px">
            <div class="fonts fonts-9 black">Ubah field menjadi editor ?</div>
            <el-switch
              v-model="formData.is_parent_editor"
              :active-value="1"
              :inactive-value="0"
              :disabled="!visibleSaveButton"
            ></el-switch>
          </div>
          <vue-editor
            v-if="formData.is_parent_editor"
            v-model="formData.parent"
            :editorToolbar="editorConfig"
            :disabled="!visibleSaveButton"
          ></vue-editor>
          <el-input
            v-else
            v-model="formData.parent"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.parent" class="fonts fonts-12px red">
            {{ formMessage.parent[0] }}
          </div>
        </div>
        <!-- <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Deskripsi
          </div>
          <el-input
            v-model="formData.about"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.about" class="fonts fonts-12px red">
            {{ formMessage.about[0] }}
          </div>
        </div> -->
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Link Instagram</div>
          <el-input
            v-model="formData.instagram_link"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.instagram_link" class="fonts fonts-12px red">
            {{ formMessage.instagram_link[0] }}
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
      formData: (state) => state.customerBrides.form,
      formMessage: (state) => state.customerBrides.message,
    }),
    titleForm() {
      let title = 'Tambah Pengantin'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Pengantin'
          break
        case 'edit':
          title = 'Edit Pengantin'
          break
        case 'detail':
          title = 'Detail Pengantin'
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
