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
        <div class="p-4 padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            ID Buku Tamu <span class="red">*</span>
          </div>
          <el-input
            v-model="formData.guest_book_id"
            placeholder=""
            :disabled="true"
          ></el-input>
          <div v-if="formMessage.guest_book_id" class="fonts-12px red">
            {{ formMessage.guest_book_id[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            Nama Lengkap <span class="red">*</span>
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
        <div class="p-4 padding-top-10px pb-[15px]">
          <div class="text-[11px] font-semibold text-black">Jumlah Kehadiran</div>
          <div class="micro text-black margin margin-bottom-10-px">
            Berapa banyak orang yang akan menghadiri acara ini ?
          </div>
          <el-input-number
            v-model="formData.attendance"
            placeholder="Jumlah kehadiran"
            :min="1"
            :max="100"
            :disabled="!visibleSaveButton"
            style="width: 100%"
          ></el-input-number>
          <div v-if="formMessage" class="fonts-12px red">
            {{
              formMessage && formMessage.attendance && formMessage.attendance[0]
            }}
          </div>
        </div>
        <AppCardCollapse title="Opsional">
          <div class="p-4 padding-top-10px padding-bottom-5px">
            <div class="text-[11px] font-semibold text-black">Alamat</div>
            <el-input
              type="textarea"
              v-model="formData.address"
              placeholder=""
              :disabled="!visibleSaveButton"
            ></el-input>
            <div v-if="formMessage.address" class="fonts-12px red">
              {{ formMessage.address[0] }}
            </div>
          </div>
          <div class="p-4 padding-top-10px padding-bottom-5px">
            <div class="text-[11px] font-semibold text-black">Ucapan & Do'a</div>
            <el-input
              type="textarea"
              v-model="formData.comments"
              placeholder=""
              :disabled="!visibleSaveButton"
            ></el-input>
            <div v-if="formMessage.comments" class="fonts-12px red">
              {{ formMessage.comments[0] }}
            </div>
          </div>
        </AppCardCollapse>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Status</div>
          <div
            v-if="visibleSaveButton"
            class="p-4 pt-[15px] pb-[15px] flex"
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
import AppCardCollapse from '../../../components/modules/AppCardCollapse'

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
  components: {
    AppSideFormPopup,
    AppCardCollapse,
  },
  computed: {
    ...mapState({
      formData: (state) => state.customerGuestBook.form,
      formMessage: (state) => state.customerGuestBook.message,
      // dataPresentGuestBook: state => state.customerGuestBook.dataPresentGuestBook,
    }),
    titleForm() {
      let title = 'Tambah Buku Tamu'
      switch (this.typeForm) {
        case 'create':
          title = 'Tambah Buku Tamu'
          break
        case 'edit':
          title = 'Edit Buku Tamu'
          break
        case 'detail':
          title = 'Detail Buku Tamu'
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
