<template>
  <div id="App" class="display-popup">
    <div style="padding: 15px"></div>
    <div class="card-alert big box-shadow" style="margin: auto; padding: 0">
      <div style="padding: 15px">
        <div class="display-flex justify-content align-center">
          <div style="width: 100%">
            <div class="fonts micro semibold">Invitation Generator</div>
          </div>
          <div class="display-flex">
            <button class="btn btn-small-icon btn-white">
              <i class="fa fa-lw fa-copy"></i>
            </button>
            <button class="btn btn-small-icon btn-white" @click="onClose">
              <i class="fa fa-lg fa-times"></i>
            </button>
          </div>
        </div>
        <div
          style="padding-top: 15px; padding-bottom: 15px"
          class="border-bottom"
        >
          <div class="field-group">
            <div class="field-label">Nama Tamu Undangan</div>
            <input
              type="text"
              placeholder=""
              class="field field-sekunder"
              name="guest_name"
              id="guest_name"
              @input="onChangeGuestMenu"
            />
          </div>
        </div>
        <div style="padding-top: 15px; padding-bottom: 15px">
          <p style="margin-bottom: 15px">
            <b class="fonts fonts-10 black semibold"
              >Assalamu'alaikum Warahmatullah Wabarakatuh</b
            >
          </p>

          <p class="fonts fonts-10 black" style="margin-bottom: 15px">
            Bismillahirahmanirrahim.
          </p>

          <p class="fonts fonts-10 black" style="margin-bottom: 15px">
            Dan segala sesuatu Kami ciptakan berpasang-pasangan supaya kamu
            mengingat kebesaran Allah. (QS. Adz-Dzariyat: 49)
          </p>

          <p class="fonts fonts-10 black" style="margin-bottom: 15px">
            Undangan ini merupakan undangan resmi dari kami, <br />
            Tanpa mengurangi rasa hormat, perkenankan kami mengundang
            Bapak/Ibu/Saudara/i, teman sekaligus sahabat, untuk menghadiri acara
            pernikahan kami :
          </p>

          <p v-if="data && data.brides" style="margin-bottom: 15px">
            <b class="fonts fonts-10 black semibold">
              <span v-for="(dt, j) in data.brides" :key="j">
                {{ dt.name }} <span v-if="j !== data.brides.length - 1">&</span>
              </span>
            </b>
          </p>

          <p class="fonts fonts-10 black" style="margin-bottom: 15px">
            Berikut link untuk info lengkap dari acara kami :
          </p>

          <p class="fonts fonts-10" style="margin-bottom: 15px">
            <a
              :href="
                'https://undangabi.com/' +
                (data && data.invitation && data.invitation.short_link) +
                '?kepada=' +
                (guestName ? guestName : '[Nama Tamu Undangan]')
              "
              target="_blank"
              style="color: blue"
            >
              {{
                'https://undangabi.com/' +
                (data && data.invitation && data.invitation.short_link) +
                '?kepada=' +
                (guestName ? guestName : '[Nama Tamu Undangan]')
              }}
            </a>
          </p>

          <p class="fonts fonts-10 black" style="margin-bottom: 15px">
            Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan doa restu.
          </p>

          <p style="margin-bottom: 15px">
            <b class="fonts fonts-10 black semibold"
              >Wassalamu'alaikum Warahmatullah Wabarakatuh</b
            >
          </p>

          <div style="margin-bottom: 15px">
            <p class="fonts fonts-10 black">
              Hormat kami, <br />
              <b class="fonts fonts-10 black semibold">{{
                data && data.invitation && data.invitation.title
              }}</b>
            </p>
          </div>

          <p class="fonts fonts-10 black">
            (Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)
          </p>
        </div>
      </div>
    </div>
    <div style="padding: 15px"></div>
  </div>
</template>
<script>
export default {
  name: 'App',
  data() {
    return {
      guestName: null,
    }
  },
  methods: {
    onChangeGuestMenu(dt) {
      const data = dt.target.value
      this.guestName = data.replace(/\s+/g, '%20')
    },
  },
  props: {
    data: {
      required: false,
    },
    onClose: {
      type: Function,
      required: false,
    },
  },
}
</script>
