<template>
  <div
    id="AppLoader"
    class="flex center items-center"
    style="width: calc(100% - 30px); margin: auto; padding: 15px"
  >
    <div style="width: 25px">
      <i class="fa fa-lw fa-spinner fa-spin" />
    </div>
    <div class="micro font-bold">
      {{ title ? title : 'Mohon Tunggu..' }}
    </div>
  </div>
</template>

<script>
export default {
  name: 'AppLoader',
  props: {
    title: {
      type: String,
      required: false,
    },
  },
}
</script>
