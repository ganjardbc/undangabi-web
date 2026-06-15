<template>
  <div class="display-flex align-center">
    <button
      class="btn btn-white btn-icon margin margin-right-10px"
      @click="$router.back()"
    >
      <i class="fa fa-lg fa-arrow-left"></i>
    </button>
    <div class="fonts fonts-16 semibold black">{{ title }}</div>
  </div>
</template>
<script>
export default {
  props: {
    title: {
      type: String,
      default: 'Go Back',
    },
  },
}
</script>
