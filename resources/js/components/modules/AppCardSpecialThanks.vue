<template>
  <div id="App">
    <div
      class="flex flex-row center flex-wrap"
      style="text-align: center; width: 100%"
    >
      <div
        v-for="(dt, i) in data"
        :key="i"
        class="width w-full md:w-[calc(33.33%-16px)] width-mobile"
      >
        <div
          class="p-4 p-[15px] padding-mobile-left-0 padding-mobile-right-0"
        >
          <div
            :class="`card bg-white box-shadow content-center ${enableAnimation && 'theme-invitation-animate'}`"
            :style="`
                            border-radius: ${customBorderRadius ? customBorderRadius : '0'}; 
                            overflow: unset; 
                            padding-top: 20px; 
                            padding-bottom: 20px;
                        `"
          >
            <div
              v-if="dt.image"
              class="width width-35 width-center"
              style="margin-bottom: 20px"
            >
              <div
                :class="`image image-half-padding ${enableAnimation && 'theme-invitation-animate'}`"
                :style="`
                                    background-size: contain; 
                                    background-image: url(${specialthankImageThumbnailUrl + dt.image}); 
                                    background-color: ${customBackground ? customBackground : '#fff'};
                                `"
              ></div>
            </div>
            <div
              :class="`fonts fonts-11 black ${customMainFont ? customMainFont : ''} ${enableAnimation && 'theme-invitation-animate'}`"
              v-html="dt.name"
            ></div>
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
    data: {
      default: null,
    },
    enableAnimation: {
      default: false,
    },
    customBackground: {
      default: null,
    },
    customBorderRadius: {
      default: null,
    },
    customMainFont: {
      default: null,
    },
  },
}
</script>
