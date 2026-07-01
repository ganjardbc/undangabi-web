<template>
  <div
    id="AppReservation"
    :class="innerClass ? innerClass : 'width width-100 width-mobile'"
  >
    <div class="theme-guest mobile shadow-sm">
      <div v-if="!isEnableGuestBook" class="p-4 p-[15px] bg-red">
        <div class="text-[11px] font-semibold white items-center">
          Reservasi Telah Ditutup
        </div>
      </div>

      <div class="theme-guest-header bg-white">
        <div class="flex justify-between items-center">
          <div class="text-[11px] text-black font-semibold">
            {{ title ? title : 'Reservasi' }}
          </div>
          <div class="flex">
            <button
              class="btn btn-white btn-icon"
              @click="getData(invStringID)"
            >
              <i class="fa fa-lw fa-retweet"></i>
            </button>
            <button
              v-if="!disablePopupForm"
              class="theme-guest-add btn btn-white btn-icon"
              @click="onShowPopup"
            >
              <i class="fa fa-lw fa-plus" />
            </button>
          </div>
        </div>
      </div>

      <div class="flex display-mobile">
        <div
          :class="`${!disablePopupForm ? `theme-guest-book ${visiblePopup ? 'show' : ''}` : 'theme-guest-book-normal'} width width-40 width-mobile border-right`"
        >
          <div
            v-if="!disablePopupForm"
            class="theme-guest-add theme-guest-header bg-white"
          >
            <div class="flex justify-between items-center">
              <div class="micro font-semibold">Isi Kehadiran Tamu</div>
              <button class="btn btn-icon btn-white" @click="onShowPopup">
                <i class="fa fa-lg fa-times"></i>
              </button>
            </div>
          </div>

          <div
            class="theme-guest-body bg-white"
            :style="`height: 450px; padding-top: 15px; padding-bottom: 15px;`"
          >
            <div class="width w-full">
              <div class="field-group margin margin-bottom-15-px">
                <div class="micro text-black font-semibold">
                  {{ labelNameText ? labelNameText : 'Nama Lengkap' }}
                  <span class="red">*</span>
                </div>
                <div v-if="descriptionNameText" class="micro text-black">
                  {{ descriptionNameText }}
                </div>
                <el-input
                  v-model="formData.name"
                  placeholder=""
                  :disabled="!isEnableGuestBook"
                  clearable
                  @input="onChangeGuestName"
                ></el-input>
                <div
                  v-if="formMessage"
                  class="micro font-semibold"
                  style="color: red; margin-bottom: 5px"
                >
                  {{ formMessage && formMessage.name && formMessage.name[0] }}
                </div>
              </div>
              <div class="field-group margin margin-bottom-15-px">
                <div class="micro text-black font-semibold">
                  {{ labelCommentText ? labelCommentText : "Ucapan & Do'a" }}
                </div>
                <div v-if="descriptionCommentText" class="micro text-black">
                  {{ descriptionCommentText }}
                </div>
                <el-input
                  type="textarea"
                  v-model="formData.comments"
                  placeholder=""
                  :rows="2"
                  :disabled="!isEnableGuestBook"
                ></el-input>
                <div
                  v-if="formMessage"
                  class="micro font-semibold"
                  style="color: red; margin-bottom: 10px"
                >
                  {{
                    formMessage &&
                    formMessage.comments &&
                    formMessage.comments[0]
                  }}
                </div>
              </div>
              <div v-if="formData.present_type !== 'present'">
                <div class="field-group margin margin-bottom-15-px">
                  <div class="micro text-black font-semibold">
                    {{
                      labelAttendanceText ? labelAttendanceText : 'Kehadiran'
                    }}
                    <span class="red">*</span>
                  </div>
                  <div class="micro text-black">
                    {{
                      descriptionAttendanceText
                        ? descriptionAttendanceText
                        : 'Apakah kamu akan menghadiri acara ini ?'
                    }}
                  </div>
                  <div class="margin margin-top-10px">
                    <el-radio-group
                      v-model="formData.present_type"
                      :disabled="!isEnableGuestBook"
                      @change="onChangePresentType"
                    >
                      <el-radio :label="'will-present'">
                        {{ 'Iya, Akan hadir' }}
                      </el-radio>
                      <el-radio :label="'not-present'">
                        {{ 'Tidak akan hadir' }}
                      </el-radio>
                    </el-radio-group>
                  </div>
                  <div
                    v-if="formMessage"
                    class="micro font-bold"
                    style="color: red; margin-top: 5px"
                  >
                    {{
                      formMessage &&
                      formMessage.present_type &&
                      formMessage.present_type[0]
                    }}
                  </div>
                </div>
                <div
                  v-if="formData.present_type === 'will-present'"
                  class="field-group margin margin-bottom-15-px"
                >
                  <div class="flex flex-col">
                    <div class="micro text-black font-semibold">
                      {{
                        labelPresentText
                          ? labelPresentText
                          : 'Berapa orang yang akan menghadiri acara ini?'
                      }}
                    </div>
                    <div
                      v-if="descriptionPresentText"
                      class="micro text-black"
                    >
                      {{ descriptionPresentText }}
                    </div>
                    <el-input-number
                      v-model="formData.attendance"
                      :disabled="!isEnableGuestBook"
                      :placeholder="'Jumlah kehadiran'"
                      :min="1"
                      :max="100"
                      style="width: 100%"
                    ></el-input-number>
                  </div>
                  <div
                    v-if="formMessage"
                    class="micro font-bold"
                    style="color: red; margin-top: 5px"
                  >
                    {{
                      formMessage &&
                      formMessage.attendance &&
                      formMessage.attendance[0]
                    }}
                  </div>
                </div>
                <div
                  v-if="
                    formData.present_type === 'will-present' &&
                    dataSchedules &&
                    dataSchedules.length > 0
                  "
                  class="field-group margin margin-bottom-15-px"
                >
                  <div class="flex flex-col">
                    <div class="micro text-black font-semibold">
                      {{
                        labelScheduleText
                          ? labelScheduleText
                          : 'Pilih jadwal kehadiran'
                      }}
                    </div>
                    <div
                      v-if="descriptionScheduleText"
                      class="micro text-black"
                    >
                      {{ descriptionScheduleText }}
                    </div>
                    <el-select
                      v-model="formData.reservation_schedule_id"
                      :placeholder="'Pilih jadwal'"
                      :disabled="!isEnableGuestBook"
                      clearable
                      style="width: 100%"
                    >
                      <el-option
                        v-for="(item, index) in dataSchedules"
                        :key="index"
                        :label="`${item.title} (${item.schedule_time} ${item.schedule_timezone})`"
                        :value="item.id"
                      >
                      </el-option>
                    </el-select>
                  </div>
                  <div
                    v-if="formMessage"
                    class="micro font-bold"
                    style="color: red; margin-top: 5px"
                  >
                    {{
                      formMessage &&
                      formMessage.reservation_schedule_id &&
                      formMessage.reservation_schedule_id[0]
                    }}
                  </div>
                </div>
              </div>
              <div v-if="formData.present_type === 'present'">
                <div class="micro text-black font-semibold">
                  {{
                    labelAttendanceText
                      ? labelAttendanceText
                      : 'Status Kehadiran'
                  }}
                  <span class="red">*</span>
                </div>
                <div class="flex">
                  <div
                    v-if="formData.present_type === 'present'"
                    :class="'card-capsule active'"
                    style="text-transform: capitalize"
                  >
                    Hadir - {{ formData.attendance }} Orang
                  </div>
                  <div
                    v-if="formData.present_type === 'will-present'"
                    :class="'card-capsule wip'"
                    style="text-transform: capitalize"
                  >
                    Akan Hadir - {{ formData.attendance }} Orang
                  </div>
                  <div
                    v-if="formData.present_type === 'not-present'"
                    :class="'card-capsule inactive'"
                    style="text-transform: capitalize"
                  >
                    Tidak Hadir
                  </div>
                  <div
                    v-if="formData.present_type === 'waiting-response'"
                    :class="'card-capsule'"
                    style="text-transform: capitalize"
                  >
                    Menunggu
                  </div>
                </div>
              </div>
              <div class="flex right" style="padding-top: 10px">
                <button
                  v-if="!disablePopupForm"
                  class="theme-guest-add btn btn-white"
                  @click="onShowPopup"
                >
                  Batalkan
                </button>
                <button
                  v-if="isEnableGuestBook"
                  class="btn btn-main"
                  :style="`background-color: ${backgroundButtonColor || ''}; border-color: ${backgroundButtonColor || ''}; color: ${textButtonColor || ''};`"
                  :disabled="visibleLoaderAction"
                  @click="onShowAlert"
                >
                  Isi Kehadiran
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="width width-60 width-mobile">
          <div class="border-bottom bg-white">
            <AppTabs
              :selectedIndex="selectedIndex"
              :data.sync="tabs"
              :isFull="true"
              :onChange="(data) => onChangeTabs(data)"
              :mainColor="mainColor"
            />
          </div>
          <div class="theme-guest-container">
            <div
              class="theme-guest-body"
              :style="`height: 425px; background-color: ${backgroundChatColor || ''};`"
            >
              <AppLoader v-if="visibleLoader" />
              <AppEmpty
                v-if="!visibleLoader && datas.length === 0"
                iconColor="grey"
              />
              <div
                v-for="(dt, i) in datas"
                :key="i"
                class="bg-white shadow-sm border-small-radius p-4 p-[15px] margin margin-top-15px mb-[15px]"
              >
                <div
                  class="flex justify-between items-center margin mb-[10px]"
                >
                  <div class="width w-full flex items-center">
                    <div
                      class="image image-35px image-circle margin margin-right-10px"
                    >
                      <i class="post-middle fa fa-lg fa-user-circle"></i>
                    </div>
                    <div style="width: calc(100% - 45px)">
                      <div
                        class="width w-full flex items-center justify-between"
                      >
                        <div
                          class="text-[11px] text-black font-semibold overflow-ellipsis"
                        >
                          {{ dt.name }}
                        </div>
                        <div
                          class="text-[9px] normal text-gray-500 align-right overflow-ellipsis"
                        >
                          {{
                            dt.updated_at
                              ? dt.updated_at
                              : dt.created_at | moment('from', 'now')
                          }}
                        </div>
                      </div>
                      <div
                        v-if="dt.address"
                        class="text-[9px] normal text-gray-500 overflow-ellipsis"
                      >
                        <i
                          class="fa fa-lw fa-map-marker-alt text-[10px] text-gray-500"
                          style="width: 15px"
                        ></i>
                        {{ dt.address }}
                      </div>
                      <div
                        v-if="dt.reservation_schedule_id"
                        class="text-[9px] normal text-gray-500 overflow-ellipsis"
                      >
                        <i
                          class="fa fa-lw fa-calendar-check text-[10px] text-gray-500"
                          style="width: 15px"
                        ></i>
                        {{ dt.schedule.title }} ({{
                          dt.schedule.schedule_time
                        }}
                        {{ dt.schedule.schedule_timezone }})
                      </div>
                    </div>
                  </div>
                </div>
                <div
                  v-if="dt.comments"
                  class="p-4 p-[15px] padding-top-5px padding-bottom-5px bg-grey border-radius margin mb-[10px]"
                >
                  <div class="text-[11px] text-black">{{ dt.comments }}</div>
                </div>
                <div
                  class="flex justify-between items-center margin margin-top-15px p-4 pt-[15px] border-top"
                >
                  <AppPopupQrCodeSmall
                    v-if="
                      isPrivateInvitation &&
                      dt.reservation_list_id === formData.reservation_list_id
                    "
                    :code="`${initUrl}/${invShortLink}/${dt.reservation_list_id}`"
                    :fileName="`qr-code-${invShortLink}-${dt.reservation_list_id}`"
                    :label="dt.name"
                  />
                  <div v-else></div>
                  <div class="flex left">
                    <div
                      v-if="dt.present_type === 'will-present'"
                      :class="'card-capsule active'"
                      style="text-transform: capitalize"
                    >
                      Akan Hadir - {{ dt.attendance }} Orang
                    </div>
                    <div
                      v-if="dt.present_type === 'not-present'"
                      :class="'card-capsule inactive'"
                      style="text-transform: capitalize"
                    >
                      Tidak Hadir
                    </div>
                    <div
                      v-if="dt.present_type === 'waiting-response'"
                      :class="'card-capsule'"
                      style="text-transform: capitalize"
                    >
                      Menunggu
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div
            v-if="!disablePopupForm"
            class="theme-guest-add theme-guest-footer"
          >
            <button
              class="btn btn-primary btn-full"
              @click="onShowPopup"
              :style="`background-color: ${backgroundButtonColor || ''}; border-color: ${backgroundButtonColor || ''}; color: ${textButtonColor || ''}; cursor: not-allowed`"
            >
              Isi Kehadiran Tamu
            </button>
          </div>
        </div>
      </div>
    </div>

    <div
      v-if="
        formData.reservation_list_id &&
        isEnableGuestBook &&
        isEnableQRCode &&
        isPrivateInvitation
      "
      class="flex flex-col center p-4 padding-top-20px padding-bottom-20px"
    >
      <div class="text-[11px] text-black items-center margin margin-bottom-20px">
        Simpan QR-Code Reservasi dibawah ini untuk mengisi Buku Tamu di acara
        nanti.
      </div>
      <div class="flex center">
        <AppPopupQrCodeSmall
          :code="`${initUrl}/${invShortLink}/${formData.reservation_list_id}`"
          :fileName="`qr-code-${invShortLink}-${formData.reservation_list_id}`"
          :label="formData.name"
          :buttonLabel="`QR-Code Reservasi`"
        />
      </div>
    </div>

    <AppPopupConfirmed
      v-if="visibleAlertSave"
      :title="titleConfirmed"
      @onClickNo="onShowAlert"
      @onClickYes="saveData"
    />

    <AppPopupAlert
      v-if="visibleAlert"
      :title="titleAlert"
      :icon="iconAlert"
      @onClickOk="onClickOk"
    />

    <AppPopupLoader v-if="visibleLoaderAction" :title="titleLoader" />
  </div>
</template>
<script>
import { mapActions, mapState } from 'vuex'
import axios from 'axios'
import AppAlert from './AppAlert'
import AppLoader from './AppLoader'
import AppTabs from './AppTabs'
import AppPopupConfirmed from './AppPopupConfirmed'
import AppPopupLoader from './AppPopupLoader'
import AppPopupAlert from './AppPopupAlert'
import AppEmpty from './AppEmpty'
import AppPopupQrCodeSmall from './AppPopupQrCodeSmall'

const payload = {
  id: '',
  reservation_list_id: '',
  name: '',
  phone: '',
  address: '',
  comments: '',
  rsvp: '',
  present_type: 'not-present',
  attendance: 1,
  is_present: 1,
  status: 'active',
  is_available: 1,
  invitation_id: '',
  reservation_schedule_id: '',
}

export default {
  name: 'AppReservation',
  data() {
    return {
      selectedIndex: 0,
      tabs: [
        { id: 1, label: 'Semua', val: '0', status: 'active' },
        { id: 2, label: 'Hadir', val: '0', status: '' },
        { id: 3, label: 'Tidak', val: '0', status: '' },
      ],
      titleLoader: 'Mohon Tunggu ...',
      titleConfirmed: 'Simpan kehadiran di Reservasi ?',
      titleAlert: 'Data kehadiran sudah ditambahkan !',
      iconAlert: '',
      visibleAlert: false,
      visiblePopup: false,
      visibleLoader: false,
      visibleAlertSave: false,
      visibleLoaderAction: false,
      rawDatas: [],
      datas: [],
      formData: { ...payload },
      formMessage: null,
    }
  },
  components: {
    AppLoader,
    AppAlert,
    AppTabs,
    AppPopupConfirmed,
    AppPopupLoader,
    AppPopupAlert,
    AppEmpty,
    AppPopupQrCodeSmall,
  },
  mounted() {
    this.formData = {
      ...this.formData,
      name: this.guestName,
    }
    if (this.data) {
      this.formData = {
        ...this.formData,
        id: this.data.id,
        reservation_list_id: this.data.reservation_list_id,
        rsvp: this.data.rsvp,
        comments: this.data.comments,
        present_type: this.data.present_type,
        is_present: this.data.is_present,
        attendance: this.data.attendance,
        invitation_id: this.data.invitation_id,
        reservation_schedule_id: this.data.reservation_schedule_id,
      }
    }
    this.getData(this.invStringID)
  },
  computed: {
    ...mapState({
      dataInvitation: (state) => state.guestInvitation.data,
      dataSchedules: (state) => state.guestInvitation.data.schedules,
      dataPresent: (state) => state.customerGuests.dataPresentGuestBook,
    }),
    data() {
      return this.dataInvitation && this.dataInvitation.guest
    },
    guestName() {
      let guest = ''
      const serverGuest =
        this.dataInvitation &&
        this.dataInvitation.guest &&
        this.dataInvitation.guest.name
      if (serverGuest) {
        guest = serverGuest
      } else {
        const queryGuest = this.$route.query.to
        guest = queryGuest
      }
      return guest
    },
    invitation() {
      return this.dataInvitation && this.dataInvitation.invitation
    },
    invID() {
      return this.invitation.id
    },
    invStringID() {
      return this.invitation.invitation_id
    },
    invShortLink() {
      return this.invitation.short_link
    },
    isThereGuest() {
      let status = false
      if (this.guestName) {
        status = true
      }
      return status
    },
    isEnableGuestBook() {
      return this.invitation.is_reservation_enable
    },
    isEnableQRCode() {
      return this.invitation.is_qrcode_enable
    },
    isPrivateInvitation() {
      return this.invitation.privacy === 'private'
    },
  },
  methods: {
    ...mapActions({
      setToast: 'toast/setToast',
    }),
    onChangeGuestName(value) {
      this.formData.comments = ''
      this.formData.present_type = 'not-present'
    },
    onChangePresentType(data) {
      const isPresent = data === 'will-present' ? 1 : 0
      const attendance = data === 'will-present' ? 1 : 0
      this.formData = {
        ...this.formData,
        is_present: isPresent,
        attendance: attendance,
        reservation_schedule_id: '',
      }
    },
    onChangeTabs(data) {
      this.selectedIndex = data
      if (data === 0) this.datas = this.getFilter(this.rawDatas, 'all')
      if (data === 1) this.datas = this.getFilter(this.rawDatas, 'will-present')
      if (data === 2) this.datas = this.getFilter(this.rawDatas, 'not-present')
    },
    makeToast(title) {
      const payload = {
        visible: true,
        title: title,
      }
      this.setToast(payload)
    },
    onShowPopup() {
      this.visiblePopup = !this.visiblePopup
    },
    onShowAlert() {
      this.visibleAlertSave = !this.visibleAlertSave
    },
    onClickOk() {
      this.visibleAlert = false
    },
    openAlertPopup(title = '', icon = '') {
      this.visibleAlert = true
      this.titleAlert = title
      this.iconAlert = icon
    },
    savePresentData() {
      this.formData.present_type = 'present'
      this.saveData()
    },
    async saveData() {
      this.visibleAlertSave = false
      this.visibleLoaderAction = true

      const time = new Date().getTime()
      const custom_reservation_list_id = `RL-${time}`
      const reservation_list_id = this.formData.reservation_list_id
        ? this.formData.reservation_list_id
        : custom_reservation_list_id
      const newPayload = {
        ...this.formData,
        reservation_list_id: reservation_list_id,
        custom_reservation_list_id: custom_reservation_list_id,
        invitation_id: this.invID,
      }
      const url = '/api/public/reservationPost'

      const rest = await axios.post(url, newPayload)

      if (rest && rest.status === 200) {
        this.visibleLoaderAction = false
        this.visiblePopup = false

        const data = rest.data.data
        if (data.length !== 0) {
          this.formData = {
            ...payload,
            id: data.id,
            reservation_list_id: data.reservation_list_id,
            name: data.name,
            rsvp: data.rsvp,
            comments: data.comments,
            present_type: data.present_type,
            is_present: data.is_present,
            attendance: data.attendance,
            invitation_id: data.invitation_id,
            reservation_schedule_id: data.reservation_schedule_id,
          }
          this.formMessage = null
          this.getData(this.invStringID)
          this.makeToast('Data kamu sudah tersimpan')
        } else {
          this.formMessage = rest.data.message
          this.visiblePopup = true
        }
      } else {
        this.visibleLoaderAction = false
        this.openAlertPopup(
          'Data kamu gagal di simpan !',
          'far fa-4x fa-times-circle'
        )
      }
    },
    async getData(id) {
      this.visibleLoader = true

      const url = '/api/public/reservationByInvID'
      const payload = {
        invitation_id: id,
      }
      const rest = await axios.post(url, payload)

      if (rest && rest.status === 200) {
        const data = rest.data.data
        const total_not_present = parseInt(rest.data.total_not_present)
        const total_present = parseInt(rest.data.total_present)
        const total_will_present =
          parseInt(rest.data.total_will_present) + total_present
        const total_all = total_will_present + total_not_present
        this.visibleLoader = false
        this.tabs[0].val = total_all ? total_all : 0
        this.tabs[1].val = total_will_present ? total_will_present : 0
        this.tabs[2].val = total_not_present ? total_not_present : 0
        this.rawDatas = data
        this.datas = this.getFilter(data, 'all')
        this.selectedIndex = 0
      } else {
        this.visibleLoader = false
      }
    },
    getFilter(data, value = '') {
      let payload = []
      if (value === 'all') {
        data.map((dt) => {
          if (dt.present_type !== 'waiting-response') {
            payload.push(dt)
          }
        })
      }
      if (value === 'will-present') {
        data.map((dt) => {
          if (
            dt.present_type === 'present' ||
            dt.present_type === 'will-present'
          ) {
            payload.push(dt)
          }
        })
      }
      if (value === 'not-present') {
        data.map((dt) => {
          if (dt.present_type === 'not-present') {
            payload.push(dt)
          }
        })
      }
      if (value === 'waiting') {
        data.map((dt) => {
          if (dt.present_type === 'waiting-response') {
            payload.push(dt)
          }
        })
      }
      return payload
    },
  },
  props: {
    disablePopupForm: {
      type: Boolean,
      default: false,
    },
    innerClass: {
      default: null,
      required: false,
    },
    backgroundChatColor: {
      default: null,
    },
    backgroundButtonColor: {
      default: null,
    },
    textButtonColor: {
      default: null,
    },
    mainColor: {
      default: null,
    },
    title: {
      default: null,
    },
    labelNameText: {
      default: null,
    },
    descriptionNameText: {
      default: null,
    },
    labelCommentText: {
      default: null,
    },
    descriptionCommentText: {
      default: null,
    },
    labelAttendanceText: {
      default: null,
    },
    descriptionAttendanceText: {
      default: null,
    },
    labelPresentText: {
      default: null,
    },
    descriptionPresentText: {
      default: null,
    },
    labelScheduleText: {
      default: null,
    },
    descriptionScheduleText: {
      default: null,
    },
  },
}
</script>
