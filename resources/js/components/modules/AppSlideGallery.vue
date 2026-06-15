<template>
  <div id="AppSlideGallery">
    <carousel
      :per-page="1"
      :adjustableHeight="false"
      :mouse-drag="false"
      :centerMode="true"
      :loop="true"
      :autoplay="true"
      :autoplayHoverPause="true"
      :speed="2000"
      :autoplayTimeout="7000"
      :paginationSize="15"
      :paginationPadding="10"
      :navigationEnabled="navigationEnabled"
      :paginationEnabled="paginationEnabled"
      :paginationActiveColor="
        paginationActiveColor ? paginationActiveColor : '#94A986'
      "
      :paginationColor="paginationColor ? paginationColor : '#555'"
      :paginationPosition="'bottom-overlay'"
      :navigationPrevLabel="`<i class='fa fa-lg fa-chevron-left' style='color: ${navigationColor ? navigationColor : '#555'};' />`"
      :navigationNextLabel="`<i class='fa fa-lg fa-chevron-right' style='color: ${navigationColor ? navigationColor : '#555'};' />`"
    >
      <slide v-for="(dt, i) in dataGallery" :key="i">
        <div class="theme-image small">
          <img
            class="img box-shadow border-radius"
            style="cursor: pointer"
            :src="dt.src"
            alt=""
            @click="onOpenGallery(dt)"
          />
        </div>
      </slide>
    </carousel>
    <AppPreviewGallery
      v-if="visiblePopup"
      :source="sourceImage"
      @onClose="onCloseGallery"
    />
  </div>
</template>
<script>
import { Carousel, Slide } from 'vue-carousel'
import AppPreviewGallery from './AppPreviewGallery'

export default {
  name: 'AppSlideGallery',
  data() {
    return {
      visiblePopup: false,
      sourceImage: '',
      index: 0,
    }
  },
  components: {
    Carousel,
    Slide,
    AppPreviewGallery,
  },
  props: {
    data: {
      required: true,
    },
    paginationActiveColor: {
      default: null,
    },
    paginationColor: {
      default: null,
    },
    paginationPosition: {
      default: null,
    },
    navigationColor: {
      default: null,
    },
    navigationEnabled: {
      default: true,
    },
    paginationEnabled: {
      default: true,
    },
  },
  computed: {
    dataGallery() {
      return this.data.map((item) => {
        return {
          src: this.galleryImageCoverUrl + item.image,
        }
      })
    },
  },
  methods: {
    onOpenGallery(data) {
      this.visiblePopup = true
      this.sourceImage = data.src
    },
    onCloseGallery() {
      this.visiblePopup = false
    },
  },
}
</script>
