<template>
  <div id="ThemeLayout">
    <router-view />

    <AppToast />
  </div>
</template>
<script>
import AppToast from '../modules/AppToast'

export default {
  name: 'ThemeLayout',
  components: {
    AppToast,
  },
}
</script>
