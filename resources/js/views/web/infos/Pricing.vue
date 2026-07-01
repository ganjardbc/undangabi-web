<template>
  <div id="App" class="max-w-5xl mx-auto px-6 py-20 border-t" style="border-color: rgba(230, 223, 216, 0.6);">
    <!-- Section Header -->
    <div class="text-center max-w-2xl mx-auto mb-14">
      <p class="font-semibold text-primary uppercase tracking-widest mb-4 font-sans" style="font-size: 11px;">Paket & Harga</p>
      <h2 class="font-display text-4xl md:text-5xl font-bold text-ink tracking-tight">
        Harga Undangan
      </h2>
      <p class="text-sm md:text-base text-body leading-relaxed font-sans mt-4">
        Harga yang kami berikan bersahabat dan terjangkau di semua kalangan.
      </p>
    </div>

    <!-- Pricing Columns -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div v-for="(dt, i) in pricing" :key="i" class="w-full">
        <!-- Pricing Card -->
        <div
          :class="`border rounded-lg p-8 flex flex-col justify-between relative hover:shadow-md transition-all duration-300 transform hover:-translate-y-1 h-full min-h-[500px] ${
            dt.isRecomended 
              ? 'bg-surface-dark border-primary border-opacity-45 text-on-dark' 
              : 'bg-canvas border-hairline text-ink'
          }`"
        >
          <!-- Recommended Badge -->
          <div
            v-if="dt.isRecomended"
            class="absolute -top-3.5 left-1/2 transform -translate-x-1/2 bg-primary text-white text-[10px] font-semibold tracking-wider uppercase px-4 py-1.5 rounded-md shadow-sm flex items-center gap-1"
            style="font-size: 10px;"
          >
            <Icon icon="lucide:star" class="w-2.5 h-2.5" />
            <span>Direkomendasikan</span>
          </div>

          <div>
            <!-- Header -->
            <div :class="`font-display font-bold text-2xl ${dt.isRecomended ? 'text-on-dark' : 'text-ink'}`">
              {{ dt.title }}
            </div>
            
            <!-- Pricing -->
            <div class="mt-4 flex flex-col">
              <span
                v-if="dt.secondPrice"
                :class="`text-xs line-through tracking-wide ${dt.isRecomended ? 'text-on-dark-soft' : 'text-muted'}`"
              >
                {{ dt.secondPrice }}
              </span>
              <span :class="`text-4xl font-display font-bold tracking-tight mt-1 ${dt.isRecomended ? 'text-on-dark' : 'text-ink'}`">
                {{ dt.price }}
              </span>
            </div>

            <!-- Features -->
            <div
              :class="`border-t mt-6 pt-6 space-y-4 ${dt.isRecomended ? '' : 'border-hairline'}`"
              :style="dt.isRecomended ? 'border-color: rgba(230, 223, 216, 0.1);' : ''"
            >
              <div
                v-for="(sb, j) in dt.data"
                :key="j"
                class="flex items-start text-sm"
              >
                <!-- Feature Icon Status -->
                <span class="flex-shrink-0 w-5 h-5 flex items-center justify-center mr-3 mt-0.5">
                  <Icon v-if="sb.status" icon="lucide:check" class="w-4 h-4 text-emerald-500" />
                  <Icon v-else :icon="'lucide:x'" :class="`w-4 h-4 ${dt.isRecomended ? 'text-on-dark-soft text-opacity-30' : 'text-muted-soft text-opacity-40'}`" />
                </span>
                
                <span :class="`leading-normal flex-1 font-sans ${dt.isRecomended ? 'text-on-dark-soft' : 'text-body'}`">
                  {{ sb.title }}
                  <span v-if="sb.note" :class="`font-semibold ml-1 ${dt.isRecomended ? 'text-on-dark' : 'text-body-strong'}`">
                    {{ sb.note }}
                  </span>
                </span>
              </div>
            </div>
          </div>

          <!-- CTA Button -->
          <div class="mt-8">
            <a
              :href="`https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital ${dt.title}`"
              target="_blank"
              :class="`w-full inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-md font-semibold text-sm transition-all duration-300 shadow-sm ${
                dt.isRecomended
                  ? 'bg-primary hover:bg-primary-active text-white'
                  : 'bg-canvas hover:bg-surface-card border border-hairline text-ink'
              }`"
            >
              <Icon icon="lucide:shopping-cart" class="w-3.5 h-3.5" />
              <span>Pesan Sekarang</span>
            </a>
          </div>
        </div>
      </div>
    </div>

    <!-- Platinum Package Section - Styled as a Coral Callout Card -->
    <div v-if="isShowPlatinum" class="max-w-3xl mx-auto bg-primary text-white rounded-lg p-10 mt-16 text-center shadow-lg">
      <div class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-canvas bg-opacity-20 text-canvas font-semibold text-xs mb-3 font-sans">
        Custom Design
      </div>
      <h3 class="text-3xl font-normal text-canvas font-display tracking-tight">
        Paket Platinum
      </h3>
      <p class="mt-3 text-canvas text-opacity-80 text-sm md:text-base leading-relaxed max-w-lg mx-auto font-sans">
        Kamu bisa kustom tema sendiri dengan fitur-fitur dari paket Bronze, Silver atau Gold sesuai keinginan.
      </p>
      <div class="mt-4 text-3xl font-normal text-canvas font-display">
        Rp (With Deal)
      </div>
      <div class="mt-6">
        <a
          href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital Paket Platinum"
          target="_blank"
          class="inline-flex items-center justify-center gap-2 px-8 py-3.5 bg-canvas hover:bg-surface-card text-ink text-sm font-semibold rounded-md transition-all duration-300 shadow-sm hover:shadow-md"
        >
          <Icon icon="lucide:shopping-cart" class="w-3.5 h-3.5" />
          <span>Hubungi Kami</span>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'App',
  computed: {
    ...mapState({
      pricing: (state) => state.customerPacket.data,
    }),
    isShowPlatinum() {
      return this.enablePlatinumPackage
    },
  },
}
</script>
