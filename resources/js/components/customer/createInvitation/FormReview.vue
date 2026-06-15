<template>
  <div id="App">
    <div class="card bg-white box-shadow margin margin-bottom-20px">
      <div class="fonts fonts-14 semibold black margin margin-bottom-15px">
        Informasi
      </div>
      <div class="padding padding-bottom-5px display-flex">
        <div class="width width-200px fonts fonts-11 semibold black">
          ID Undangan
        </div>
        <div class="width width-100 fonts fonts-11 normal black">
          : {{ form.invitation_id }}
        </div>
      </div>
      <div
        v-if="errorMessage.invitation_id"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.invitation_id[0] }}
      </div>

      <div class="padding padding-bottom-5px display-flex">
        <div class="width width-200px fonts fonts-11 semibold black">
          Short Link
        </div>
        <div class="width width-100 fonts fonts-11 normal black">
          : {{ form.short_link }}
        </div>
      </div>
      <div
        v-if="errorMessage.short_link"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.short_link[0] }}
      </div>

      <div class="padding padding-bottom-5px display-flex">
        <div class="width width-200px fonts fonts-11 semibold black">Judul</div>
        <div class="width width-100 fonts fonts-11 normal black">
          : {{ form.title }}
        </div>
      </div>
      <div
        v-if="errorMessage.title"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.title[0] }}
      </div>

      <div class="padding padding-bottom-5px display-flex">
        <div class="width width-200px fonts fonts-11 semibold black">
          Tanggal Acara
        </div>
        <div class="width width-100 fonts fonts-11 normal black">
          : {{ form.date | moment('dddd, Do MMMM YYYY') }}
        </div>
      </div>
      <div
        v-if="errorMessage.date"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.date[0] }}
      </div>

      <div v-if="form.time" class="padding padding-bottom-5px display-flex">
        <div class="width width-200px fonts fonts-11 semibold black">
          Jam Acara
        </div>
        <div class="width width-100 fonts fonts-11 normal black">
          : {{ form.time }} {{ form.time_zone }}
        </div>
      </div>
      <div
        v-if="errorMessage.date"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.date[0] }}
      </div>

      <div class="padding padding-bottom-5px display-flex">
        <div class="width width-200px fonts fonts-11 semibold black">
          Alamat / Deskripsi
        </div>
        <div class="width width-100 fonts fonts-11 normal black">
          : {{ form.description }}
        </div>
      </div>
      <div
        v-if="errorMessage.description"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.description[0] }}
      </div>
    </div>

    <div class="card bg-white box-shadow margin margin-bottom-20px">
      <div class="fonts fonts-14 semibold black">Paket</div>
      <div
        v-if="errorMessage.type"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.type[0] }}
      </div>
      <div
        class="card bg-white border-full margin margin-top-15px margin-bottom-15px"
      >
        <div
          class="display-flex space-between align-center margin margin-bottom-15px"
        >
          <div class="width width-55px">
            <div class="image image-padding bg-grey">
              <i class="post-middle-absolute fa fa-lg fa-image"></i>
            </div>
          </div>
          <div class="width width-100px display-flex flex-end">
            <button class="btn btn-main btn-icon">
              <i class="fa fa-lg fa-check-circle"></i>
            </button>
          </div>
        </div>
        <div class="width width-100">
          <div class="fonts fonts-11 semibold black">
            {{ selectedPacket.title }}
          </div>
          <div class="fonts fonts-10 normal grey">
            {{ selectedPacket.price }}
          </div>
        </div>
      </div>
    </div>

    <div class="card bg-white box-shadow margin margin-bottom-20px">
      <div class="fonts fonts-14 semibold black">Tema</div>
      <div
        v-if="errorMessage.theme_id"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.theme_id[0] }}
      </div>
      <div
        class="card bg-white border-full margin margin-top-15px margin-bottom-15px"
      >
        <div
          class="display-flex space-between align-center margin margin-bottom-15px"
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
          <div class="width width-100px display-flex flex-end">
            <button class="btn btn-main btn-icon">
              <i class="fa fa-lg fa-check-circle"></i>
            </button>
          </div>
        </div>
        <div class="width width-100">
          <div class="fonts fonts-11 semibold black">
            {{ selectedTheme.name }}
          </div>
          <div class="fonts fonts-10 normal grey">
            {{ selectedTheme.description }}
          </div>
        </div>
      </div>
    </div>

    <div class="card bg-white box-shadow margin margin-bottom-20px">
      <div class="fonts fonts-14 semibold black">Lagu Latar</div>
      <div
        v-if="errorMessage.song_id"
        class="fonts fonts-12px red margin margin-bottom-5px"
      >
        {{ errorMessage.song_id[0] }}
      </div>
      <div
        class="card bg-white border-full margin margin-top-15px margin-bottom-15px"
      >
        <div
          class="display-flex space-between align-center margin margin-bottom-15px"
        >
          <div class="width width-55px">
            <div class="image image-padding bg-grey">
              <i class="post-middle-absolute fa fa-lg fa-microphone"></i>
            </div>
          </div>
          <div class="width width-100px display-flex flex-end">
            <button class="btn btn-main btn-icon">
              <i class="fa fa-lg fa-check-circle"></i>
            </button>
          </div>
        </div>
        <div class="width width-100">
          <div class="fonts fonts-11 semibold black">
            {{ selectedSong.name }}
          </div>
          <div class="fonts fonts-10 normal grey">
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
