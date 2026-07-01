<template>
  <div class="flex items-center">
    <button
      class="btn btn-white btn-icon margin margin-right-10px"
      @click="$router.back()"
    >
      <i class="fa fa-lg fa-arrow-left"></i>
    </button>
    <div class="fonts-16 font-semibold text-black">{{ title }}</div>
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
