<template>
  <div id="AppGridMenu" class="space-y-1">
    <router-link
      v-for="(dt, index) in dataSideBar"
      :key="index"
      :to="dt.link"
      class="group flex items-center justify-between px-3 py-2.5 rounded-md text-sm font-medium text-body hover:bg-canvas hover:text-ink transition-colors duration-200"
      active-class="bg-primary/10 text-primary hover:bg-primary/10 hover:text-primary"
      @click.native="onClickMenu"
    >
      <span class="flex items-center space-x-3">
        <i :class="`${dt.icon} w-4 text-center`" />
        <span>{{ dt.label }}</span>
      </span>
      <span
        v-if="dt.value > 0"
        class="bg-primary text-white text-xs leading-none rounded-full min-w-[18px] h-[18px] flex items-center justify-center px-1"
      >
        {{ dt.value }}
      </span>
    </router-link>
  </div>
</template>
<script>
export default {
  name: 'AppGridMenu',
  data() {
    return {
      permissions: [],
      sidebar: [],
    }
  },
  mounted() {
    // const permissions = this.$cookies.get('permissions')
    const permissions = {
      permissions: [{ permission_name: 'dashboard' }],
    }
    this.permissions = permissions.permissions
  },
  methods: {
    onClickMenu() {
      this.$emit('onClickMenu')
    },
    onCheckSubmenus(data) {
      let menu = []
      data &&
        data.map((dt) => {
          const stt = this.onCheckPermission(dt.permission)
          if (stt) {
            menu.push({
              ...dt,
            })
          }
        })
      return menu
    },
    onCheckPermission(prm) {
      let stt = false
      const data = this.permissions
      data &&
        data.map((dt) => {
          if (dt.permission_name === prm) {
            stt = true
          }
        })
      return stt
    },
  },
  computed: {
    dataSideBar() {
      let menu = []
      this.data &&
        this.data.map((dt) => {
          menu.push({ ...dt })
          // if (dt.menu) {
          //     let submenu = this.onCheckSubmenus(dt.menu)
          //     if (submenu.length > 0) {
          //         let submenuPayload = []
          //         submenu && submenu.map((sb) => {
          //             submenuPayload.push({...sb})
          //         })
          //         if (submenuPayload.length > 0) {
          //             menu.push({
          //                 ...dt,
          //                 menu: submenuPayload
          //             })
          //         }
          //     }
          // }
        })
      return menu
    },
  },
  props: {
    onPress: {
      default: null,
      required: false,
    },
    enableGridView: {
      type: Boolean,
      required: false,
    },
    disableResponsive: {
      type: Boolean,
      required: false,
    },
    isSidebarSmall: {
      type: Boolean,
      required: false,
    },
    data: {
      required: true,
    },
  },
}
</script>
