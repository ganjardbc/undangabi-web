<template>
  <div
    class="theme-footer"
    :style="`background-color: ${backgroundColor ? backgroundColor : '#fff'};`"
  >
    <div class="theme-padding">
      <div class="content-center">
        <div
          class="image image-180px image-center"
          style="
            height: 50px;
            margin-bottom: 20px;
            background-color: rgba(0, 0, 0, 0);
          "
        >
          <img :src="logo" alt="undang-abi" />
        </div>
        <div class="display-flex center">
          <a href="mailto:admin@undangabi.com" style="padding: 0 5px">
            <button
              class="btn btn-icon btn-white btn-small-radius"
              :style="`background-color: ${buttonBackgroundColor ? buttonBackgroundColor : '#fff'}; border-color: ${buttonBorderColor ? buttonBorderColor : '#000'};`"
            >
              <i
                class="far fa-lg fa-envelope"
                :style="`color: ${textButtonColor ? textButtonColor : '#000'};`"
              ></i>
            </button>
          </a>
          <a
            href="https://www.instagram.com/undangabi/"
            target="_blank"
            style="padding: 0 5px"
          >
            <button
              class="btn btn-icon btn-white btn-small-radius"
              :style="`background-color: ${buttonBackgroundColor ? buttonBackgroundColor : '#fff'}; border-color: ${buttonBorderColor ? buttonBorderColor : '#000'};`"
            >
              <i
                class="fab fa-lg fa-instagram"
                :style="`color: ${textButtonColor ? textButtonColor : '#000'};`"
              ></i>
            </button>
          </a>
          <a
            href="https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital"
            target="_blank"
            style="padding: 0 5px"
          >
            <button
              class="btn btn-icon btn-white btn-small-radius"
              :style="`background-color: ${buttonBackgroundColor ? buttonBackgroundColor : '#fff'}; border-color: ${buttonBorderColor ? buttonBorderColor : '#000'};`"
            >
              <i
                class="fab fa-lg fa-whatsapp"
                :style="`color: ${textButtonColor ? textButtonColor : '#000'};`"
              ></i>
            </button>
          </a>
        </div>
        <div style="text-align: center; padding-top: 30px">
          <div class="display-flex center" style="padding-bottom: 30px">
            <router-link
              :to="{ name: 'home' }"
              class="fonts fonts-11 black hover-underline"
              :style="`color: ${textColor ? textColor : '#000'};`"
              >Home</router-link
            >
            <span
              class="fonts fonts-11 black"
              :style="`color: ${textColor ? textColor : '#000'}; margin: 0 5px;`"
              >|</span
            >
            <router-link
              :to="{ name: 'pricing' }"
              class="fonts fonts-11 black hover-underline"
              :style="`color: ${textColor ? textColor : '#000'};`"
              >Harga</router-link
            >
            <span
              class="fonts fonts-11 black"
              :style="`color: ${textColor ? textColor : '#000'}; margin: 0 5px;`"
              >|</span
            >
            <router-link
              :to="{ name: 'catalogs' }"
              class="fonts fonts-11 black hover-underline"
              :style="`color: ${textColor ? textColor : '#000'};`"
              >Katalog</router-link
            >
            <span
              class="fonts fonts-11 black"
              :style="`color: ${textColor ? textColor : '#000'}; margin: 0 5px;`"
              >|</span
            >
            <router-link
              :to="{ name: 'how-to-orders' }"
              class="fonts fonts-11 black hover-underline"
              :style="`color: ${textColor ? textColor : '#000'};`"
              >Buat Undangan ?</router-link
            >
          </div>
          <div
            class="fonts fonts-9 grey"
            :style="`color: ${textColor ? textColor : '#000'};`"
          >
            This Site All Right Reserved @2022
          </div>
          <div>
            <span
              class="fonts fonts-9 grey"
              :style="`color: ${textColor ? textColor : '#000'};`"
              >Powered by</span
            >
            <span
              class="fonts fonts-9 black semibold"
              :style="`color: ${textColor ? textColor : '#000'};`"
              >UNDANGABI</span
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import LogoWhite from '../../../img/logo-white.png'
import LogoBlack from '../../../img/logo-black.png'

export default {
  props: {
    backgroundColor: {
      default: null,
    },
    textColor: {
      default: null,
    },
    buttonBackgroundColor: {
      default: null,
    },
    buttonBorderColor: {
      default: null,
    },
    textButtonColor: {
      default: null,
    },
    enableBlackLogo: {
      default: false,
    },
  },
  data() {
    return {
      logo: this.enableBlackLogo ? LogoBlack : LogoWhite,
    }
  },
}
</script>
