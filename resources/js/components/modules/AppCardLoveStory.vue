<template>
  <div id="AppCardLoveStory" class="theme-love-story">
    <div
      v-for="(dt, i) in data"
      :key="i"
      :class="`container-love-story ${i % 2 === 0 ? 'container__card' : 'container__card-reverse'}`"
    >
      <div
        class="container__line"
        :style="`background-color: ${customMainColor};`"
      ></div>
      <div class="container__left reverse-left">
        <div v-if="dt.image" class="container__image theme-invitation-animate">
          <div
            class="image image-padding image-center box-shadow bg-white"
            :style="`border-radius: ${customBorderRadius};`"
          >
            <img
              v-if="dt.image"
              :src="loveStoryImageCoverUrl + dt.image"
              alt=""
            />
            <i
              v-else
              :class="`post-middle-absolute ${customIcon}`"
              :style="`color: ${customMainColor};`"
            ></i>
          </div>
        </div>
      </div>
      <div class="container__middle">
        <div
          class="image image-50px image-circle image-center box-shadow theme-invitation-animate"
          :style="`background-color: ${customMainColor};`"
        >
          <i
            :class="`post-middle-absolute ${customIcon}`"
            :style="`color: ${customIconColor};`"
          ></i>
        </div>
      </div>
      <div class="container__right reverse-right">
        <div
          :class="`fonts ${customMainFontSize} black ${customMainFont} ${customMainFontWeight} theme-invitation-animate`"
          :style="`color: ${customMainColor};`"
        >
          {{ dt.title }}
        </div>
        <div
          :class="`fonts ${customPrimaryFontSize} black ${customPrimaryFont} theme-invitation-animate`"
          :style="`color: ${customPrimaryColor}; margin-bottom: 5px;`"
        >
          {{ dt.date | moment('Do MMMM YYYY') }}
        </div>
        <div
          :class="`fonts ${customPrimaryFontSize} black ${customPrimaryFont} theme-invitation-animate`"
          :style="`color: ${customPrimaryColor};`"
        >
          {{ dt.description }}
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'AppCardLoveStory',
  props: {
    data: {
      default: null,
    },
    enableAnimation: {
      default: false,
    },
    enableEnglish: {
      default: false,
    },
    customMainColor: {
      default: '#50607D',
    },
    customPrimaryColor: {
      default: '#50607D',
    },
    customIconColor: {
      default: '#fff',
    },
    customMainFont: {
      default: 'RoxboroughCF',
    },
    customPrimaryFont: {
      default: 'Graphik',
    },
    customMainFontSize: {
      default: 'fonts-24',
    },
    customPrimaryFontSize: {
      default: 'fonts-12',
    },
    customMainFontWeight: {
      default: 'weight-bold',
    },
    customPrimaryFontWeight: {
      default: 'normal',
    },
    customBorderRadius: {
      default: '7px',
    },
    column: {
      default: null,
    },
    customIcon: {
      default: 'fa fa-lg fa-heart',
    },
  },
  created() {
    if (this.enableEnglish) {
      this.$moment.locale('en-in')
    } else {
      this.$moment.locale('id')
    }
  },
}
</script>
