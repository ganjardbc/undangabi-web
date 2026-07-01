<template>
  <div id="AppGridGallery">
    <div class="flex flex-wrap">
      <div
        v-for="(item, i) in dataGallery"
        :key="i"
        class="width width-row-4 width-row-mobile-2"
      >
        <div
          :class="`${!disabledMargin ? 'padding padding-5px' : ''} ${enableAnimation ? 'theme-invitation-animate' : ''}`"
        >
          <div
            class="image image-padding shadow-sm"
            :style="`
                            cursor: pointer;
                            background-image: url(${item.thumbnail});
                            border-radius: 0;
                        `"
            @click="onOpenGallery(item)"
          ></div>
        </div>
      </div>
    </div>
    <vue-easy-lightbox
      :visible="visiblePopup"
      :imgs="dataGallery"
      :index="index"
      @hide="onCloseGallery"
    ></vue-easy-lightbox>
  </div>
</template>
<script>
export default {
  name: 'AppGridGallery',
  data() {
    return {
      visiblePopup: false,
      sourceImage: '',
      index: 0,
    }
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
    enableAnimation: {
      default: true,
    },
    disabledMargin: {
      default: false,
    },
  },
  computed: {
    dataGallery() {
      return this.data.map((item, index) => {
        return {
          idx: index,
          src: this.galleryImageCoverUrl + item.image,
          thumbnail: this.galleryImageThumbnailUrl + item.image,
        }
      })
    },
  },
  methods: {
    onOpenGallery(data) {
      this.visiblePopup = true
      this.index = data.idx
      this.sourceImage = this.galleryImageCoverUrl + data.src
    },
    onCloseGallery() {
      this.visiblePopup = false
    },
  },
}
</script>
