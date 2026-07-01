<template>
  <div id="DoPayment" class="display-popup">
    <div class="post-middle-absolute width width-600px width-mobile">
      <div class="p-4 p-[15px]">
        <div class="card shadow-sm bg-white">
          <div class="flex justify-between items-center">
            <div class="text-[11px] font-semibold text-black">Lakukan Pembayaran</div>
            <button class="btn btn-white btn-icon" @click="onClose">
              <i class="fa fa-lg fa-times"></i>
            </button>
          </div>
          <div
            class="width w-full"
            style="max-height: calc(100vh - 300px); overflow-y: auto"
          >
            <div
              v-for="(dt, i) in stepOfList"
              :key="i"
              class="card-step"
              style="margin-top: 15px; margin-bottom: 15px"
            >
              <div class="number">
                <div class="val">{{ dt.number }}</div>
              </div>
              <div class="info">
                <div style="padding: 5px 15px">
                  <div
                    class="text-[11px] text-black font-semibold"
                    style="margin-bottom: 5px"
                  >
                    {{ dt.title }}
                  </div>
                  <div class="text-[11px] text-gray-500">
                    <span v-html="dt.description"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="width w-full">
            <a
              :href="`https://wa.me/6289699181669?text=Halo admin, Saya ingin melakukan pembayaran untuk undangan dengan ID *${data.invitation_id}*`"
              target="_blank"
            >
              <button class="btn btn-main btn-full">
                <i class="icn icn-left fab fa-lg fa-whatsapp"></i> Chat Admin
              </button>
            </a>
            <!-- <a :href="`https://wa.me/6289699181669?text=Halo admin, Saya ingin melakukan pembayaran untuk undangan dengan ID *${ data.invitation_id }* paket *${ invitationType(data.type) }* dan judul *${ generateTitle(data.title) }*`" target="_blank">
                            <button class="btn btn-main btn-full">
                                <i class="icn icn-left fab fa-lg fa-whatsapp"></i> Chat Admin
                            </button>
                        </a> -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'DoPayment',
  data() {
    return {
      stepOfList: [
        {
          number: '1',
          title: 'Chat Admin via WhatsApp',
          description: 'Chat Admin untuk melakukan pembayaran.',
        },
        {
          number: '2',
          title: 'Lakukan Pembayaran',
          description:
            'Admin akan memberikan No. Rekening dan harga undangan kamu sesuai dengan Paket yang dipilih.',
        },
        {
          number: '3',
          title: 'Kirim Bukti Pembayaran',
          description:
            'Kirimkan bukti pembayaran yang sudah kamu lakukan dengan memberikan Screen-Shoot atau dokumen apapun.',
        },
        {
          number: '4',
          title: 'Undangan Sudah Dibayar',
          description:
            'Admin akan mengecek pembayaran dan jika berhasil maka undangan kamu siap digunakan.',
        },
      ],
    }
  },
  props: {
    data: null,
  },
  methods: {
    onClose() {
      this.$emit('onClose')
    },
    invitationType(value) {
      const type = value === 'diamond' ? 'Gold' : value
      return type.toUpperCase()
    },
    generateTitle(value) {
      return value.replace(/&/g, 'dan')
    },
  },
}
</script>
