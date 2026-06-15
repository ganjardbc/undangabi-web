<template>
  <div id="App" class="display-flex center wrap">
    <div v-for="(dt, i) in data" :key="i" :class="defaultColumn">
      <div
        :class="`padding padding-15px padding-mobile-left-0 padding-mobile-right-0 ${enableAnimation && 'theme-invitation-animate'}`"
      >
        <div
          class="card box-shadow border-radius"
          :style="`overflow: unset; padding-top: 80px; padding-bottom: 60px; margin-top: 40px; background-color: ${customBackgroundColor}; border-radius: ${customBorderRadius};`"
        >
          <div
            style="
              position: absolute;
              top: -40px;
              left: 0;
              width: 100%;
              margin: auto;
            "
          >
            <div
              class="image image-80px image-center image-circle box-shadow"
              :style="`background-color: ${customIconBgColor};`"
            >
              <i
                :class="`post-middle-absolute ${customIcon}`"
                :style="`color: ${customIconColor};`"
              ></i>
            </div>
          </div>
          <div
            :class="`fonts ${customMainFontSize} black ${customMainFont} ${customMainFontWeight} align-center ${enableAnimation && 'theme-invitation-animate'}`"
            :style="`color: ${customMainColor}; margin-bottom: 15px;`"
          >
            {{ dt.title }}
          </div>
          <div
            v-if="dt.description"
            :class="`fonts ${customPrimaryFontSize} black ${customPrimaryFont} align-center ${enableAnimation && 'theme-invitation-animate'}`"
            :style="`color: ${customPrimaryColor}; margin-bottom: 42px;`"
            v-html="dt.description"
          ></div>
          <div
            v-if="dt.address"
            :class="`display-flex margin margin-15px ${enableAnimation && 'theme-invitation-animate'}`"
          >
            <div style="width: 40px; padding-top: 5px">
              <i
                class="fa fa-lw fa-map-marker-alt"
                :style="`color: ${customMainColor};`"
              ></i>
            </div>
            <div style="width: calc(100% - 40px)">
              <div
                :class="`fonts ${customPrimaryFontSize} black ${customPrimaryFont}`"
                :style="`color: ${customPrimaryColor};`"
              >
                {{ dt.address }}
              </div>
            </div>
          </div>
          <div
            v-if="dt.date"
            :class="`display-flex margin margin-15px ${enableAnimation && 'theme-invitation-animate'}`"
          >
            <div style="width: 40px; padding-top: 5px">
              <i
                class="fa fa-lw fa-calendar-alt"
                :style="`color: ${customMainColor};`"
              ></i>
            </div>
            <div style="width: calc(100% - 40px)">
              <div
                :class="`fonts ${customPrimaryFontSize} black ${customPrimaryFont}`"
                :style="`color: ${customPrimaryColor};`"
              >
                {{ dt.date | moment('dddd, Do MMMM YYYY') }}
              </div>
            </div>
          </div>
          <div
            v-if="dt.time"
            :class="`display-flex margin margin-15px ${enableAnimation && 'theme-invitation-animate'}`"
          >
            <div style="width: 40px; padding-top: 5px">
              <i
                class="fa fa-lw fa-clock"
                :style="`color: ${customMainColor};`"
              ></i>
            </div>
            <div style="width: calc(100% - 40px)">
              <div
                :class="`fonts ${customPrimaryFontSize} black ${customPrimaryFont}`"
                :style="`color: ${customPrimaryColor};`"
              >
                {{ dt.time }} {{ dt.time_zone }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'App',
  props: {
    data: {
      default: null,
    },
    enableAnimation: {
      default: false,
    },
    enableEnglish: {
      default: false,
    },
    customBackgroundColor: {
      default: '#fff',
    },
    customMainColor: {
      default: '#50607D',
    },
    customMainFont: {
      default: 'RoxboroughCF',
    },
    customPrimaryFont: {
      default: 'Graphik',
    },
    customPrimaryColor: {
      default: '#1A1507',
    },
    customMainFontSize: {
      default: 'fonts-24',
    },
    customPrimaryFontSize: {
      default: 'fonts-12',
    },
    customMainFontWeight: {
      default: 'weight-bold',
    },
    customPrimaryFontWeight: {
      default: 'normal',
    },
    customBorderRadius: {
      default: '12px',
    },
    column: {
      default: null,
    },
    customIcon: {
      default: 'fa fa-lg fa-heart',
    },
    customIconColor: {
      default: '#50607D',
    },
    customIconBgColor: {
      default: '#fff',
    },
  },
  computed: {
    defaultColumn() {
      let column = 'width width-row-2'
      switch (this.column) {
        case '1':
          column = 'width width-row-1'
          break
        case '2':
          column = 'width width-row-2'
          break
        case '4':
          column = 'width width-row-3'
          break
        case '5':
          column = 'width width-row-5'
          break
        default:
          column = 'width width-row-2'
          break
      }
      return column
    },
  },
  created() {
    if (this.enableEnglish) {
      this.$moment.locale('en-in')
    } else {
      this.$moment.locale('id')
    }
  },
}
</script>
