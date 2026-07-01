<template>
  <div class="relative overflow-hidden bg-canvas min-h-[85vh] flex items-center">
    <!-- Warm glow orbs -->
    <div class="absolute top-0 right-0 w-[600px] h-[600px] bg-primary/3 rounded-full blur-[120px] translate-x-1/3 -translate-y-1/3 pointer-events-none"></div>
    <div class="absolute bottom-0 left-0 w-[500px] h-[500px] bg-accent-amber/3 rounded-full blur-[100px] -translate-x-1/3 translate-y-1/3 pointer-events-none"></div>

    <div class="relative max-w-4xl mx-auto px-6 py-24 md:py-32 text-center w-full">
      <!-- Eyebrow badge -->
      <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-hairline bg-surface-card/60 text-ink font-medium text-xs tracking-wider uppercase mb-8">
        <span class="w-1.5 h-1.5 rounded-full bg-primary animate-pulse flex-shrink-0"></span>
        Platform Undangan Digital
      </div>

      <!-- Headline: display-xl Copernicus / Cormorant Garamond serif treatment -->
      <h1 class="leading-[1.1] -tracking-[1.5px] fonts LibreBaskerville text-center text-4xl md:text-6xl font-normal text-ink max-w-3xl mx-auto">
        Buat Moment yang Tak Terlupakan
      </h1>

      <!-- 4-spoke radial asterisk divider -->
      <div class="flex items-center justify-center gap-4 my-8">
        <div class="h-[1px] w-16 bg-gradient-to-r from-transparent to-hairline"></div>
        <svg class="w-4 h-4 text-primary" fill="currentColor" viewBox="0 0 24 24">
          <path d="M12 2a1 1 0 0 1 1 1v8h8a1 1 0 0 1 0 2h-8v8a1 1 0 0 1-2 0v-8H3a1 1 0 0 1 0-2h8V3a1 1 0 0 1 1-1z"/>
        </svg>
        <div class="h-[1px] w-16 bg-gradient-to-l from-transparent to-hairline"></div>
      </div>

      <!-- Subtitle -->
      <p class="text-base md:text-lg text-body max-w-xl mx-auto leading-relaxed font-sans">
        Dikemas dalam website yang elegan — dibuat dan dibagikan dalam hitungan menit untuk momen terindah Anda.
      </p>

      <!-- CTAs -->
      <div class="mt-10 flex flex-col sm:flex-row justify-center items-center gap-4">
        <router-link
          :to="{ name: 'how-to-orders' }"
          class="inline-flex items-center justify-center gap-2 px-8 py-4 text-sm font-semibold rounded-md text-white bg-primary hover:bg-primary-active shadow-sm transition-all duration-300 transform hover:-translate-y-0.5 min-w-[220px]"
        >
          Buat Undangan Sekarang
          <Icon icon="lucide:arrow-right" class="w-3.5 h-3.5" />
        </router-link>
        <button
          @click="onScrollTo('web-article')"
          class="inline-flex items-center justify-center px-8 py-4 text-sm font-semibold rounded-md text-ink bg-canvas border border-hairline hover:border-muted hover:bg-surface-soft transition-all duration-300 min-w-[180px]"
        >
          Lihat Katalog
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Banner',
  methods: {
    onScrollTo(link) {
      const el = document.getElementById(link)
      if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' })
    },
  },
}
</script>
