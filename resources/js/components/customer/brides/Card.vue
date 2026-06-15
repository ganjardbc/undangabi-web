<template>
  <div id="App" class="width width-100">
    <div
      v-for="(dt, i) in data"
      :key="i"
      class="card bg-white box-shadow margin margin-top-15px margin-bottom-15px"
    >
      <div class="width width-100">
        <div
          class="width width-100 margin margin-bottom-15px padding padding-bottom-15px border-bottom"
        >
          <div
            class="display-flex space-between align-center margin margin-bottom-15px"
          >
            <div class="width width-50px">
              <div
                class="image image-padding image-circle bg-grey"
                :style="`background-image: url(${brideImageThumbnailUrl + dt.bride.image});`"
              >
                <i
                  v-if="!dt.bride.image"
                  class="post-middle-absolute fa fa-lg fa-user-friends"
                ></i>
              </div>
            </div>
            <div
              :class="
                'card-capsule ' + (dt.bride.status === 'active' ? 'active' : '')
              "
              style="text-transform: capitalize"
            >
              {{ dt.bride.status }}
            </div>
          </div>
          <div class="fonts fonts-11 semibold black">{{ dt.bride.name }}</div>
          <div class="fonts fonts-11 normal black">{{ dt.bride.nick_name }}</div>
        </div>
        <div class="width width-100 display-flex flex-end">
          <button
            class="btn btn-sekunder"
            style="margin-right: 10px"
            @click="onDetail(dt.bride)"
          >
            Lihat Detail
          </button>
          <el-popover placement="top-end" width="180" trigger="click">
            <div class="width width-100">
              <button
                class="btn btn-white btn-full btn-align-left"
                @click="onUpdateCover(dt.bride)"
              >
                <i class="icn icn-left fa fa-lw fa-camera"></i> Ubah Cover
              </button>
              <button
                class="btn btn-white btn-full btn-align-left"
                @click="onEdit(dt.bride)"
              >
                <i class="icn icn-left fa fa-lw fa-edit"></i> Edit Data
              </button>
              <button
                class="btn btn-white btn-full btn-align-left"
                @click="onDelete(dt.bride)"
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
