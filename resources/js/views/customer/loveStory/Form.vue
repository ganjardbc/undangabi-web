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
              :style="`background-image: url(${loveStoryImageThumbnailUrl + formData.image});`"
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
            ID Love Story <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.love_story_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.love_story_id" class="fonts fonts-12px red">
            {{ formMessage.love_story_id[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">
            Judul <span class="fonts red">*</span>
          </div>
          <el-input
            v-model="formData.title"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.title" class="fonts fonts-12px red">
            {{ formMessage.title[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Description</div>
          <el-input
            v-model="formData.description"
            placeholder=""
            type="textarea"
            :autosize="{ minRows: 4, maxRows: 8 }"
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.description" class="fonts fonts-12px red">
            {{ formMessage.description[0] }}
          </div>
        </div>
        <div class="padding padding-top-10px padding-bottom-5px">
          <div class="fonts fonts-11 semibold black">Date</div>
          <el-input
            v-model="formData.date"
            placeholder=""
            type="date"
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
      formData: (state) => state.customerLoveStory.form,
      formMessage: (state) => state.customerLoveStory.message,
    }),
    titleForm() {
      let title = 'Tambah Love Story'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Love Story'
          break
        case 'edit':
          title = 'Edit Love Story'
          break
        case 'detail':
          title = 'Detail Love Story'
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
