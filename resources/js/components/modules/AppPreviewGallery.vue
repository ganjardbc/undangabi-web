<template>
  <div id="AppPreviewGallery" class="display-popup">
    <div class="width width-600px width-mobile post-middle">
      <div class="p-4 p-[15px]">
        <div class="width w-full bg-white shadow-sm">
          <div
            class="flex justify-between items-center border-bottom"
            style="padding: 10px 15px"
          >
            <div class="text-[11px] font-semibold text-black">Preview</div>
            <button class="btn btn-icon btn-circle btn-white" @click="onClose">
              <i class="fa fa-lg fa-times"></i>
            </button>
          </div>
          <v-zoomer
            ref="zoomer"
            style="width: 100%; height: calc(100vh - 250px)"
            :max-scale="10"
            :zooming-elastic="false"
            :zoomed.sync="zoomed"
          >
            <img
              :src="source"
              style="object-fit: contain; width: 100%; height: 100%"
            />
          </v-zoomer>
          <div
            class="flex center items-center border-top"
            style="padding: 10px 15px"
          >
            <button
              class="btn btn-small btn-sekunder"
              style="margin: 0 5px"
              :disabled="!zoomed"
              @click="$refs.zoomer.zoomOut()"
            >
              <i class="icn icn-left fa fa-lg fa-search-minus"></i> Zoom Out
            </button>
            <button
              class="btn btn-small btn-sekunder"
              style="margin: 0 5px"
              @click="$refs.zoomer.zoomIn()"
            >
              <i class="icn icn-left fa fa-lg fa-search-plus"></i> Zoom In
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'AppPreviewGallery',
  data() {
    return {
      zoomed: false,
    }
  },
  props: {
    source: {
      default: null,
      required: true,
    },
  },
  methods: {
    onClose() {
      this.$emit('onClose')
    },
  },
}
</script>
