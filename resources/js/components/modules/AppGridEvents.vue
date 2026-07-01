<template>
  <div class="flex center flex-wrap">
    <div v-for="(dt, i) in data" :key="i" class="width width-row-2">
      <div class="p-4 padding-15-px">
        <div
          class="card bg-white shadow-sm border-radius content-center"
          style="
            overflow: unset;
            padding-top: 80px;
            padding-bottom: 60px;
            margin-top: 40px;
          "
        >
          <div
            style="
              position: absolute;
              top: -40px;
              left: 0;
              width: 100%;
              margin: auto;
            "
          >
            <div
              class="image image-80px image-center image-circle shadow-sm bg-white"
            >
              <i
                class="post-middle-absolute fa fa-lg fa-heart"
                :style="`color: ${mainColor ? mainColor : '#AEBEA4'};`"
              ></i>
            </div>
          </div>
          <h2
            :class="`fonts fonts-20 black semibold ${mainFont ? mainFont : 'Bodoni'}`"
            :style="`color: ${mainColor ? mainColor : '#AEBEA4'};`"
          >
            {{ dt.title }}
          </h2>
          <div class="text-[12px] text-gray-500">{{ dt.description }}</div>
          <div style="margin-top: 42px; margin-bottom: 42px">
            <div class="text-[12px] text-black">
              {{ dt.date | moment('dddd, Do MMMM YYYY') }}
            </div>
            <b
              :class="`fonts fonts-18 black semibold ${mainFont ? mainFont : 'Bodoni'}`"
            >
              {{ dt.time }}
            </b>
          </div>
          <div class="text-[12px] text-gray-500">{{ dt.address }}</div>
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
      required: true,
    },
    mainFont: {
      default: null,
    },
    mainColor: {
      default: null,
    },
  },
}
</script>
