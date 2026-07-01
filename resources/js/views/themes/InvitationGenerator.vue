<template>
  <div id="WebLayouts">
    <div id="header" class="box-shadow">
      <div
        id="header-container"
        style="justify-content: center; align-items: center"
      >
        <div class="hc-logo">
          <router-link
            :to="{ name: 'generate-guests' }"
            style="position: relative; width: 100%; top: 2px; left: 0"
          >
            <img :src="logo" alt="undang-abi" style="width: 100%" />
          </router-link>
        </div>
      </div>
    </div>
    <div
      v-if="data.invitation.privacy === 'private'"
      id="body"
      class="padding padding-top-15px padding-bottom-15px"
    >
      <AppEmpty title="Fitur Ini Untuk Undangan Publik" />
    </div>
    <div v-else id="body" class="padding padding-top-15px padding-bottom-15px">
      <div v-if="visibleLoader" class="display-flex center">
        <div class="card-alert box-shadow" style="padding: 0; margin: 50px 0">
          <div style="padding: 15px">
            <div class="width width-80 width-center">
              <div
                class="image image-half-padding"
                style="background-color: #fff; padding-bottom: 40%"
              >
                <img :src="logo" alt="" />
              </div>
            </div>
            <AppLoader />
          </div>
        </div>
      </div>
      <div v-else class="small-screen">
        <div style="padding: 0 15px">
          <div
            class="display-flex space-between align-center"
            style="padding-top: 15px"
          >
            <div class="fonts small semibold">Text Generator</div>
          </div>
          <div
            style="padding-top: 15px; padding-bottom: 15px"
            class="border-bottom"
          >
            <div class="field-group margin margin-bottom-15-px">
              <div class="field-label">Nama Tamu</div>
              <el-input
                v-model="guestFullName"
                placeholder=""
                clearable
                @input="onChangeGuestName"
              ></el-input>
            </div>
          </div>
          <div
            v-if="data && data.invitation"
            class="padding padding-top-15px padding-bottom-15px"
          >
            <AppTextInvitation
              :brides="generateInvitationTitle(data.invitation, data.brides)"
              :title="data.invitation.title"
              :tags="data.invitation.tag"
              :shortLink="data.invitation.short_link"
              :date="data.invitation.date"
              :location="data.invitation.description"
              :categoryId="data.invitation.category_id"
              :guestId="'generator'"
              :guestName="guestFullName ? guestFullName : 'Nama%20Tamu'"
              :customLink="customLink"
            />
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
  </div>
</template>
<script>
import axios from 'axios'
import AppLoader from '../../components/modules/AppLoader'
import AppTextInvitation from '../../components/modules/AppTextInvitation'
import AppEmpty from '../../components/modules/AppEmpty'
import logo from '../../../img/logo.png'
import FooterSecond from './FooterSecond'

export default {
  name: 'WebLayouts',
  data() {
    return {
      logo: logo,
      inv_id: '',
      data: null,
      guestName: null,
      guestFullName: null,
      visibleLoader: false,
    }
  },
  mounted() {
    this.inv_id = this.$route.params.id
    this.getData(this.inv_id)
  },
  components: {
    AppLoader,
    AppTextInvitation,
    AppEmpty,
    FooterSecond,
  },
  computed: {
    customLink() {
      const data = this.guestName ? this.guestName : 'Nama%20Tamu'
      return `${this.initUrl}/${this.data.invitation.short_link}?to=${data}`
    },
  },
  methods: {
    generateInvitationTitle(invitation, brides) {
      let invitationTitle = ''
      if (invitation && invitation.category_id === 1) {
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
    onChangeGuestName(value) {
      const data = value
      this.guestName = data.replace(/\s+/g, '%20')
      this.guestFullName = data
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
        this.visibleLoader = false
      } else {
        this.$router.push({ name: '404WEB' })
      }
    },
  },
}
</script>
