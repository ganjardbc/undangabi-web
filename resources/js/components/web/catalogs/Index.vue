<template>
  <div class="main-screen" style="padding-top: 0">
    <div style="padding-left: 15px; padding-right: 15px">
      <div class="self-padding" style="padding-bottom: 0; padding-top: 0">
        <div class="space space-center">
          <h2
            class="fonts fonts-32px fonts-mobile-22px semibold black no-line-height theme-catalogs-animate"
          >
            Katalog Undangan
          </h2>
          <div class="display-flex center">
            <div
              class="bottom-line theme-catalogs-animate"
              style="margin-top: 15px; margin-bottom: 15px"
            ></div>
          </div>
          <div class="padding padding-left-15px padding-right-15px">
            <div
              class="fonts fonts-16px fonts-mobile-13px grey theme-catalogs-animate"
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
        class="display-flex align-center space-between"
        style="padding: 0 15px"
      >
        <div class="display-flex align-center margin margin-right-10px">
          <div class="width width-30px">
            <i class="fonts green far fa-lg fa-star"></i>
          </div>
          <h2 class="fonts fonts-16px fonts-mobile-13px semibold black">
            {{ catalog.groupName }}
          </h2>
        </div>
        <div class="fonts fonts-16px fonts-mobile-13px grey">
          {{ catalog.groupThemes.length }} item(s)
        </div>
      </div>
      <div class="display-flex display-mobile wrap">
        <div
          v-for="(theme, j) in catalog.groupThemes"
          :key="j"
          class="width width-row-2"
        >
          <div class="display-flex align-center padding padding-15px">
            <div style="width: 50px; margin-right: 15px">
              <div
                class="image image-padding image-circle bg-white box-shadow theme-feature-animate"
              >
                <i
                  :class="`post-middle-absolute fonts fonts-18px fonts-mobile-16px primary fa fa-lg fa-envelope`"
                ></i>
              </div>
            </div>
            <div style="width: calc(100% - 180px)">
              <div class="fonts fonts-16px fonts-mobile-13px semibold black">
                {{ theme.title }}
              </div>
              <div class="fonts fonts-13px fonts-mobile-11px grey">
                {{ theme.type }}
              </div>
            </div>
            <router-link
              :to="theme.link"
              target="_blank"
              style="display: block; width: 100px; margin-left: 15px"
            >
              <button class="btn btn-sekunder btn-big btn-full">Preview</button>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AppLoader from '../../modules/AppLoader'
import listOfCatalogs from './data'

export default {
  data() {
    return {
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
}
</script>

<style scoped>
.self-padding {
  padding-top: 50px;
  padding-bottom: 50px;
}
</style>
