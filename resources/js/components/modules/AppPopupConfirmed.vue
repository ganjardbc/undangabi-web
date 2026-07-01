<template>
  <div id="App" class="display-popup">
    <div class="post-middle-absolute width width-400px width-mobile">
      <div class="p-4 p-[15px]">
        <div class="card shadow-sm bg-white">
          <div class="p-4 padding-30px">
            <div class="flex flex-col items-center">
              <i
                class="fonts-64 primary far fa-4x fa-question-circle"
              ></i>
              <div
                class="text-[12px] font-semibold text-black items-center margin margin-top-30px margin-bottom-30px"
              >
                {{ title }}
              </div>
              <div class="flex justify-between width w-full">
                <button class="btn btn-grey width width-48" @click="onClickNo">
                  {{ enableEnglish ? 'Cancel' : 'Batalkan' }}
                </button>
                <button class="btn btn-main width width-48" @click="onClickYes">
                  {{ enableEnglish ? 'Yes, Continue' : 'Iya, Lanjutkan' }}
                </button>
              </div>
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
    enableEnglish: false,
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
