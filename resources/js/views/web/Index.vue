<template>
  <div id="App" class="bg-canvas">
    <div id="web-banner">
      <AppBanner />
    </div>

    <div id="web-counter">
      <AppCounter />
    </div>

    <div id="web-try-it-for-free">
      <AppTryItForFree />
    </div>

    <div id="web-category">
      <AppCategory />
    </div>

    <div id="web-article">
      <AppCatalogs />
    </div>

    <div id="web-pricing">
      <AppPricing />
    </div>
  </div>
</template>

<script>
import AppBanner from './infos/Banner'
import AppTryItForFree from './infos/TryItForFree'
import AppCounter from './infos/Counter'
import AppCategory from './infos/Category'
import AppCatalogs from './catalogs/Index'
import AppPricing from './infos/Pricing'

export default {
  name: 'App',
  metaInfo: {
    title: 'UndangAbi',
    titleTemplate: '%s | Platform Undangan Digital',
    htmlAttrs: {
      lang: 'en',
      amp: true,
    },
    link: [{ rel: 'icon', href: 'https://undangabi.com/images/icon.png' }],
  },
  components: {
    AppBanner,
    AppTryItForFree,
    AppCounter,
    AppCategory,
    AppCatalogs,
    AppPricing,
  },
  mounted() {
    this.$gtag.event('home', { method: 'Google' })
  },
}
</script>
