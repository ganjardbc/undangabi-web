<template>
  <div class="width width-100 display-flex flex-start wrap">
    <div v-for="(dt, i) in data" :key="i" class="width width-row-4">
      <div
        class="margin margin-15px margin-mobile-left-0px margin-mobile-right-0px"
      >
        <div class="card bg-white box-shadow">
          <div class="width width-100 margin margin-bottom-10px">
            <div
              class="image image-padding bg-grey"
              :style="`background-image: url(${galleryImageThumbnailUrl + dt.gallery.image});`"
            >
              <i
                v-if="!dt.gallery.image"
                class="post-middle-absolute fa fa-lg fa-image"
              ></i>
            </div>
            <div class="float-top-right" style="top: 20px; right: 30px">
              <div
                :class="
                  'card-capsule ' +
                  (dt.gallery.status === 'active' ? 'active' : '')
                "
                style="
                  text-transform: capitalize;
                  display: inline-block;
                  margin-top: 10px;
                "
              >
                {{ dt.gallery.status }}
              </div>
            </div>
          </div>
          <div
            class="width width-100 margin margin-bottom-15px display-flex column align-center"
          >
            <div class="fonts fonts-11 semibold black capitalize">
              {{ dt.gallery.type }}
            </div>
            <div class="fonts fonts-10 normal grey">
              {{ dt.gallery.description }}
            </div>
          </div>
          <div class="width width-100 display-flex space-between">
            <button
              class="btn btn-sekunder btn-full"
              style="width: calc(100% - 50px)"
              @click="onDetail(dt.gallery)"
            >
              Lihat Detail
            </button>
            <el-popover placement="top-end" width="180" trigger="click">
              <div class="width width-100">
                <button
                  class="btn btn-white btn-full btn-align-left"
                  @click="onUpdateCover(dt.gallery)"
                >
                  <i class="icn icn-left fa fa-lw fa-camera"></i> Ubah Cover
                </button>
                <button
                  class="btn btn-white btn-full btn-align-left"
                  @click="onEdit(dt.gallery)"
                >
                  <i class="icn icn-left fa fa-lw fa-edit"></i> Edit Data
                </button>
                <button
                  class="btn btn-white btn-full btn-align-left"
                  @click="onDelete(dt.gallery)"
                >
                  <i class="icn icn-left fa fa-lw fa-trash-alt"></i> Hapus
                </button>
              </div>
              <button slot="reference" class="btn btn-sekunder btn-icon">
                <i class="fa fa-lw fa-ellipsis-h"></i>
              </button>
            </el-popover>
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
    data: null,
  },
  methods: {
    onDetail(data) {
      this.$emit('onDetail', data)
    },
    onEdit(data) {
      this.$emit('onEdit', data)
    },
    onDelete(data) {
      this.$emit('onDelete', data)
    },
    onUpdateCover(data) {
      this.$emit('onUpdateCover', data)
    },
  },
}
</script>
