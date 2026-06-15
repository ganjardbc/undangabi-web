<template>
  <div id="WebLayouts">
    <div id="header" class="box-shadow">
      <div id="header-container" style="align-items: center">
        <div class="hc-logo">
          <router-link
            :to="{ name: 'generate-guests' }"
            style="position: relative; width: 100%; top: 2px; left: 0"
          >
            <img :src="logo" alt="undang-abi" style="width: 100%" />
          </router-link>
        </div>

        <button class="btn btn-sekunder" @click="onOpenPopup">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Tambah Tamu
        </button>
      </div>
    </div>
    <div v-loading="visibleLoader" id="body">
      <div id="themes-guest-lists" class="small-screen">
        <div class="padding padding-bottom-15px padding-top-15px">
          <div class="width width-100 bg-white-grey display-flex">
            <div
              v-for="(dt, i) in metrics"
              :key="i"
              :class="`width width-row-3 ${i === selectedIndex ? 'bg-grey' : 'bg-white'}`"
              style="cursor: pointer"
              @click="onChangeTabs(i)"
            >
              <div :class="`${i !== metrics.length - 1 && 'border-right'}`">
                <div class="padding padding-10px content-center">
                  <div class="fonts fonts-22 semibold primary">
                    {{ dt.quantity }}
                  </div>
                  <div class="fonts fonts-9 normal black">{{ dt.label }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div
          class="padding padding-left-10px padding-right-10px padding-bottom-10px"
        >
          <div class="fonts fonts-14 black semibold">Daftar Tamu</div>
        </div>
        <div class="padding padding-left-10px padding-right-10px">
          <SearchField
            :placeholder="'Cari tamu berdasarkan nama ..'"
            @onSearch="handleSearch"
          />
        </div>
        <div class="padding padding-left-10px padding-right-10px">
          <AppEmpty
            v-if="dataGuest.length === 0"
            title="Data Tamu Tidak Ditemukan"
          />
          <div v-for="(dt, i) in filteredData" :key="i" style="margin: 15px 0">
            <div
              class="card bg-white box-shadow margin margin-top-15px margin-bottom-15px"
            >
              <div class="width width-100 padding padding-bottom-15px">
                <div
                  class="display-flex align-center space-between margin margin-bottom-15px"
                >
                  <div class="width width-25px">
                    <div
                      class="image image-padding bg-grey"
                      style="border-radius: 25px"
                    >
                      <div class="post-middle-absolute fonts fonts-11 black">
                        {{ indexMethod(i) }}
                      </div>
                    </div>
                  </div>
                  <div
                    v-if="dt.present_type === 'present'"
                    :class="'card-capsule active'"
                    style="text-transform: capitalize"
                  >
                    Hadir - {{ dt.attendance }} Orang
                  </div>
                  <div
                    v-if="dt.present_type === 'will-present'"
                    :class="'card-capsule wip'"
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
                <div class="width width-100">
                  <div class="fonts fonts-12 semibold black">{{ dt.name }}</div>
                  <div
                    v-if="dt.address"
                    class="fonts fonts-11 normal grey overflow-ellipsis"
                  >
                    <i
                      class="fa fa-lw fa-map-marker-alt fonts fonts-10 main"
                      style="margin-right: 5px"
                    ></i>
                    {{ dt.address }}
                  </div>
                </div>
              </div>
              <div class="width width-100">
                <AppCardCollapse title="Lihat Kalimat Undangan">
                  <AppTextInvitation
                    :brides="
                      generateInvitationTitle(data.invitation, dt.brides)
                    "
                    :title="data.invitation.title"
                    :tags="data.invitation.tag"
                    :categoryId="data.invitation.category_id"
                    :shortLink="data.invitation.short_link"
                    :guestId="dt.guest_id"
                    :guestName="dt.name"
                    :guestAddress="dt.address"
                    :textId="`target-invitation-${dt.guest_id}`"
                    :disabledButtonCopy="true"
                  />
                </AppCardCollapse>
              </div>
              <div class="display-flex flex-end padding padding-top-15px">
                <button
                  class="btn btn-sekunder btn-full"
                  @click="
                    onCopyInvitation(
                      `target-invitation-${dt.guest_id}`,
                      dt.name
                    )
                  "
                >
                  <i class="icn icn-left fa fa-lg fa-copy"></i> Salin Kalimat
                  Undangan
                </button>
              </div>
            </div>
          </div>

          <div
            class="display-flex flex-end align-center"
            style="padding: 15px 0"
          >
            <div class="fonts fonts-10 grey normal" style="margin-right: 10px">
              Total {{ dataGuest.length }}
            </div>
            <el-pagination
              background
              @current-change="handleCurrentChange"
              :current-page.sync="page"
              :page-size="pageSize"
              :pager-count="5"
              layout="prev, pager, next"
              :total="dataGuest.length"
            >
            </el-pagination>
          </div>
        </div>
      </div>
    </div>
    <div class="theme-footerb border-top" style="padding: 50px 0">
      <FooterSecond
        buttonBackgroundColor="#FACC48"
        buttonBorderColor="#FACC48"
        textColor="#1A1507"
        :enableBlackLogo="true"
      />
    </div>
    <div v-if="visiblePopup" class="display-popup">
      <div class="post-middle-absolute width width-400px width-mobile">
        <div class="padding padding-15px">
          <div class="card box-shadow bg-white">
            <div class="display-flex space-between align-center">
              <div class="fonts fonts-11 semibold black">Tambah Tamu</div>
              <button class="btn btn-white btn-icon" @click="onClosePopup">
                <i class="fa fa-lg fa-times"></i>
              </button>
            </div>
            <div class="padding padding-top-15px padding-bottom-15px">
              <div class="field-group margin margin-bottom-15-px">
                <div class="fonts micro black semibold">
                  Nama Lengkap <span class="fonts red">*</span>
                </div>
                <el-input
                  v-model="formData.name"
                  placeholder=""
                  clearable
                ></el-input>
                <div
                  v-if="formMessage"
                  class="fonts micro semibold"
                  style="color: red; margin-bottom: 5px"
                >
                  {{ formMessage && formMessage.name && formMessage.name[0] }}
                </div>
              </div>
              <div class="field-group">
                <div class="fonts micro black semibold">Alamat</div>
                <el-input
                  type="textarea"
                  v-model="formData.address"
                  placeholder=""
                  :rows="2"
                  clearable
                ></el-input>
                <div
                  v-if="formMessage"
                  class="fonts micro semibold"
                  style="color: red; margin-bottom: 5px"
                >
                  {{
                    formMessage && formMessage.address && formMessage.address[0]
                  }}
                </div>
              </div>
            </div>
            <div class="padding padding-top-15px display-flex flex-end">
              <button
                class="btn btn-primary"
                style="margin-right: 10px"
                @click="onClosePopup"
              >
                Kembali
              </button>
              <button class="btn btn-main" @click="saveData">Simpan</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <AppPopupConfirmed
      v-if="visibleAlertSave"
      :title="titleConfirmed"
      @onClickNo="onShowAlert"
      @onClickYes="saveData"
    />

    <AppPopupConfirmed
      v-if="visibleAlertDelete"
      :title="titleDelete"
      @onClickNo="onCloseAlertDelete"
      @onClickYes="deleteData"
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
import axios from 'axios'
import logo from '../../../img/logo.png'
import AppEmpty from '../modules/AppEmpty'
import AppLoader from '../modules/AppLoader'
import AppCardCollapse from '../modules/AppCardCollapse'
import AppTextInvitation from '../modules/AppTextInvitation'
import AppPopupConfirmed from '../modules/AppPopupConfirmed'
import AppPopupAlert from '../modules/AppPopupAlert'
import AppPopupLoader from '../modules/AppPopupLoader'
import SearchField from '../modules/SearchField'
import FooterSecond from './FooterSecond'

const payload = {
  id: '',
  guest_id: '',
  name: '',
  phone: '',
  address: '',
  comments: '',
  rsvp: '',
  present_type: 'waiting-response',
  attendance: 0,
  is_present: 0,
  status: 'active',
  is_available: 1,
  invitation_id: '',
}

export default {
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Daftar Tamu',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
    link: [{ rel: 'icon', href: 'https://undangabi.com/images/icon.png' }],
  },
  data() {
    return {
      logo: logo,
      inv_id: '',
      data: [],
      dataGuest: [],
      filterGuest: [],
      rawDataGuest: [],
      page: 1,
      pageSize: 15,
      selectedIndex: 0,
      formFilter: {
        search: '',
      },
      metrics: [
        {
          value: 1,
          label: 'Semua',
          quantity: 0,
        },
        {
          value: 2,
          label: 'Akan Hadir',
          quantity: 0,
        },
        {
          value: 3,
          label: 'Tidak Hadir',
          quantity: 0,
        },
        {
          value: 4,
          label: 'Menunggu',
          quantity: 0,
        },
      ],
      visibleLoader: false,
      visiblePopup: false,
      formData: { ...payload },
      formMessage: null,
      titleLoader: 'Mohon Tunggu ...',
      titleConfirmed: 'Tambahkan tamu ?',
      titleDelete: 'Hapus tamu ?',
      titleAlert: 'Data tamu sudah ditambahkan !',
      iconAlert: '',
      visibleAlert: false,
      visiblePopup: false,
      visibleLoader: false,
      visibleAlertSave: false,
      visibleAlertDelete: false,
      visibleLoaderAction: false,
    }
  },
  mounted() {
    this.inv_id = this.$route.params.id
    this.getData(this.inv_id)
  },
  components: {
    AppEmpty,
    AppLoader,
    AppCardCollapse,
    AppTextInvitation,
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    SearchField,
    FooterSecond,
  },
  computed: {
    filteredData() {
      return this.dataGuest.slice(
        this.pageSize * this.page - this.pageSize,
        this.pageSize * this.page
      )
    },
    invitation() {
      return this.data && this.data.invitation
    },
    invID() {
      return this.invitation.id
    },
  },
  methods: {
    indexMethod(index) {
      return index + 1 + this.pageSize * (this.page - 1)
    },
    generateInvitationTitle(invitation, brides) {
      let invitationTitle = ''
      if (brides && brides.length > 0) {
        invitationTitle = 'Pernikahan '
        brides.map((item, index) => {
          invitationTitle += item.bride.name
          if (index !== brides.length - 1) {
            invitationTitle += ' & '
          }
        })
      } else {
        invitationTitle = invitation.title
      }
      return invitationTitle
    },
    onChangeTabs(data) {
      this.selectedIndex = data
      if (data === 0) {
        this.filterGuest = this.getFilter(this.rawDataGuest, 'all')
        this.dataGuest = this.getFilter(this.rawDataGuest, 'all')
      }
      if (data === 1) {
        this.filterGuest = this.getFilter(this.rawDataGuest, 'will-present')
        this.dataGuest = this.getFilter(this.rawDataGuest, 'will-present')
      }
      if (data === 2) {
        this.filterGuest = this.getFilter(this.rawDataGuest, 'not-present')
        this.dataGuest = this.getFilter(this.rawDataGuest, 'not-present')
      }
      if (data === 3) {
        this.filterGuest = this.getFilter(this.rawDataGuest, 'waiting-response')
        this.dataGuest = this.getFilter(this.rawDataGuest, 'waiting-response')
      }
    },
    async getData(id) {
      this.visibleLoader = true

      const url = '/api/public/invitationByLink'
      const payload = {
        short_link: id,
      }
      const rest = await axios.post(url, payload)

      if (rest && rest.data.status === 'ok') {
        const data = rest.data.data
        this.data = data
        this.getDataGuests(this.data.invitation.invitation_id)
      } else {
        this.$router.push({ name: '404WEB' })
      }
    },
    async getDataGuests(id) {
      this.visibleLoader = true

      const url = '/api/public/guestByInvID'
      const payload = {
        invitation_id: id,
      }
      const rest = await axios.post(url, payload)

      if (rest && rest.status === 200) {
        const data = rest.data.data
        this.rawDataGuest = data
        this.filterGuest = this.getFilter(data, 'all')
        this.dataGuest = this.getFilter(data, 'all')
        this.visibleLoader = false
        const total_will_present = rest.data.total_will_present
        const total_not_present = rest.data.total_not_present
        const total_waiting_present = rest.data.total_waiting_present
        this.metrics[0].quantity =
          parseInt(total_will_present) +
          parseInt(total_not_present) +
          parseInt(total_waiting_present)
        this.metrics[1].quantity = total_will_present
        this.metrics[2].quantity = total_not_present
        this.metrics[3].quantity = total_waiting_present
      } else {
        this.visibleLoader = false
      }
    },
    getFilter(data, value) {
      let payload = []
      if (value === 'all') {
        payload = data
      } else {
        data.map((dt) => {
          if (dt.present_type === value) {
            payload.push(dt)
          }
        })
      }
      return payload
    },
    handleCurrentChange(value) {
      this.page = value
      this.scrollToTarget('themes-guest-lists')
    },
    handleSearch(value) {
      const lowValue = value.toLowerCase()
      const position = Array.from(lowValue).reduce(
        (a, v, i) => `${a}[^${lowValue.substr(i)}]*?${v}`,
        ''
      )
      const searching = RegExp(position)
      this.dataGuest = this.filterGuest.filter((item) => {
        const lowItem = item.name.toLowerCase()
        return lowItem.match(searching)
      })
    },
    onOpenPopup() {
      this.visiblePopup = true
    },
    onClosePopup() {
      this.visiblePopup = false
    },
    onShowAlert() {
      this.visibleAlertSave = !this.visibleAlertSave
    },
    onCloseAlertDelete() {
      this.visibleAlertDelete = false
    },
    onShowAlertDelete(value) {
      this.visibleAlertDelete = true
      this.formData = {
        ...value,
      }
    },
    onClickOk() {
      this.visibleAlert = false
    },
    openAlertPopup(title = '', icon = '') {
      this.visibleAlert = true
      this.titleAlert = title
      this.iconAlert = icon
    },
    async saveData() {
      this.visibleAlertSave = false
      this.visibleLoaderAction = true

      const time = new Date().getTime()
      const custom_guest_id = `GE-${time}`
      const guest_id = this.formData.guest_id
        ? this.formData.guest_id
        : custom_guest_id
      const newPayload = {
        ...this.formData,
        guest_id: guest_id,
        custom_guest_id: custom_guest_id,
        invitation_id: this.invID,
      }
      const url = '/api/public/guestPost'

      const rest = await axios.post(url, newPayload)

      if (rest && rest.status === 200) {
        this.visibleLoaderAction = false
        this.visiblePopup = false

        const data = rest.data.data
        if (data.length !== 0) {
          this.formData = { ...payload }
          this.formMessage = null
          this.page = 1
          this.selectedIndex = 0
          this.getDataGuests(this.data.invitation.invitation_id)
          this.$message('Data tamu berhasil disimpan')
          this.scrollToTarget('themes-guest-lists')
        } else {
          this.formMessage = rest.data.message
          this.visiblePopup = true
        }
      } else {
        this.visibleLoaderAction = false
        this.openAlertPopup(
          'Data tamu gagal di simpan !',
          'far fa-4x fa-times-circle'
        )
      }
    },
    async deleteData() {
      this.visibleAlertDelete = false
      this.visibleLoaderAction = true

      const newPayload = {
        ...this.formData,
      }
      const url = '/api/public/guestDelete'

      const rest = await axios.post(url, newPayload)

      if (rest && rest.status === 200) {
        this.visibleLoaderAction = false
        this.visiblePopup = false

        const data = rest.data.data
        if (data.length !== 0) {
          this.formMessage = null
          this.getDataGuests(this.data.invitation.invitation_id)
          this.$message('Data tamu sudah terhapus')
        } else {
          this.formMessage = rest.data.message
          this.visiblePopup = true
        }
      } else {
        this.visibleLoaderAction = false
        this.openAlertPopup(
          'Data tamu gagal di hapus !',
          'far fa-4x fa-times-circle'
        )
      }
    },
    onCopyInvitation(id, name) {
      var range = document.createRange()
      range.selectNode(document.getElementById(id))
      window.getSelection().removeAllRanges()
      window.getSelection().addRange(range)

      try {
        var successful = document.execCommand('copy')
        var msg = successful ? 'berhasil' : 'tidak dapat'
        this.$message(`Undangan ${name} ${msg} di salin`)
      } catch (err) {
        this.$message('Oops, undangan tidak dapat di salin')
      }

      window.getSelection().removeAllRanges()
    },
    scrollToTarget(id) {
      const data = document.getElementById(id).offsetTop
      document.documentElement.scrollTop = data
    },
  },
}
</script>
