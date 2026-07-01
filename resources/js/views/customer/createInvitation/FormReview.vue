<template>
  <div id="App">
    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black margin mb-[15px]">
        Informasi
      </div>
      <div class="p-4 padding-bottom-5px flex">
        <div class="width width-200px text-[11px] font-semibold text-black">
          ID Undangan
        </div>
        <div class="width w-full text-[11px] normal text-black">
          : {{ form.invitation_id }}
        </div>
      </div>
      <div
        v-if="errorMessage.invitation_id"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.invitation_id[0] }}
      </div>

      <div class="p-4 padding-bottom-5px flex">
        <div class="width width-200px text-[11px] font-semibold text-black">
          Short Link
        </div>
        <div class="width w-full text-[11px] normal text-black">
          : {{ form.short_link }}
        </div>
      </div>
      <div
        v-if="errorMessage.short_link"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.short_link[0] }}
      </div>

      <div class="p-4 padding-bottom-5px flex">
        <div class="width width-200px text-[11px] font-semibold text-black">Judul</div>
        <div class="width w-full text-[11px] normal text-black">
          : {{ form.title }}
        </div>
      </div>
      <div
        v-if="errorMessage.title"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.title[0] }}
      </div>

      <div class="p-4 padding-bottom-5px flex">
        <div class="width width-200px text-[11px] font-semibold text-black">
          Tanggal Acara
        </div>
        <div class="width w-full text-[11px] normal text-black">
          : {{ form.date | moment('dddd, Do MMMM YYYY') }}
        </div>
      </div>
      <div
        v-if="errorMessage.date"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.date[0] }}
      </div>

      <div v-if="form.time" class="p-4 padding-bottom-5px flex">
        <div class="width width-200px text-[11px] font-semibold text-black">
          Jam Acara
        </div>
        <div class="width w-full text-[11px] normal text-black">
          : {{ form.time }} {{ form.time_zone }}
        </div>
      </div>
      <div
        v-if="errorMessage.date"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.date[0] }}
      </div>

      <div class="p-4 padding-bottom-5px flex">
        <div class="width width-200px text-[11px] font-semibold text-black">
          Alamat / Deskripsi
        </div>
        <div class="width w-full text-[11px] normal text-black">
          : {{ form.description }}
        </div>
      </div>
      <div
        v-if="errorMessage.description"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.description[0] }}
      </div>
    </div>

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Paket</div>
      <div
        v-if="errorMessage.type"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.type[0] }}
      </div>
      <div
        class="card bg-white border-full margin margin-top-15px mb-[15px]"
      >
        <div
          class="flex justify-between items-center margin mb-[15px]"
        >
          <div class="width width-55px">
            <div class="image image-padding bg-grey">
              <i class="post-middle-absolute fa fa-lg fa-image"></i>
            </div>
          </div>
          <div class="width width-100px flex justify-end">
            <button class="btn btn-main btn-icon">
              <i class="fa fa-lg fa-check-circle"></i>
            </button>
          </div>
        </div>
        <div class="width w-full">
          <div class="text-[11px] font-semibold text-black">
            {{ selectedPacket.title }}
          </div>
          <div class="text-[10px] normal text-gray-500">
            {{ selectedPacket.price }}
          </div>
        </div>
      </div>
    </div>

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Tema</div>
      <div
        v-if="errorMessage.theme_id"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.theme_id[0] }}
      </div>
      <div
        class="card bg-white border-full margin margin-top-15px mb-[15px]"
      >
        <div
          class="flex justify-between items-center margin mb-[15px]"
        >
          <div class="width width-55px">
            <div
              class="image image-padding bg-grey"
              :style="`background-image: url(${themeImageThumbnailUrl + selectedTheme.image});`"
            >
              <i
                v-if="!selectedTheme.image"
                class="post-middle-absolute fa fa-lg fa-image"
              ></i>
            </div>
          </div>
          <div class="width width-100px flex justify-end">
            <button class="btn btn-main btn-icon">
              <i class="fa fa-lg fa-check-circle"></i>
            </button>
          </div>
        </div>
        <div class="width w-full">
          <div class="text-[11px] font-semibold text-black">
            {{ selectedTheme.name }}
          </div>
          <div class="text-[10px] normal text-gray-500">
            {{ selectedTheme.description }}
          </div>
        </div>
      </div>
    </div>

    <div class="card bg-white shadow-sm margin margin-bottom-20px">
      <div class="fonts-14 font-semibold text-black">Lagu Latar</div>
      <div
        v-if="errorMessage.song_id"
        class="fonts-12px red margin mb-[5px]"
      >
        {{ errorMessage.song_id[0] }}
      </div>
      <div
        class="card bg-white border-full margin margin-top-15px mb-[15px]"
      >
        <div
          class="flex justify-between items-center margin mb-[15px]"
        >
          <div class="width width-55px">
            <div class="image image-padding bg-grey">
              <i class="post-middle-absolute fa fa-lg fa-microphone"></i>
            </div>
          </div>
          <div class="width width-100px flex justify-end">
            <button class="btn btn-main btn-icon">
              <i class="fa fa-lg fa-check-circle"></i>
            </button>
          </div>
        </div>
        <div class="width w-full">
          <div class="text-[11px] font-semibold text-black">
            {{ selectedSong.name }}
          </div>
          <div class="text-[10px] normal text-gray-500">
            {{ selectedSong.description }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import moment from 'moment'
import { mapState, mapGetters } from 'vuex'

export default {
  name: 'App',
  computed: {
    ...mapGetters({
      invitationData: 'customerInvitation/selectedData',
      invitationLoading: 'customerInvitation/loading',
    }),
    ...mapState({
      form: (state) => state.customerInvitation.form,
      errorMessage: (state) => state.customerInvitation.errorMessage,
      selectedTheme: (state) => state.customerInvitation.selectedTheme,
      selectedSong: (state) => state.customerInvitation.selectedSong,
      selectedPacket: (state) => state.customerInvitation.selectedPacket,
      dataPaket: (state) => state.customerPacket.data,
    }),
    selectedDataPaket() {
      return this.dataPaket.find((item) => item.value === this.form.type)
    },
  },
}
</script>
