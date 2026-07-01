<template>
  <div id="App">
    <AppSideFormPopup
      :title="titleForm"
      :enableSaveButton="visibleSaveButton"
      :visibleForm="visibleForm"
      @onSave="onSave"
      @onClose="onClose"
    >
      <div class="width w-full">
        <div v-if="typeForm !== 'create'" class="p-4 pb-[15px]">
          <div
            class="width width-150px width-center p-4 pb-[15px]"
          >
            <div
              class="image image-padding bg-grey"
              :style="`background-image: url(${commentImageThumbnailUrl + formData.image});`"
            >
              <i
                v-if="!formData.image"
                class="post-middle-absolute fa fa-lg fa-image"
              ></i>
            </div>
          </div>
          <div class="flex center">
            <button class="btn btn-sekunder" @click="onUpdateCover(formData)">
              <i class="icn icn-left fa fa-lg fa-camera"></i> Ubah Cover
            </button>
          </div>
        </div>
        <div class="p-4 padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            ID Kado Digital <span class="red">*</span>
          </div>
          <el-input
            v-model="formData.comment_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.comment_id" class="fonts-12px red">
            {{ formMessage.comment_id[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            Nama Bank / Wallet <span class="red">*</span>
          </div>
          <el-input
            v-model="formData.name"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.name" class="fonts-12px red">
            {{ formMessage.name[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            No. Rekening / No. Handphone <span class="red">*</span>
          </div>
          <el-input
            v-model="formData.comment"
            placeholder=""
            :disabled="!visibleSaveButton"
          ></el-input>
          <div v-if="formMessage.comment" class="fonts-12px red">
            {{ formMessage.comment[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Status</div>
          <div
            v-if="visibleSaveButton"
            class="p-4 pt-[15px] flex"
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
              <span class="micro"> Active </span>
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
              <span class="micro"> Inactive </span>
            </label>
          </div>
          <el-input
            v-if="!visibleSaveButton"
            placeholder=""
            :value="formData.status === 'active' ? 'Active' : 'Inactive'"
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.status" class="fonts-12px red">
            {{ formMessage.status[0] }}
          </div>
        </div>
      </div>
    </AppSideFormPopup>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import AppSideFormPopup from '../../../components/modules/AppSideFormPopup'

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
      formData: (state) => state.customerGifts.form,
      formMessage: (state) => state.customerGifts.message,
    }),
    titleForm() {
      let title = 'Tambah Kado Digital'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Kado Digital'
          break
        case 'edit':
          title = 'Edit Kado Digital'
          break
        case 'detail':
          title = 'Detail Kado Digital'
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
