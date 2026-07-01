<template>
  <div class="bg-surface-card bg-opacity-60 border-y border-hairline">
    <div class="max-w-5xl mx-auto px-6 py-12">
      <div class="grid grid-cols-3 divide-x divide-hairline">
        <div v-for="(dt, i) in counters" :key="i" class="px-6 md:px-10 text-center">
          <div class="text-4xl md:text-5xl font-normal text-ink font-display -tracking-wide leading-none">{{ dt.value }}</div>
          <div class="mt-3 text-[11px] text-muted font-semibold uppercase tracking-widest font-sans" style="font-size: 11px;">{{ dt.title }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Counter',
  data() {
    return {
      counters: [
        { id: 'invitations', value: '1.2k+', title: 'Undangan' },
        { id: 'reservations', value: '10.4k+', title: 'Reservasi' },
        { id: 'guestbooks', value: '2.3k+', title: 'Buku Tamu' },
      ],
    }
  },
}
</script>
