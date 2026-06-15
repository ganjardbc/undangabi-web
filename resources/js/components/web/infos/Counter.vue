<template>
  <div id="App" class="main-screen" style="margin-top: 0">
    <div class="display-flex center wrap">
      <div
        v-for="(dt, i) in counters"
        :key="i"
        class="width width-row-3 width-mobile"
      >
        <div class="padding padding-15px">
          <div
            class="card bg-white box-shadow display-flex theme-feature-animate"
          >
            <div style="width: calc(100% - 65px)">
              <div
                class="fonts fonts-16px fonts-mobile-13px align-left black semibold theme-feature-animate"
                style="margin-bottom: 5px"
              >
                {{ dt.title }}
              </div>
              <div
                class="fonts fonts-42px fonts-mobile-32px align-left main semibold theme-feature-animate"
                style="line-height: 1"
              >
                {{ dt.value }}
              </div>
            </div>
            <div style="width: 50px; margin-left: 15px">
              <div
                class="image image-padding image-circle bg-white box-shadow theme-feature-animate"
              >
                <i
                  :class="`post-middle-absolute fonts fonts-18px fonts-mobile-16px primary ${dt.icon}`"
                ></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios'

export default {
  name: 'App',
  data() {
    return {
      counters: [
        {
          id: 'invitations',
          icon: 'fa fa-lg fa-envelope',
          isNew: false,
          value: '1.2k',
          title: 'Undangan',
          description: 'Jumlah undangan.',
        },
        {
          id: 'reservations',
          icon: 'fa fa-lg fa-calendar-alt',
          isNew: false,
          value: '10.4k',
          title: 'Reservasi',
          description: 'Jumlah acara.',
        },
        {
          id: 'guestbooks',
          icon: 'fa fa-lg fa-book-open',
          isNew: false,
          value: '2.3k',
          title: 'Buku Tamu',
          description: 'Jumlah tamu.',
        },
      ],
    }
  },
  // START HIDDEN TEMPORARY
  // mounted() {
  //   this.getCounter()
  // },
  // methods: {
  //   async getCounter() {
  //     const rest = await axios.post('/api/public/counter')
  //     if (rest && rest.status === 200) {
  //       const data = rest.data.data
  //       this.counters[0].value = data.invitations
  //       this.counters[1].value = data.reservations
  //       this.counters[2].value = data.guests
  //     }
  //   },
  // },
  // END HIDDEN TEMPORARY
}
</script>
