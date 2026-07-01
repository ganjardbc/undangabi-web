<template>
  <div id="App">
    <div class="main-screen" style="padding-top: 0">
      <div class="main-screen" style="margin-top: 0">
        <div class="self-padding" style="padding-bottom: 0">
          <div class="space space-center">
            <h2
              class="fonts fonts-32px fonts-mobile-22px font-semibold text-black no-line-height"
            >
              Tentang Kami
            </h2>
            <div class="flex center">
              <div
                class="bottom-line"
                style="margin-top: 15px; margin-bottom: 15px"
              ></div>
            </div>
          </div>
        </div>

        <div class="width width-50 width-mobile width-center">
          <div
            class="card no-margin no-hover no-radius shadow-sm"
            style="padding-top: 20px; padding-bottom: 40px"
          >
            <div style="margin-bottom: 25px">
              <div
                class="width width-150px width-center"
                style="margin-bottom: 15px"
              >
                <div
                  class="image image-half-padding"
                  style="padding-bottom: 40%; background-color: #fff"
                >
                  <img class="img" :src="logo" alt="" />
                </div>
              </div>
              <div
                class="fonts fonts-16px fonts-mobile-13px text-black"
                style="margin-bottom: 15px"
              >
                Situs ini dibuat untuk kamu yang ingin buat undangan digital
                atau online tanpa ribet, harga yang bersahabat, dan pelayanan
                yang memuaskan.
              </div>
              <div
                class="fonts fonts-16px fonts-mobile-13px text-black"
                style="margin-bottom: 15px"
              >
                Kita akan memberikan undangan yang simpel dan elegan yang pasti
                bakal buat momen pernikahan kamu lebih berkesan.
              </div>
              <div class="fonts fonts-16px fonts-mobile-13px text-black">
                -- Ganjar Hadiatna (owner) --
              </div>
            </div>

            <div style="margin-bottom: 25px">
              <div class="fonts fonts-16px fonts-mobile-13px text-black font-semibold">
                Kontak
              </div>
              <div style="margin-top: 10px">
                <ul class="menu-list transparent">
                  <li class="ml-list flex">
                    <a href="tel:+62-8969-9181-669" class="ml-link">
                      <Icon icon="lucide:phone" class="w-3 h-3" style="margin-right: 5px" />
                      <span class="fonts fonts-13px fonts-mobile-11px">+62-8969-9181-669</span>
                    </a>
                  </li>
                  <li class="ml-list flex">
                    <a href="tel:+62-8515-5377-009" class="ml-link">
                      <Icon icon="lucide:phone" class="w-3 h-3" style="margin-right: 5px" />
                      <span class="fonts fonts-13px fonts-mobile-11px">+62-8515-5377-009</span>
                    </a>
                  </li>
                  <li class="ml-list flex">
                    <a href="mailto:admin@undangabi.com" class="ml-link">
                      <Icon icon="lucide:mail" class="w-3 h-3" style="margin-right: 5px" />
                      <span class="fonts fonts-13px fonts-mobile-11px">admin@undangabi.com</span>
                    </a>
                  </li>
                  <li class="ml-list flex">
                    <a
                      href="mailto:undangabi.official@gmail.com"
                      class="ml-link"
                    >
                      <Icon icon="lucide:mail" class="w-3 h-3" style="margin-right: 5px" />
                      <span class="fonts fonts-13px fonts-mobile-11px">undangabi.official@gmail.com</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>

            <div>
              <div class="fonts fonts-16px fonts-mobile-13px text-black font-semibold">
                Sosial Media
              </div>
              <div style="margin-top: 10px">
                <ul class="menu-list transparent">
                  <li class="ml-list flex">
                    <a
                      href="https://www.instagram.com/undangabi/"
                      target="_blank"
                      class="ml-link"
                    >
                      <Icon icon="simple-icons:instagram" class="w-3 h-3" style="margin-right: 5px" />
                      <span class="fonts fonts-13px fonts-mobile-11px">Instagram</span>
                    </a>
                  </li>
                  <li class="ml-list flex">
                    <a
                      href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
                      target="_blank"
                      class="ml-link"
                    >
                      <Icon icon="simple-icons:whatsapp" class="w-3 h-3" style="margin-right: 5px" />
                      <span class="fonts fonts-13px fonts-mobile-11px">WhatsApp</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import logo from '../../../../img/logo.png'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Tentang Kami',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  data() {
    return {
      logo: logo,
    }
  },
}
</script>
