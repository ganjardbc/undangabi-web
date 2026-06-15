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
              :style="`background-image: url(${guestImageThumbnailUrl + dt.reservation.image});`"
            >
              <i
                v-if="!dt.reservation.image"
                class="post-middle-absolute fa fa-lg fa-calendar-check"
              ></i>
            </div>
          </div>
          <div>
            <div
              v-if="dt.reservation.present_type === 'will-present'"
              :class="'card-capsule active'"
              style="text-transform: capitalize"
            >
              Akan Hadir - {{ dt.reservation.attendance }} Orang
            </div>
            <div
              v-if="dt.reservation.present_type === 'not-present'"
              :class="'card-capsule inactive'"
              style="text-transform: capitalize"
            >
              Tidak Hadir
            </div>
            <div
              v-if="dt.reservation.present_type === 'waiting-response'"
              :class="'card-capsule'"
              style="text-transform: capitalize"
            >
              Menunggu
            </div>
          </div>
        </div>
        <div class="width width-100">
          <div class="fonts fonts-11 semibold black">
            {{ dt.reservation.name }}
          </div>
          <div
            v-if="dt.reservation.comments"
            class="fonts fonts-11 normal grey overflow-ellipsis"
          >
            <i
              class="fa fa-lw fa-comment fonts fonts-10 main"
              style="width: 15px"
            ></i>
            {{ dt.reservation.comments }}
          </div>
          <div
            v-if="dt.reservation.address"
            class="fonts fonts-11 normal grey overflow-ellipsis"
          >
            <i
              class="fa fa-lw fa-map-marker-alt fonts fonts-10 main"
              style="width: 15px"
            ></i>
            {{ dt.reservation.address }}
          </div>
          <div
            v-if="dt.reservation.reservation_schedule_id"
            class="fonts fonts-11 normal grey overflow-ellipsis"
          >
            <i
              class="far fa-lw fa-clock fonts fonts-10 main"
              style="width: 15px"
            ></i>
            {{ dt.schedule.title }} ({{ dt.schedule.schedule_time }}
            {{ dt.schedule.schedule_timezone }})
          </div>
        </div>
      </div>

      <div
        v-if="isPrivateInvitation"
        class="width width-100 margin margin-bottom-15px padding padding-bottom-15px border-bottom"
      >
        <AppCardCollapse
          :id="`card-collapse-reservations-${dt.reservation.guest_id}`"
          title="Lihat Kalimat Undangan"
        >
          <AppTextInvitation
            :brides="generateInvitationTitle(dt.invitation, dt.brides)"
            :title="dt.invitation.title"
            :tags="dt.invitation.tag"
            :categoryId="dt.invitation.category_id"
            :shortLink="dt.invitation.short_link"
            :date="dt.invitation.date"
            :location="dt.invitation.description"
            :guestId="dt.reservation.reservation_list_id"
            :guestName="dt.reservation.name"
            :guestAddress="dt.reservation.address"
            :guestPhone="dt.reservation.phone"
          />
        </AppCardCollapse>
      </div>

      <div class="width width-100 display-flex space-between">
        <AppPopupQrCodeSmall
          v-if="isPrivateInvitation"
          :code="`${initUrl}/${dt.invitation.short_link}/${dt.reservation.reservation_list_id}`"
          :fileName="`qr-code-${dt.invitation.short_link}-${dt.reservation.reservation_list_id}`"
          :label="dt.reservation.name"
          buttonLabel="QR Tamu"
        />
        <div v-else></div>
        <div class="display-flex flex-end">
          <button
            class="btn btn-sekunder"
            style="margin-right: 10px"
            @click="onDetail(dt.reservation)"
          >
            Lihat Detail
          </button>
          <el-popover placement="top-end" width="180" trigger="click">
            <div class="width width-100">
              <button
                class="btn btn-white btn-full btn-align-left"
                @click="onEdit(dt.reservation)"
              >
                <i class="icn icn-left fa fa-lw fa-edit"></i> Edit Data
              </button>
              <button
                class="btn btn-white btn-full btn-align-left"
                @click="onDelete(dt.reservation)"
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
  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import AppCardCollapse from '../../../modules/AppCardCollapse'
import AppTextInvitation from '../../../modules/AppTextInvitation'
import AppPopupQrCodeSmall from '../../../modules/AppPopupQrCodeSmall'

export default {
  name: 'App',
  props: {
    data: null,
  },
  components: {
    AppCardCollapse,
    AppTextInvitation,
    AppPopupQrCodeSmall,
  },
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
    }),
    isPrivateInvitation() {
      return this.invitationData.privacy === 'private'
    },
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
