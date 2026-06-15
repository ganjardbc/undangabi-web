<template>
  <div id="AppParticlesBackground" class="circle-container">
    <div v-for="i in totalParticles" :key="i" class="circle-infinity">
      <div class="circle"></div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'AppParticlesBackground',
  data() {
    return {
      totalParticles: 100,
    }
  },
}
</script>
