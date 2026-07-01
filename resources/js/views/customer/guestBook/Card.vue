<template>
  <div id="App" class="width w-full">
    <div
      v-for="(dt, i) in data"
      :key="i"
      class="card bg-white shadow-sm margin margin-top-15px mb-[15px]"
    >
      <div
        class="width w-full margin mb-[15px] p-4 pb-[15px] border-bottom"
      >
        <div
          class="flex items-center justify-between margin mb-[15px]"
        >
          <div class="width w-[50px]">
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
        <div class="width w-full">
          <div class="text-[11px] font-semibold text-black">{{ dt.guest.name }}</div>
          <div
            v-if="dt.guest.comments"
            class="text-[11px] normal text-gray-500 overflow-ellipsis"
          >
            <i
              class="fa fa-lw fa-comment text-[10px] main"
              style="margin-right: 5px"
            ></i>
            {{ dt.guest.comments }}
          </div>
          <div
            v-if="dt.guest.address"
            class="text-[11px] normal text-gray-500 overflow-ellipsis"
          >
            <i
              class="fa fa-lw fa-map-marker-alt text-[10px] main"
              style="margin-right: 5px"
            ></i>
            {{ dt.guest.address }}
          </div>
        </div>
      </div>

      <div class="width w-full flex justify-end">
        <button
          class="btn btn-sekunder"
          style="margin-right: 10px"
          @click="onDetail(dt.guest)"
        >
          Lihat Detail
        </button>
        <el-popover placement="top-end" width="180" trigger="click">
          <div class="width w-full">
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
