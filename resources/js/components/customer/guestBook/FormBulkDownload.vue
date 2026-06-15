<template>
  <div id="BulkUpload" class="display-popup">
    <div class="card-alert box-shadow post-middle">
      <div
        class="display-flex space-between align-center margin margin-bottom-15px"
      >
        <div class="fonts fonts-11 semibold">
          {{ label ? label : 'Buku Tamu Bulk Download' }}
        </div>
        <button class="btn btn-icon btn-white" @click="onClose">
          <i class="fa fa-lg fa-times"></i>
        </button>
      </div>
      <div class="width width-100">
        <div v-if="invitationData" class="padding padding-bottom-15px">
          <div class="fonts fonts-11 semibold black">Invitation</div>
          <div class="fonts micro black">{{ invitationData.title }}</div>
        </div>
        <div class="display-flex justify-content">
          <button
            :disabled="!invitationData.invitation_id"
            class="btn btn-main btn-full margin margin-right-5-px"
            @click="onSave"
          >
            Download File
          </button>
          <button
            class="btn btn-grey btn-full margin margin-left-5-px"
            @click="onClose"
          >
            Cancel
          </button>
        </div>
      </div>
    </div>

    <AppAlert v-if="visibleLoaderAction" :isLoader="true" />
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import AppAlert from '../../modules/AppAlert'

export default {
  data() {
    return {
      visibleLoaderAction: false,
      formMessage: null,
      dataUser: null,
    }
  },
  mounted() {
    this.dataUser = this.$cookies.get('user')
  },
  components: {
    AppAlert,
  },
  props: {
    label: {
      default: null,
    },
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
  },
  methods: {
    onSave() {
      this.downloadFile()
    },
    onClose() {
      this.$emit('onClose')
    },
    async downloadFile() {
      let url =
        '/download/guestBook/export/' + this.invitationData.invitation_id
      let routeData = this.$router.resolve({ path: url })
      window.open(routeData.href, '_blank')
    },
  },
}
</script>
