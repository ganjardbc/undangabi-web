<template>
  <div id="App" class="display-popup">
    <div class="post-middle-absolute width width-400px width-mobile">
      <div class="p-4 p-[15px]">
        <div class="card shadow-sm bg-white" style="padding: 0; width: 100%">
          <div
            class="p-4 p-[15px] flex justify-between items-center"
          >
            <div class="text-[11px] font-semibold text-black">
              {{ title ? title : 'Popup Component' }}
            </div>
            <button class="btn btn-white btn-icon" @click="onClose">
              <i class="fa fa-lg fa-times"></i>
            </button>
          </div>
          <div
            class="change-scrollbar-no-hover"
            style="overflow-y: auto; max-height: calc(100vh - 300px)"
          >
            <slot />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'App',
  props: {
    title: null,
  },
  components: {},
  methods: {
    onClose() {
      this.$emit('onClose')
    },
  },
}
</script>
