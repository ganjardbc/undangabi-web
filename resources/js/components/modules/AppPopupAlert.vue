<template>
  <div id="App" class="display-popup">
    <div class="post-middle-absolute width width-400px width-mobile">
      <div class="p-4 p-[15px]">
        <div class="card shadow-sm bg-white">
          <div class="p-4 padding-30px">
            <div class="flex flex-col items-center">
              <i
                :class="`fonts fonts-64 primary ${icon ? icon : 'far fa-4x fa-check-circle'}`"
              ></i>
              <div
                class="text-[12px] font-semibold text-black items-center margin margin-top-30px margin-bottom-30px"
              >
                {{ title }}
              </div>
              <button class="btn btn-main btn-full" @click="onClickOk">
                {{ enableEnglish ? 'Ok, I Understand' : 'Ok, Saya Mengerti' }}
              </button>
            </div>
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
    icon: null,
    enableEnglish: false,
  },
  methods: {
    onClickOk() {
      this.$emit('onClickOk')
    },
  },
}
</script>
