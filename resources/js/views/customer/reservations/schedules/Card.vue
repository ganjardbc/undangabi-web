<template>
  <div class="width w-full">
    <div
      v-for="(dt, i) in data"
      :key="i"
      class="card bg-white shadow-sm margin margin-top-15px mb-[15px]"
    >
      <div
        class="flex justify-between items-center margin mb-[15px]"
      >
        <div class="width w-[50px]">
          <div class="image image-padding bg-grey">
            <i class="post-middle-absolute fa fa-lg fa-calendar-check"></i>
          </div>
        </div>
        <div
          :class="
            'card-capsule ' +
            (dt.reservationSchedule.status === 'active' ? 'active' : '')
          "
          style="text-transform: capitalize; display: inline-block"
        >
          {{ dt.reservationSchedule.status }}
        </div>
      </div>
      <div class="width w-full margin mb-[15px]">
        <div class="text-[11px] font-semibold text-black">
          {{ dt.reservationSchedule.title }}
        </div>
        <div class="text-[10px] normal text-gray-500">
          {{ dt.reservationSchedule.schedule_date | moment('D MMMM Y') }}
        </div>
        <div class="text-[10px] normal text-gray-500">
          {{ dt.reservationSchedule.schedule_time }}
          {{ dt.reservationSchedule.schedule_timezone }}
        </div>
      </div>
      <div class="width w-full flex justify-end">
        <button
          class="btn btn-sekunder"
          style="margin-right: 10px"
          @click="onDetail(dt.reservationSchedule)"
        >
          Lihat Detail
        </button>
        <el-popover placement="top-end" width="180" trigger="click">
          <div class="width w-full">
            <button
              class="btn btn-white btn-full btn-align-left"
              @click="onEdit(dt.reservationSchedule)"
            >
              <i class="icn icn-left fa fa-lw fa-edit"></i> Edit Data
            </button>
            <button
              class="btn btn-white btn-full btn-align-left"
              @click="onDelete(dt.reservationSchedule)"
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
