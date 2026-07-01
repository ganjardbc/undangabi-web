<template>
  <div id="App" class="display-popup">
    <div
      class="post-middle-absolute card shadow-sm bg-white width width-350px"
    >
      <div class="p-4 padding-30px">
        <div class="flex flex-col items-center">
          <i class="fonts-64 primary far fa-4x fa-question-circle"></i>
          <div
            class="text-[12px] font-semibold text-black margin margin-top-30px margin-bottom-30px"
          >
            {{ title }}
          </div>
          <div class="flex justify-between width w-full">
            <button class="btn btn-grey width width-48" @click="onClickNo">
              Batalkan
            </button>
            <button class="btn btn-main width width-48" @click="onClickYes">
              Iya, Lanjutkan
            </button>
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
  methods: {
    onClickNo() {
      this.$emit('onClickNo')
    },
    onClickYes() {
      this.$emit('onClickYes')
    },
  },
}
</script>
