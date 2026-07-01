<template>
  <div class="flex flex-wrap -mx-4">
    <div v-for="(dt, i) in data" :key="i" class="w-full md:w-1/2 lg:w-1/3 px-4 mb-6">
      <div class="bg-white rounded-xl shadow-sm border border-gray-200/80 p-5 hover:shadow-md transition-shadow duration-200 flex flex-col justify-between h-full">
        <div>
          <!-- Header (Profile Image + Status Badge) -->
          <div class="flex justify-between items-center mb-4">
            <div class="h-12 w-12 rounded-lg overflow-hidden bg-gray-50 border border-gray-150 flex-shrink-0 flex items-center justify-center">
              <div
                v-if="dt.invitation && dt.invitation.profile"
                class="w-full h-full bg-cover bg-center"
                :style="`background-image: url(${invitationImageThumbnailUrl + dt.invitation.profile});`"
              ></div>
              <i
                v-else
                class="far fa-image text-gray-400 text-lg"
              ></i>
            </div>
            <div
              :class="[ 'px-2.5 py-1 rounded-full text-xs font-semibold uppercase tracking-wider', dt.invitation.status === 'active' ? 'bg-emerald-50 text-emerald-700 border border-emerald-100' : 'bg-amber-50 text-amber-700 border-amber-100' ]"
            >
              {{ dt.invitation.status }}
            </div>
          </div>

          <!-- Title and Info List -->
          <div class="mb-4">
            <h2
              class="text-base font-semibold text-gray-900 mb-3 line-clamp-1"
              v-html="dt.invitation.title"
            />
            
            <div class="space-y-2">
              <div class="flex text-sm">
                <span class="w-28 text-gray-500 font-medium">Tema</span>
                <span class="text-gray-900 font-normal">: {{ dt.theme && dt.theme.name }}</span>
              </div>
              <div class="flex text-sm">
                <span class="w-28 text-gray-500 font-medium">Paket</span>
                <span class="text-gray-900 capitalize">: {{ dt.invitation.type === 'diamond' ? 'Gold' : dt.invitation.type }}</span>
              </div>
              <div class="flex text-sm">
                <span class="w-28 text-gray-500 font-medium">Pembayaran</span>
                <span 
                  :class="[ 'font-medium', dt.invitation.payment_status ? 'text-emerald-600' : 'text-rose-600' ]"
                >
                  : {{ dt.invitation.payment_status ? 'Sudah Bayar' : 'Belum Bayar' }}
                </span>
              </div>
              <div class="flex text-sm">
                <span class="w-28 text-gray-500 font-medium">Privasi</span>
                <span class="text-gray-900 capitalize">: {{ dt.invitation.privacy === 'public' ? 'Public' : 'Private' }}</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Alerts & Action Buttons -->
        <div class="mt-4 space-y-3">
          <div v-if="!dt.invitation.payment_status" class="w-full">
            <el-alert
              title="Segera lakukan pembayaran untuk undangan ini."
              type="error"
              :closable="false"
              class="rounded-lg text-xs"
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
              <el-button type="primary" class="w-full">
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
              <el-button icon="el-icon-message-solid" plain></el-button>
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
