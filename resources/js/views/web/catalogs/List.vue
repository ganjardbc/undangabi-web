<template>
  <div class="main-screen" style="padding-top: 0">
    <div style="padding-left: 15px; padding-right: 15px">
      <div class="self-padding" style="padding-bottom: 0; padding-top: 0">
        <div class="space space-center">
          <h2
            class="fonts-32px fonts-mobile-22px font-semibold text-black no-line-height theme-catalogs-animate"
          >
            Katalog Undangan
          </h2>
          <div class="flex center">
            <div
              class="bottom-line theme-catalogs-animate"
              style="margin-top: 15px; margin-bottom: 15px"
            ></div>
          </div>
          <div class="p-4 pl-[15px] pr-[15px]">
            <div
              class="fonts-16px fonts-mobile-13px text-gray-500 theme-catalogs-animate"
            >
              Berikut katalog undangan yang kami sediakan.
            </div>
          </div>
        </div>
      </div>
    </div>

    <div
      v-for="(catalog, i) in catalogs"
      :key="i"
      :class="`width width-100 ${i !== catalogs.length - 1 && 'padding padding-bottom-30px'}`"
    >
      <div
        class="flex items-center justify-between"
        style="padding: 0 15px"
      >
        <div class="flex items-center margin margin-right-10px">
          <div class="width width-30px">
            <Icon icon="lucide:star" class="green w-5 h-5" />
          </div>
          <h2 class="fonts-16px fonts-mobile-13px font-semibold text-black">
            {{ catalog.groupName }}
          </h2>
        </div>
        <div class="fonts-16px fonts-mobile-13px text-gray-500">
          {{ catalog.groupThemes.length }} item(s)
        </div>
      </div>
      <div class="flex display-mobile flex-wrap">
        <div
          v-for="(theme, j) in catalog.groupThemes"
          :key="j"
          class="width w-full md:w-[calc(33.33%-16px)]"
        >
          <div
            class="card shadow-sm theme-catalog-items-animate"
            style="padding: 0; margin: 20px 20px"
          >
            <!-- <div class="width w-full" style="margin-bottom: 20px">
              <div
                class="image image-padding"
                style="padding-bottom: 75%; border-radius: 0"
              >
                <img :src="theme.image" alt="" />
              </div>
            </div> -->
            <div style="padding: 0 20px; width: calc(100% - 40px)">
              <div class="fonts-13px fonts-mobile-11px text-gray-500">
                {{ theme.type }}
              </div>
              <div class="fonts-16px fonts-mobile-13px font-semibold text-black">
                {{ theme.title }}
              </div>
              <div class="flex" style="padding-top: 10px">
                <div
                  v-for="(packet, k) in theme.packets"
                  :key="k"
                  class="card-capsule margin margin-right-5px"
                >
                  {{ packet }}
                </div>
              </div>
              <div
                class="width w-full flex justify-between items-center"
                style="padding-top: 20px"
              >
                <a
                  :href="`https://wa.me/6289699181669?text=Hallo admin saya mau pesan undangan digital tema ${theme.title}`"
                  target="_blank"
                >
                  <el-button
                    type="primary"
                    circle
                    class="!p-2.5"
                  >
                    <Icon icon="lucide:shopping-cart" class="w-4 h-4" />
                  </el-button>
                </a>
                <router-link :to="theme.link" target="_blank" class="no-underline">
                  <el-button>Live Preview</el-button>
                </router-link>
              </div>
            </div>
            <div style="padding-bottom: 20px"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { gsap, ScrollTrigger } from 'gsap/all'
import AppLoader from '../../../components/modules/AppLoader'
import listOfCatalogs from './data'
import coverImage from '../../../../img/all-theme-4.png'

export default {
  data() {
    return {
      coverImage: coverImage,
      visibleLoader: false,
      limit: 10,
      offset: 0,
      visibleLoadMore: false,
      catalogs: listOfCatalogs,
    }
  },
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Katalog Undangan',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
  },
  components: {
    AppLoader,
  },
  methods: {
    enableAnimation(element) {
      const val = this
      gsap.registerPlugin(ScrollTrigger)
      gsap.utils.toArray(element).forEach(function (elm) {
        val.hide(elm)
        ScrollTrigger.create({
          trigger: elm,
          onEnter: function () {
            val.animateFrom(elm)
          },
          onEnterBack: function () {
            val.animateFrom(elm, -1)
          },
          onLeave: function () {
            val.hide(elm)
          },
        })
      })
    },
    animateFrom(elem, direction) {
      direction = direction || 1
      var x = 0,
        y = direction * 100
      if (elem.classList.contains('theme-catalogs-animate-fromLeft')) {
        x = -100
        y = 0
      }
      if (elem.classList.contains('theme-catalogs-animate-fromRight')) {
        x = 100
        y = 0
      }
      elem.style.transform = 'translate(' + x + 'px, ' + y + 'px)'
      elem.style.opacity = '0'
      gsap.fromTo(
        elem,
        { x: x, y: y, autoAlpha: 0 },
        {
          duration: 1.25,
          x: 0,
          y: 0,
          autoAlpha: 1,
          ease: 'expo',
          overwrite: 'auto',
        }
      )
    },
    hide(elem) {
      gsap.set(elem, { autoAlpha: 0 })
    },
  },
}
</script>

<style scoped>
.self-padding {
  padding-top: 50px;
  padding-bottom: 50px;
}
</style>
