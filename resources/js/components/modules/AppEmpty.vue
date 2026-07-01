<template>
  <div id="AppEmpty" class="content-center p-4 padding-30px">
    <div
      class="image image-200px image-circle bg-white shadow-sm"
      style="margin: auto"
    >
      <i
        :class="`post-center fonts fonts-64 ${iconColor ? iconColor : 'primary'} ${icon ? icon : 'fa fa-3x fa-info-circle'}`"
      ></i>
    </div>
    <div class="fonts-14 font-semibold items-center margin margin-top-20px">
      {{ title ? title : 'NO DATAS FOUND' }}
    </div>
    <div
      v-if="description"
      class="text-[10px] text-black normal items-center margin margin-top-10px"
    >
      {{ description ? description : '' }}
    </div>
  </div>
</template>
<script>
export default {
  name: 'AppEmpty',
  props: {
    icon: null,
    iconColor: null,
    title: null,
    description: null,
  },
}
</script>
