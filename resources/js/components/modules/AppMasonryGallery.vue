<template>
  <div id="AppMasonryGallery">
    <div class="theme-masonry-gallery">
      <div class="card-masonry" v-for="(item, i) in dataGallery" :key="i">
        <img
          class="img shadow-sm"
          style="cursor: pointer"
          :src="item.thumbnail"
          alt=""
          @click="onOpenGallery(item)"
        />
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
  name: 'AppMasonryGallery',
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
