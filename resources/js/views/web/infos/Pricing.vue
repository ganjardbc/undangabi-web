<template>
  <div id="App" style="padding-top: 0">
    <div class="main-screen" style="margin-top: 0">
      <div class="self-padding" style="padding-bottom: 0">
        <div class="space space-center">
          <h2
            class="fonts fonts-32px fonts-mobile-22px semibold black no-line-height theme-pricing-animate"
          >
            Harga Undangan
          </h2>
          <div class="display-flex center">
            <div
              class="bottom-line theme-pricing-animate"
              style="margin-top: 15px; margin-bottom: 15px"
            ></div>
          </div>
          <div class="padding padding-left-15px padding-right-15px">
            <div
              class="fonts fonts-16px fonts-mobile-13px grey theme-pricing-animate"
            >
              Harga yang kami berikan bersahabat dan terjangkau di semua
              kalangan.
            </div>
          </div>
        </div>
      </div>
      <div class="display-flex display-mobile wrap">
        <div v-for="(dt, i) in pricing" :key="i" class="width width-row-3">
          <div style="padding: 15px">
            <div
              :class="`card box-shadow ${dt.type === 'pro' ? 'background-placeholder' : 'background-white'} theme-pricing-animate-2`"
              style="overflow: unset"
            >
              <div style="padding: 15px">
                <div
                  class="fonts fonts-22px fonts-mobile-16px black semibold theme-pricing-animate-2"
                >
                  {{ dt.title }}
                </div>
                <div style="margin-top: 15px">
                  <div
                    v-if="dt.secondPrice"
                    class="fonts fonts-16px fonts-mobile-13px grey theme-pricing-animate-2"
                    style="text-decoration: line-through"
                  >
                    {{ dt.secondPrice }}
                  </div>
                  <div
                    class="fonts fonts-22px fonts-mobile-16px green semibold theme-pricing-animate-2"
                  >
                    {{ dt.price }}
                  </div>
                </div>
                <div
                  v-if="dt.isRecomended"
                  class="display-flex center"
                  style="position: absolute; top: -10px; right: 0; width: 100%"
                >
                  <div class="card-value">
                    <i class="fa fa-lw fa-star" />
                    <span class="fonts fonts-14px fonts-mobile-11px white"
                      >Direkomendasikan</span
                    >
                  </div>
                </div>
                <div style="padding-top: 30px; padding-bottom: 50px">
                  <div
                    v-for="(sb, j) in dt.data"
                    :key="j"
                    class="display-flex align-center theme-pricing-animate-2"
                    style="padding-top: 10px; padding-bottom: 10px"
                  >
                    <div style="width: 30px; padding-top: 3px">
                      <i
                        v-if="sb.status"
                        class="fonts green far fa-lg fa-check-circle"
                      />
                      <i v-else class="fonts red far fa-lg fa-times-circle" />
                    </div>
                    <div class="display-flex" style="width: calc(100% - 30px)">
                      <div class="fonts fonts-13px fonts-mobile-11px black">
                        {{ sb.title }}
                      </div>
                      <div
                        v-if="sb.note"
                        class="fonts fonts-13px fonts-mobile-11px black semibold"
                        style="margin-left: 5px"
                      >
                        {{ sb.note }}
                      </div>
                    </div>
                  </div>
                </div>
                <div class="theme-pricing-animate-2">
                  <a
                    :href="`https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital ${dt.title}`"
                    target="_blank"
                    class="btn btn-main btn-div"
                  >
                    <i class="icn icn-left fa fa-lw fa-shopping-cart" /> Pesan
                    Ini
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="isShowPlatinum" class="main-screen" style="padding-top: 10px">
      <div class="self-padding" style="padding-bottom: 0">
        <div class="space space-center" style="padding-bottom: 0">
          <div style="padding: 15px">
            <h2
              class="fonts fonts-32px fonts-mobile-22px semibold black no-line-height theme-pricing-animate-2"
            >
              Paket Platinum
            </h2>
            <div class="display-flex center">
              <div
                class="bottom-line theme-pricing-animate-2"
                style="margin-top: 15px; margin-bottom: 15px"
              ></div>
            </div>
            <div class="width width-100">
              <div
                class="fonts fonts-16px fonts-mobile-13px grey theme-pricing-animate-2"
              >
                Kamu bisa kustom tema sendiri dengan fitur-fitur dari paket
                Bronze, Silver atau Gold.
              </div>
            </div>
            <div style="margin-top: 15px; margin-bottom: 30px">
              <div
                class="fonts fonts-22px fonts-mobile-16px green semibold theme-pricing-animate-2"
              >
                Rp (With Deal)
              </div>
            </div>
            <div class="theme-pricing-animate-2">
              <a
                href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital Paket Platinum"
                target="_blank"
                class="btn btn-main btn-div width width-130px width-center"
              >
                <i class="icn icn-left fa fa-lw fa-shopping-cart" /> Pesan Ini
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapState } from 'vuex'

export default {
  name: 'App',
  computed: {
    ...mapState({
      pricing: (state) => state.customerPacket.data,
    }),
    isShowPlatinum() {
      return this.enablePlatinumPackage
    },
  },
}
</script>
