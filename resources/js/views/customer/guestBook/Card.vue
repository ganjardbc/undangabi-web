<template>
  <div id="App" class="width width-100">
    <div
      v-for="(dt, i) in data"
      :key="i"
      class="card bg-white box-shadow margin margin-top-15px margin-bottom-15px"
    >
      <div
        class="width width-100 margin margin-bottom-15px padding padding-bottom-15px border-bottom"
      >
        <div
          class="display-flex align-center space-between margin margin-bottom-15px"
        >
          <div class="width width-50px">
            <div
              class="image image-padding bg-grey"
              :style="`background-image: url(${guestImageThumbnailUrl + dt.guest.image});`"
            >
              <i
                v-if="!dt.guest.image"
                class="post-middle-absolute fa fa-lg fa-book-open"
              ></i>
            </div>
          </div>
          <div>
            <div
              v-if="dt.guest.present_type === 'present'"
              :class="'card-capsule active'"
              style="text-transform: capitalize"
            >
              Hadir - {{ dt.guest.attendance }} Orang
            </div>
            <div
              v-if="dt.guest.present_type === 'will-present'"
              :class="'card-capsule wip'"
              style="text-transform: capitalize"
            >
              Akan Hadir - {{ dt.guest.attendance }} Orang
            </div>
            <div
              v-if="dt.guest.present_type === 'not-present'"
              :class="'card-capsule inactive'"
              style="text-transform: capitalize"
            >
              Tidak Hadir
            </div>
            <div
              v-if="dt.guest.present_type === 'waiting-response'"
              :class="'card-capsule'"
              style="text-transform: capitalize"
            >
              Menunggu
            </div>
          </div>
        </div>
        <div class="width width-100">
          <div class="fonts fonts-11 semibold black">{{ dt.guest.name }}</div>
          <div
            v-if="dt.guest.comments"
            class="fonts fonts-11 normal grey overflow-ellipsis"
          >
            <i
              class="fa fa-lw fa-comment fonts fonts-10 main"
              style="margin-right: 5px"
            ></i>
            {{ dt.guest.comments }}
          </div>
          <div
            v-if="dt.guest.address"
            class="fonts fonts-11 normal grey overflow-ellipsis"
          >
            <i
              class="fa fa-lw fa-map-marker-alt fonts fonts-10 main"
              style="margin-right: 5px"
            ></i>
            {{ dt.guest.address }}
          </div>
        </div>
      </div>

      <div class="width width-100 display-flex flex-end">
        <button
          class="btn btn-sekunder"
          style="margin-right: 10px"
          @click="onDetail(dt.guest)"
        >
          Lihat Detail
        </button>
        <el-popover placement="top-end" width="180" trigger="click">
          <div class="width width-100">
            <button
              class="btn btn-white btn-full btn-align-left"
              @click="onEdit(dt.guest)"
            >
              <i class="icn icn-left fa fa-lw fa-edit"></i> Edit Data
            </button>
            <button
              class="btn btn-white btn-full btn-align-left"
              @click="onDelete(dt.guest)"
            >
              <i class="icn icn-left fa fa-lw fa-trash-alt"></i> Hapus
            </button>
          </div>
          <button slot="reference" class="btn btn-sekunder btn-icon">
            <i class="fa fa-lw fa-ellipsis-h"></i>
          </button>
        </el-popover>
      </div>
    </div>
  </div>
</template>
<script>
import { mapGetters } from 'vuex'

export default {
  name: 'App',
  props: {
    data: null,
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
  },
  methods: {
    generateInvitationTitle(invitation, brides) {
      let invitationTitle = ''
      if (this.invitationData.category_id === 1) {
        brides.map((item, index) => {
          invitationTitle += item.name
          if (index !== brides.length - 1) {
            invitationTitle += ' & '
          }
        })
      } else {
        invitationTitle = invitation.title
      }
      return invitationTitle
    },
    onDetail(data) {
      this.$emit('onDetail', data)
    },
    onEdit(data) {
      this.$emit('onEdit', data)
    },
    onDelete(data) {
      this.$emit('onDelete', data)
    },
    onUpdateCover(data) {
      this.$emit('onUpdateCover', data)
    },
    onQrCode(data) {
      this.$emit('onQrCode', data)
    },
  },
}
</script>
