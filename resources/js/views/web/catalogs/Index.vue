<template>
  <div class="bg-canvas border-t border-hairline">
    <div class="max-w-5xl mx-auto px-6 py-20">
      <!-- Section Header -->
      <div class="text-center max-w-2xl mx-auto mb-16">
        <p class="font-semibold text-primary uppercase tracking-widest mb-4 font-sans" style="font-size: 11px;">Koleksi Tema</p>
        <h2 class="font-display text-4xl md:text-5xl font-bold text-ink leading-tight -tracking-wide">
          Katalog Undangan
        </h2>
        <p class="mt-4 text-sm md:text-base text-body leading-relaxed font-sans">
          Pilih tema yang paling mencerminkan momen spesial Anda.
        </p>
      </div>

      <!-- Catalogs List -->
      <div v-for="(catalog, i) in catalogs" :key="i" class="w-full mb-12 last:mb-0">
        <!-- Group Header with 4-spoke radial asterisk motif -->
        <div class="flex items-center gap-4 mb-8">
          <div class="h-[1px] flex-1 bg-hairline"></div>
          <div class="flex items-center gap-3">
            <svg class="w-3.5 h-3.5 text-primary" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2a1 1 0 0 1 1 1v8h8a1 1 0 0 1 0 2h-8v8a1 1 0 0 1-2 0v-8H3a1 1 0 0 1 0-2h8V3a1 1 0 0 1 1-1z"/>
            </svg>
            <h3 class="text-base font-normal text-ink font-display whitespace-nowrap">{{ catalog.groupName }}</h3>
            <span class="text-xs text-muted font-sans">({{ catalog.groupThemes.length }} tema)</span>
            <svg class="w-3.5 h-3.5 text-primary" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2a1 1 0 0 1 1 1v8h8a1 1 0 0 1 0 2h-8v8a1 1 0 0 1-2 0v-8H3a1 1 0 0 1 0-2h8V3a1 1 0 0 1 1-1z"/>
            </svg>
          </div>
          <div class="h-[1px] flex-1 bg-hairline"></div>
        </div>

        <!-- Theme Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
          <div v-for="(theme, j) in catalog.groupThemes" :key="j">
            <div class="bg-white border border-hairline rounded-lg p-5 hover:border-primary hover:border-opacity-40 hover:bg-white transition-all duration-300 flex items-start justify-between group">
              <div class="flex-1 min-w-0">
                <div class="w-8 h-8 rounded-md bg-primary bg-opacity-10 text-white flex items-center justify-center mb-3 flex-shrink-0">
                  <Icon icon="mdi:envelope" class="w-3.5 h-3.5" />
                </div>
                <h4 class="text-sm font-semibold text-ink leading-snug truncate pr-2 font-sans">{{ theme.title }}</h4>
                <span class="inline-block font-medium px-2 py-0.5 mt-1.5 rounded bg-surface-soft text-muted border border-hairline font-sans" style="font-size: 10px;">
                  {{ theme.type }}
                </span>
              </div>
              <router-link :to="theme.link" target="_blank" class="flex-shrink-0 mt-1 no-underline">
                <el-button
                  class="!w-8 !h-8 !p-0 !inline-flex !items-center !justify-center"
                >
                  <Icon icon="lucide:external-link" class="w-3.5 h-3.5" />
                </el-button>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AppLoader from '../../../components/modules/AppLoader'
import listOfCatalogs from './data'

export default {
  data() {
    return {
      visibleLoader: false,
      limit: 10,
      offset: 0,
      visibleLoadMore: false,
      catalogs: listOfCatalogs,
    }
  },
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Katalog Undangan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  components: {
    AppLoader,
  },
}
</script>
