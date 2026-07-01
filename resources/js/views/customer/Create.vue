<template>
  <div>
    <button class="btn btn-main btn-full" @click="onCreateInvitation">
      <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Buat Undangan
    </button>

    <AppPopupForm
      v-if="visibleCreatePopup"
      :title="'Buat Undangan'"
      :subtitle="form.invitation_id"
      :onClose="onCloseCreateInvitation"
    >
      <div
        class="width w-full width-center p-4 padding-top-30px padding-bottom-30px"
      >
        <el-steps :active="activeIndex" finish-status="success" align-center>
          <el-step>
            <div slot="title" style="font-size: 13px">Kategori</div>
          </el-step>
          <el-step>
            <div slot="title" style="font-size: 13px">Paket</div>
          </el-step>
          <el-step>
            <div slot="title" style="font-size: 13px">Informasi</div>
          </el-step>
        </el-steps>
      </div>

      <!-- STEP 1 -->
      <div
        v-if="activeIndex === 0"
        class="flex flex-col center p-4 padding-top-50px padding-bottom-50px"
      >
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="flex center p-4 padding-top-10px">
            <div
              v-for="(item, i) in categories"
              :key="i"
              class="margin margin-10px"
            >
              <div
                :class="`
                                    image 
                                    image-150px 
                                    border-dashed-full 
                                    cursor-pointer 
                                    display-flex 
                                    column 
                                    center
                                    ${form.category_id === item.id ? 'custom-selection active' : 'custom-selection'}`"
                @click="onChangeCategory(item.id)"
              >
                <div class="flex flex-col items-center">
                  <div class="image image-50px image-circle">
                    <i class="post-middle-absolute fa fa-lw fa-flag"></i>
                  </div>
                  <div class="p-4 pt-[15px]">
                    <div class="text-[11px] font-semibold text-black items-center">
                      {{ item.name }}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- STEP 2 -->
      <div
        v-if="activeIndex === 1"
        class="flex flex-col center p-4 padding-top-50px padding-bottom-50px"
      >
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="flex center p-4 padding-top-10px">
            <div
              v-for="(item, i) in packages"
              :key="i"
              class="margin margin-10px"
            >
              <div
                :class="`
                                    image 
                                    image-150px 
                                    border-dashed-full 
                                    cursor-pointer 
                                    display-flex 
                                    column 
                                    center
                                    ${form.type === item.value ? 'custom-selection active' : 'custom-selection'}`"
                @click="onChangePackages(item.value)"
              >
                <div class="flex flex-col items-center">
                  <div class="image image-50px image-circle">
                    <i class="post-middle-absolute fa fa-lw fa-flag"></i>
                  </div>
                  <div class="p-4 pt-[15px]">
                    <div class="text-[11px] font-semibold text-black items-center">
                      {{ item.title }}
                    </div>
                    <div class="text-[11px] normal text-black items-center">
                      {{ item.price }}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- STEP 3 -->
      <div v-if="activeIndex === 2" class="width w-full">
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            Judul Undangan <span class="red">*</span>
          </div>
          <div class="text-[10px] normal text-black">Contoh: Sinta & Rio</div>
          <el-input v-model="form.title" placeholder=""></el-input>
          <div v-if="errorMessage.title" class="fonts-12px red">
            {{ errorMessage.title[0] }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">
            Short Link <span class="red">*</span>
          </div>
          <div class="text-[10px] normal text-black">Contoh: sinta-rio</div>
          <el-input
            v-model="form.short_link"
            @input="formShortLink"
            placeholder=""
          ></el-input>
          <div v-if="errorMessage.short_link" class="fonts-12px red">
            {{ errorMessage.short_link[0] }}
          </div>
        </div>
      </div>

      <div class="flex justify-end items-center p-4 p-[15px]">
        <button class="btn btn-white" @click="goBack">
          {{ activeIndex === 0 ? 'Batalkan' : 'Kembali' }}
        </button>
        <button
          class="btn btn-main margin margin-left-5px"
          :disabled="disabledNextButton"
          @click="onNext"
        >
          {{ activeIndex === totalIndex ? 'Buat Undangan' : 'Selanjutnya' }}
        </button>
      </div>

      <!-- <div class="width w-full margin margin-bottom-20px">
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">ID Undangan <span class="red">*</span></div>
                    <el-input 
                        v-model="form.invitation_id" 
                        placeholder=""
                        :disabled="true"></el-input>
                    <div 
                        v-if="errorMessage.invitation_id" 
                        class="fonts-12px red">{{ errorMessage.invitation_id[0] }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Paket <span class="red">*</span></div>
                    <div class="flex p-4 padding-top-10px">
                        <div v-for="(item, i) in packages" :key="i" class="margin margin-right-10px">
                            <div class="card bg-white border-full flex">
                                <div style="width: 40px;">
                                    <i class="fa fa-lw fa-flag"></i>
                                </div>
                                <div style="width: calc(100% - 40px);">
                                    <div class="text-[11px] font-semibold text-black">{{ item.title }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Kategori <span class="red">*</span></div>
                    <div class="flex p-4 padding-top-10px">
                        <div v-for="(item, i) in categories" :key="i" class="margin margin-right-10px">
                            <div class="card bg-white border-full flex">
                                <div style="width: 40px;">
                                    <i class="fa fa-lw fa-flag"></i>
                                </div>
                                <div style="width: calc(100% - 40px);">
                                    <div class="text-[11px] font-semibold text-black">{{ item.name }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Judul <span class="red">*</span></div>
                    <div class="text-[10px] normal text-black">Contoh: Sinta & Rio</div>
                    <el-input 
                        v-model="form.title" 
                        placeholder=""></el-input>
                    <div 
                        v-if="errorMessage.title" 
                        class="fonts-12px red">{{ errorMessage.title[0] }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Short Link <span class="red">*</span></div>
                    <div class="text-[10px] normal text-black">Contoh: sinta-rio</div>
                    <el-input 
                        v-model="form.short_link" 
                        @input="formShortLink"
                        placeholder=""></el-input>
                    <div 
                        v-if="errorMessage.short_link" 
                        class="fonts-12px red">{{ errorMessage.short_link[0] }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-10px">
                    <div class="text-[11px] font-semibold text-black">Kategori <span class="red">*</span></div>
                    <el-select 
                        v-model="form.category_id" 
                        slot="prepend" 
                        class="el-select-custom-form"
                        placeholder="">
                        <el-option 
                            v-for="(dt, i) in categories" 
                            :key="i"
                            :label="dt.name"
                            :value="dt.id"></el-option>
                    </el-select>
                    <div 
                        v-if="errorMessage.category_id" 
                        class="fonts-12px red">{{ errorMessage.category_id[0] }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-10px">
                    <div class="text-[11px] font-semibold text-black">Paket <span class="red">*</span></div>
                    <el-select 
                        v-model="form.type" 
                        slot="prepend" 
                        class="el-select-custom-form"
                        placeholder="">
                        <el-option 
                            v-for="(dt, i) in packages" 
                            :key="i"
                            :label="dt.label"
                            :value="dt.value"></el-option>
                    </el-select>
                    <div 
                        v-if="errorMessage.type" 
                        class="fonts-12px red">{{ errorMessage.type[0] }}</div>
                </div>
            </div> -->
      <!-- <div class="width w-full margin margin-bottom-20px">
                <div class="fonts-14 font-semibold text-black">Jadwal Acara</div>
                <div class="p-4 padding-top-10px padding-bottom-10px">
                    <div class="text-[11px] font-semibold text-black">Hari <span class="red">*</span></div>
                    <el-select 
                        v-model="form.day" 
                        slot="prepend" 
                        class="el-select-custom-form"
                        placeholder="">
                        <el-option 
                            v-for="(dt, i) in days" 
                            :key="i"
                            :label="dt"
                            :value="dt"></el-option>
                    </el-select>
                    <div 
                        v-if="errorMessage.day" 
                        class="fonts-12px red">{{ errorMessage.day[0] }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Tanggal <span class="red">*</span></div>
                    <el-input 
                        v-model="form.date" 
                        placeholder=""
                        type="date"></el-input>
                    <div 
                        v-if="errorMessage.date" 
                        class="fonts-12px red">{{ errorMessage.date[0] }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Jam</div>
                    <div class="text-[10px] normal text-gray-500">Isi dengan jam mulai - jam akhir (09.00 - 17.00)</div>
                    <el-input 
                        v-model="form.time" 
                        placeholder=""></el-input>
                    <div 
                        v-if="errorMessage.time" 
                        class="fonts-12px red">{{ errorMessage.time }}</div>
                </div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Zona Waktu</div>
                    <div class="text-[10px] normal text-gray-500">Pilih WIB/WIT/WITA</div>
                    <el-select 
                        v-model="form.time_zone" 
                        slot="prepend" 
                        class="el-select-custom-form"
                        placeholder="">
                        <el-option 
                            v-for="(dt, i) in timeZone" 
                            :key="i"
                            :label="dt"
                            :value="dt"></el-option>
                    </el-select>
                    <div 
                        v-if="errorMessage.time_zone" 
                        class="fonts-12px red">{{ errorMessage.time_zone }}</div>
                </div>
            </div>

            <div class="width w-full margin margin-bottom-20px">
                <div class="fonts-14 font-semibold text-black">Lokasi Acara</div>
                <div class="p-4 padding-top-10px padding-bottom-5px">
                    <div class="text-[11px] font-semibold text-black">Alamat / Deskripsi <span class="red">*</span></div>
                    <el-input 
                        v-model="form.description" 
                        placeholder=""
                        type="textarea"
                        :autosize="{ minRows: 4, maxRows: 8}"></el-input>
                    <div 
                        v-if="errorMessage.description" 
                        class="fonts-12px red">{{ errorMessage.description[0] }}</div>
                </div>
            </div> -->
      <!-- <div class="p-4 pt-[15px]">
                <button class="btn btn-main btn-full" @click="onSubmitInvitation">Buat Undangan</button>
            </div> -->
    </AppPopupForm>

    <AppPopupConfirmed
      v-if="visibleConfirmedPopup"
      title="Simpan data undangan ?"
      @onClickYes="onClickYes"
      @onClickNo="onClickNo"
    />

    <AppPopupAlert
      v-if="visibleAlert"
      :title="titleAlert"
      :icon="iconAlert"
      @onClickOk="onClickOk"
    />

    <AppPopupLoader v-if="visibleLoader" title="Mohon Tunggu ..." />
  </div>
</template>
<script>
import { mapState, mapGetters, mapActions } from 'vuex'
import AppPopupForm from '../../components/modules/AppPopupForm'
import AppPopupConfirmed from '../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../components/modules/AppPopupLoader'

export default {
  name: 'App',
  data() {
    return {
      totalIndex: 3,
      visibleCreatePopup: true,
      visibleConfirmedPopup: false,
      visibleAlert: false,
      visibleLoader: false,
      titleAlert: 'Data undangan berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
    }
  },
  components: {
    AppPopupForm,
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
      invitationLoading: 'customerInvitation/loading',
    }),
    ...mapState({
      activeIndex: (state) => state.customerInvitation.activeIndex,
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      days: (state) => state.customerInvitation.days,
      timeZone: (state) => state.customerInvitation.timeZone,
      categories: (state) => state.customerCategory.data,
      packages: (state) => state.customerPacket.data,
    }),
    requeiredFullInformation() {
      let status = true
      if (
        this.form.invitation_id &&
        this.form.short_link &&
        this.form.title &&
        this.form.day &&
        this.form.date &&
        this.form.description
      )
        status = false
      return status
    },
    requeiredCategory() {
      let status = true
      if (this.form.category_id) status = false
      return status
    },
    requeiredPacket() {
      let status = true
      if (this.form.type) status = false
      return status
    },
    disabledNextButton() {
      let status = false
      if (this.activeIndex === 0) {
        status = this.requeiredCategory
      }
      if (this.activeIndex === 1) {
        status = this.requeiredPacket
      }
      if (this.activeIndex === 2) {
        status = this.requeiredFullInformation
      }
      return status
    },
  },
  methods: {
    ...mapActions({
      onChangeActiveIndex: 'customerInvitation/onChangeActiveIndex',
      getCategory: 'customerCategory/getData',
      createData: 'customerInvitation/createData',
      setFormData: 'customerInvitation/setFormData',
    }),
    goBack() {
      if (this.activeIndex === 0) {
        this.onCloseCreateInvitation()
      } else {
        const data = this.activeIndex - 1
        this.onChangeActiveIndex(data)
      }
    },
    onNext() {
      if (this.activeIndex === this.totalIndex) {
        this.onSubmitInvitation()
      } else {
        const data = this.activeIndex + 1
        this.onChangeActiveIndex(data)
      }
    },
    getDataCategory() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCategory({ token: token, status: 'active' })
    },
    formShortLink(value) {
      this.form.short_link = value.replace(/[ ]/g, '-')
    },
    onCreateInvitation() {
      this.visibleCreatePopup = true
    },
    onCloseCreateInvitation() {
      this.visibleCreatePopup = false
    },
    onClickYes() {
      this.createDataCustomerInvitation()
    },
    onClickNo() {
      this.visibleConfirmedPopup = false
    },
    onClickOk() {
      this.visibleAlert = false
      if (this.formSatus) {
        this.$router.replace({ name: 'customer-dashboard' })
      }
    },
    onSubmitInvitation() {
      this.visibleConfirmedPopup = true
    },
    createDataCustomerInvitation() {
      this.visibleConfirmedPopup = false
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      this.createData({ token })
        .then((res) => {
          if (res.data.status === 'ok') {
            this.formSatus = true
            this.visibleAlert = true
            this.titleAlert = 'Data undangan berhasil di buat !'
            this.iconAlert = 'far fa-4x fa-check-circle'
          } else {
            this.formSatus = false
            this.visibleAlert = true
            this.titleAlert = 'Data undangan gagal di buat !'
            this.iconAlert = 'far fa-4x fa-times-circle'
          }
          console.log('res', res)
        })
        .finally(() => {
          this.visibleLoader = false
        })
    },
    onChangeCategory(id) {
      this.form.category_id = id
      // this.onChangeActiveIndex(1)
    },
    onChangePackages(value) {
      this.form.type = value
      // this.onChangeActiveIndex(2)
    },
  },
  mounted() {
    this.setFormData()
    this.getDataCategory()
  },
}
</script>
