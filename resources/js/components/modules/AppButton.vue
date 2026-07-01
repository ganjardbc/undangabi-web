<template>
  <router-link
    v-if="routeName"
    :to="{ name: routeName }"
    class="no-underline inline-block"
  >
    <el-button
      :type="elType"
      :plain="elPlain"
      :round="isRadius"
    >
      {{ title }}
    </el-button>
  </router-link>
  <el-button
    v-else
    :type="elType"
    :plain="elPlain"
    :round="isRadius"
    @click="onPress"
  >
    {{ title }}
  </el-button>
</template>

<script>
export default {
  name: 'AppButton',
  props: {
    title: {
      type: String,
      required: true,
    },
    type: String,
    isRadius: Boolean,
    onPress: {
      type: Function,
      required: false,
    },
    routeName: String,
  },
  computed: {
    elType() {
      switch (this.type) {
        case 'main':
        case 'primary':
          return 'primary'
        case 'sekunder':
          return 'info'
        case 'danger':
        case 'red':
          return 'danger'
        case 'link':
          return 'text'
        default:
          return 'default'
      }
    },
    elPlain() {
      return this.type === 'sekunder'
    }
  }
}
</script>

<style scoped></style>
