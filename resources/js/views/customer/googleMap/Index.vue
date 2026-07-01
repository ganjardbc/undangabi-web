<template>
  <div id="App">
    <AppBreadCrumb title="Google-Map" />

    <div class="width w-full">
      <div
        v-if="!isBronzeInvitation"
        class="card bg-white shadow-sm margin margin-bottom-20px margin-top-20px"
      >
        <div class="fonts-14 font-semibold text-black">Google-Map</div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Latitude</div>
          <el-input v-model="form.latitude" placeholder=""></el-input>
          <div v-if="errorMessage.latitude" class="fonts-12px red">
            {{ errorMessage.latitude }}
          </div>
        </div>
        <div class="p-4 padding-top-10px padding-bottom-5px">
          <div class="text-[11px] font-semibold text-black">Longitude</div>
          <el-input v-model="form.longitude" placeholder=""></el-input>
          <div v-if="errorMessage.longitude" class="fonts-12px red">
            {{ errorMessage.longitude }}
          </div>
        </div>
      </div>
      <div
        v-if="!isBronzeInvitation && visibleMap"
        class="card bg-white shadow-sm"
      >
        <div class="fonts-14 font-semibold text-black">Pin-point di Google-map</div>
        <div class="width w-full p-4 pt-[15px]">
          <GmapMap
            ref="mapRef"
            :center="{
              lat: parseFloat(form.latitude),
              lng: parseFloat(form.longitude),
            }"
            :zoom="19"
            style="width: 100%; height: 300px"
            :options="{
              zoomControl: true,
              mapTypeControl: true,
              scaleControl: false,
              streetViewControl: true,
              rotateControl: true,
              fullscreenControl: true,
              disableDefaultUi: false,
            }"
          >
            <GmapMarker
              ref="myMarker"
              :position="
                google &&
                new google.maps.LatLng(
                  parseFloat(form.latitude),
                  parseFloat(form.longitude)
                )
              "
            />
          </GmapMap>
        </div>
      </div>
    </div>

    <div class="invitation-main-footer">
      <div
        class="invitation-main-footer-container bg-white shadow-sm flex items-center justify-end"
      >
        <button class="btn btn-main btn-full" @click="submitData">
          <i class="icn icn-left fa fa-lg fa-plus-circle"></i> Simpan Data
          Lokasi Acara
        </button>
      </div>
    </div>

    <AppPopupConfirmed
      v-if="visibleConfirmed"
      :title="titleConfirmed"
      @onClickNo="onClickNo"
      @onClickYes="onClickYes"
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
import { gmapApi } from 'vue2-google-maps'
import { mapState, mapActions, mapGetters } from 'vuex'
import AppPopupConfirmed from '../../../components/modules/AppPopupConfirmed'
import AppPopupAlert from '../../../components/modules/AppPopupAlert'
import AppPopupLoader from '../../../components/modules/AppPopupLoader'
import AppEmpty from '../../../components/modules/AppEmpty'
import AppBreadCrumb from '../../../components/modules/AppBreadCrumb'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Kelola Undangan - Lokasi Acara',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      visibleConfirmed: false,
      visibleAlert: false,
      visibleLoader: false,
      titleConfirmed: 'Simpan data undangan ?',
      titleAlert: 'Data undangan berhasil di simpan !',
      iconAlert: 'far fa-4x fa-check-circle',
    }
  },
  components: {
    AppPopupConfirmed,
    AppPopupAlert,
    AppPopupLoader,
    AppEmpty,
    AppBreadCrumb,
  },
  computed: {
    google: gmapApi,
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
    }),
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
    invitationId() {
      return this.$route.params.id
    },
    invitationStoreId() {
      return this.invitationData.id
    },
    invitation() {
      return this.invitationData
    },
    isBronzeInvitation() {
      return this.invitation.type === 'bronze'
    },
    isSilverInvitation() {
      return this.invitation.type === 'silver'
    },
    isGoldInvitation() {
      return (
        this.invitation.type === 'diamond' ||
        this.invitation.type === 'platinum'
      )
    },
    visibleMap() {
      return this.invitation.latitude && this.invitation.longitude
    },
  },
  methods: {
    ...mapActions({
      getCustomerInvitationById: 'customerInvitation/getByID',
      invitationUpdateData: 'customerInvitation/updateData',
    }),
    onClickNo() {
      this.visibleConfirmed = false
    },
    onClickYes() {
      this.visibleConfirmed = false
      this.updateDataCustomerInvitation()
    },
    onClickOk() {
      this.visibleAlert = false
      this.getDataCustomerInvitation()
    },
    submitData() {
      this.visibleConfirmed = true
      this.titleConfirmed = 'Simpan data lokasi acara ?'
    },
    updateDataCustomerInvitation() {
      this.visibleLoader = true
      const token = `Bearer ${this.$cookies.get('token')}`
      this.invitationUpdateData({ token })
        .then((res) => {
          if (res.data.status === 'ok') {
            this.$message('Data lokasi acara berhasil di simpan !')
          } else {
            this.visibleAlert = true
            this.titleAlert = 'Data lokasi acara gagal di simpan !'
            this.iconAlert = 'far fa-4x fa-times-circle'
          }
        })
        .finally(() => {
          this.visibleLoader = false
        })
    },
    getDataCustomerInvitation() {
      const token = `Bearer ${this.$cookies.get('token')}`
      this.getCustomerInvitationById({
        id: this.invitationId,
        token: token,
      })
    },
  },
}
</script>
