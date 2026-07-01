<template>
  <div id="App" class="display-popup">
    <div class="post-middle-absolute width width-400px width-mobile">
      <div class="p-4 p-[15px]">
        <div class="card shadow-sm bg-white">
          <div class="p-4 padding-30px">
            <div class="flex flex-col items-center">
              <i class="fonts-64 primary fa fa-4x fa-spin fa-spinner"></i>
              <div class="text-[12px] font-semibold text-black margin margin-top-30px">
                {{ title ? title : 'Mohon Tunggu' }}
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
  },
}
</script>
