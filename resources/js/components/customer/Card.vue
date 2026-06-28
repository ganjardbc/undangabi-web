<template>
  <div class="display-flex display-mobile left wrap">
    <div v-for="(dt, i) in data" :key="i" class="width width-row-3">
      <div style="margin: 15px">
        <div class="card bg-white box-shadow">
          <div class="display-flex space-between align-center">
            <div class="width width-50px">
              <div
                class="image image-padding"
                :style="`background-image: url(${dt.invitation ? invitationImageThumbnailUrl + dt.invitation.profile : ''});`"
              >
                <i
                  v-if="!dt.invitation.profile"
                  class="post-middle-absolute fa fa-lg fa-image"
                ></i>
              </div>
            </div>
            <div
              :class="`card-capsule ${dt.invitation.status === 'active' ? 'active' : ''}`"
              style="text-transform: capitalize; display: inline-block"
            >
              {{ dt.invitation.status }}
            </div>
          </div>
          <div
            class="width width-100 padding padding-top-15px padding-bottom-15px"
          >
            <h2
              class="fonts fonts-12 semibold black margin margin-bottom-5px"
              v-html="dt.invitation.title"
            />
            <div class="display-flex">
              <div class="width width-30">
                <div class="fonts fonts-10 black">Tema</div>
              </div>
              <div class="width width-70">
                <div class="fonts fonts-10 black">
                  : {{ dt.theme && dt.theme.name }}
                </div>
              </div>
            </div>
            <div class="display-flex">
              <div class="width width-30">
                <div class="fonts fonts-10 black">Paket</div>
              </div>
              <div class="width width-70">
                <div class="fonts fonts-10 black capitalize">
                  :
                  {{
                    dt.invitation.type === 'diamond'
                      ? 'Gold'
                      : dt.invitation.type
                  }}
                </div>
              </div>
            </div>
            <div class="display-flex">
              <div class="width width-30">
                <div class="fonts fonts-10 black">Pembayaran</div>
              </div>
              <div class="width width-70">
                <div class="fonts fonts-10 black capitalize">
                  :
                  {{
                    dt.invitation.payment_status ? 'Sudah Bayar' : 'Belum Bayar'
                  }}
                </div>
              </div>
            </div>
            <div class="display-flex">
              <div class="width width-30">
                <div class="fonts fonts-10 black">Privasi</div>
              </div>
              <div class="width width-70">
                <div class="fonts fonts-10 black capitalize">
                  :
                  {{
                    dt.invitation.privacy === 'public' ? 'Public' : 'Private'
                  }}
                </div>
              </div>
            </div>
          </div>
          <div
            v-if="!dt.invitation.payment_status"
            class="width width-100 padding padding-bottom-15px"
          >
            <el-alert
              title="Segera lakukan pembayaran untuk undangan ini."
              type="error"
              :closable="false"
            >
            </el-alert>
          </div>
          <div class="width width-100 display-flex space-between">
            <router-link
              :to="{
                name: 'invitation-home',
                params: {
                  id: dt.invitation.invitation_id,
                },
              }"
              class="btn btn-sekunder btn-div"
              :style="`width: ${dt.invitation.status === 'active' ? 'calc(100% - 55px)' : '100%'};`"
            >
              Kelola Undangan
            </router-link>
            <router-link
              v-if="dt.invitation.status === 'active'"
              :to="{
                name: 'generate-only',
                params: {
                  id: dt.invitation.short_link,
                },
              }"
              target="_blank"
              class="btn btn-sekunder btn-icon"
              style="padding: 0"
            >
              <i class="far fa-lw fa-envelope-open"></i>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import VueCountdown from '@chenfengyuan/vue-countdown'

export default {
  props: {
    data: null,
  },
  components: {
    VueCountdown,
  },
}
</script>
