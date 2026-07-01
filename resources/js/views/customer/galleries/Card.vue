<template>
  <div class="width w-full flex flex-start flex-wrap">
    <div v-for="(dt, i) in data" :key="i" class="width width-row-4">
      <div
        class="margin margin-15px margin-mobile-left-0px margin-mobile-right-0px"
      >
        <div class="card bg-white shadow-sm">
          <div class="width w-full margin mb-[10px]">
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
            class="width w-full margin mb-[15px] flex flex-col items-center"
          >
            <div class="text-[11px] font-semibold text-black capitalize">
              {{ dt.gallery.type }}
            </div>
            <div class="text-[10px] normal text-gray-500">
              {{ dt.gallery.description }}
            </div>
          </div>
          <div class="width w-full flex justify-between">
            <button
              class="btn btn-sekunder btn-full"
              style="width: calc(100% - 50px)"
              @click="onDetail(dt.gallery)"
            >
              Lihat Detail
            </button>
            <el-popover placement="top-end" width="180" trigger="click">
              <div class="width w-full">
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
