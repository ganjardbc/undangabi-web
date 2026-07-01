<template>
  <div class="max-w-5xl mx-auto px-6 py-20">
    <!-- Section header -->
    <div class="text-center mb-16">
      <p class="font-semibold text-primary uppercase tracking-widest mb-4 font-sans" style="font-size: 11px;">Fitur Unggulan</p>
      <h2 class="font-display text-4xl md:text-5xl font-bold text-ink leading-tight -tracking-wide">
        Semua yang Anda Butuhkan
      </h2>
      <p class="mt-5 text-body text-sm md:text-base max-w-md mx-auto leading-relaxed font-sans">
        Atur seluruh acara pernikahan dari undangan hingga pencatatan tamu — dalam satu platform.
      </p>
    </div>

    <!-- Feature grid with ghost numbers -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div
        v-for="(dt, i) in fiturs"
        :key="i"
        class="relative group p-8 rounded-lg border border-hairline bg-surface-card bg-opacity-40 hover:border-primary hover:border-opacity-40 transition-all duration-300 overflow-hidden"
      >
        <!-- Ghost number backdrop -->
        <div class="absolute -bottom-4 -right-2 text-9xl font-normal font-display leading-none select-none group-hover:text-primary group-hover:text-opacity-10 transition-colors duration-500 pointer-events-none" style="color: rgba(20, 20, 19, 0.03);">
          {{ String(i + 1).padStart(2, '0') }}
        </div>
        <!-- Icon -->
        <div class="relative w-11 h-11 rounded-md bg-primary bg-opacity-10 text-white flex items-center justify-center mb-5 flex-shrink-0">
          <Icon :icon="dt.icon" class="w-5 h-5" />
        </div>
        <!-- Content -->
        <h3 class="relative text-xl font-normal text-ink font-display mb-2">{{ dt.title }}</h3>
        <p class="relative text-body text-sm leading-relaxed font-sans">{{ dt.description }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Category',
  data() {
    return {
      fiturs: [
        {
          icon: 'lucide:mail-open',
          title: 'Undangan Digital',
          description: 'Fitur-fitur unggulan yang bisa dibagikan kapan saja.',
        },
        {
          icon: 'lucide:calendar',
          title: 'Manajemen Reservasi',
          description: 'Atur reservasi Tamu dengan jadwal real-time dan akurat.',
        },
        {
          icon: 'lucide:book-open',
          title: 'Buku Tamu Digital',
          description: 'Catat kehadiran Tamu secara digital tanpa kertas, tanpa antrian panjang.',
        },
      ],
    }
  },
}
</script>
