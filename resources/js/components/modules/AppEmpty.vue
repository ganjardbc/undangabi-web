<template>
  <div id="AppEmpty" class="content-center padding padding-30px">
    <div
      class="image image-200px image-circle bg-white box-shadow"
      style="margin: auto"
    >
      <i
        :class="`post-center fonts fonts-64 ${iconColor ? iconColor : 'primary'} ${icon ? icon : 'fa fa-3x fa-info-circle'}`"
      ></i>
    </div>
    <div class="fonts fonts-14 semibold align-center margin margin-top-20px">
      {{ title ? title : 'NO DATAS FOUND' }}
    </div>
    <div
      v-if="description"
      class="fonts fonts-10 black normal align-center margin margin-top-10px"
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
