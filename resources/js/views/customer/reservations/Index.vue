<template>
  <div id="EmployeeHome">
    <AppTabLinks :data="tabs" @onChange="onChange" />
    <Lists v-if="selectedIndex === 'lists'" />
    <Schedules v-if="selectedIndex === 'schedules'" />
  </div>
</template>
<script>
import AppTabLinks from '../../../components/modules/AppTabLinks'
import Lists from './lists/Index'
import Schedules from './schedules/Index'

export default {
  data() {
    return {
      selectedIndex: 'lists',
      tabs: [
        { id: 1, title: 'Reservasi', path: 'lists' },
        { id: 2, title: 'Jadwal', path: 'schedules' },
      ],
    }
  },
  methods: {
    onChange(value) {
      this.selectedIndex = value.name
    },
  },
  components: {
    AppTabLinks,
    Lists,
    Schedules,
  },
}
</script>
