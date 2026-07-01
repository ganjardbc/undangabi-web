<template>
  <div class="flex flex-wrap -mx-4">
    <div v-for="(dt, i) in data" :key="i" class="w-full md:w-1/2 lg:w-1/3 px-4 mb-6">
      <div class="bg-white rounded-xl border border-[#e6dfd8] p-5 hover:shadow-md transition-all duration-200 flex flex-col justify-between h-full">
        <div>
          <!-- Header (Profile Image + Status Badge) -->
          <div class="flex justify-between items-center mb-4">
            <div class="h-14 w-14 rounded-lg overflow-hidden bg-[#faf9f5] border border-[#e6dfd8] flex-shrink-0 flex items-center justify-center shadow-inner">
              <div
                v-if="dt.invitation && dt.invitation.profile"
                class="w-full h-full bg-cover bg-center"
                :style="`background-image: url(${invitationImageThumbnailUrl + dt.invitation.profile});`"
              ></div>
              <i
                v-else
                class="far fa-image text-[#8e8b82] text-xl"
              ></i>
            </div>
            <el-tag
              :type="dt.invitation.status === 'active' ? 'success' : 'warning'"
              size="small"
              class="capitalize font-semibold rounded-full border border-opacity-40"
              effect="dark"
            >
              {{ dt.invitation.status }}
            </el-tag>
          </div>

          <!-- Title and Info List -->
          <div class="mb-5">
            <h2
              class="text-xl font-serif text-[#141413] mb-3 line-clamp-1 italic"
              v-html="dt.invitation.title"
            />
            
            <div class="space-y-2 border-t border-[#e6dfd8] pt-3">
              <div class="flex text-sm">
                <span class="w-24 text-[#6c6a64] font-medium">Tema</span>
                <span class="text-[#141413]">: {{ dt.theme && dt.theme.name }}</span>
              </div>
              <div class="flex text-sm">
                <span class="w-24 text-[#6c6a64] font-medium">Paket</span>
                <span class="text-[#141413] capitalize">: {{ dt.invitation.type === 'diamond' ? 'Gold' : dt.invitation.type }}</span>
              </div>
              <div class="flex text-sm">
                <span class="w-24 text-[#6c6a64] font-medium">Pembayaran</span>
                <span 
                  :class="[ 'font-medium', dt.invitation.payment_status ? 'text-[#5db872]' : 'text-[#c64545]' ]"
                >
                  : {{ dt.invitation.payment_status ? 'Sudah Bayar' : 'Belum Bayar' }}
                </span>
              </div>
              <div class="flex text-sm">
                <span class="w-24 text-[#6c6a64] font-medium">Privasi</span>
                <span class="text-[#141413] capitalize">: {{ dt.invitation.privacy === 'public' ? 'Public' : 'Private' }}</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Alerts & Action Buttons -->
        <div class="mt-4 space-y-3">
          <div v-if="!dt.invitation.payment_status" class="w-full">
            <el-alert
              title="Undangan ini belum dibayar."
              type="error"
              :closable="false"
              show-icon
            />
          </div>

          <div class="flex items-center space-x-2.5">
            <router-link
              :to="{
                name: 'invitation-home',
                params: {
                  id: dt.invitation.invitation_id,
                },
              }"
              class="flex-1"
            >
              <el-button type="primary" class="w-full font-medium">
                Kelola Undangan
              </el-button>
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
            >
              <el-button icon="el-icon-message-solid" plain circle></el-button>
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
