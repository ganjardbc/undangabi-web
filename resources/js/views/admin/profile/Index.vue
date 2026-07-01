<template>
  <div id="App">
    <div
      class="flex display-mobile justify-between"
      style="padding: 15px"
    >
      <div class="width width-25 width-mobile" style="margin-bottom: 30px">
        <div class="card shadow-sm bg-white">
          <div class="content-center" style="margin-bottom: 20px">
            <div
              class="image image-circle image-150px"
              style="margin: auto; text-align: center"
            >
              <i
                class="post-top fa fa-lg fa-user-circle"
                style="font-size: 58px; color: #999"
              />
            </div>
          </div>

          <AppButton
            style="width: 100%; margin-top: 20px"
            :onPress="onBuilded"
            title="UPDATE FOTO PROFIL"
            type="sekunder"
          />

          <div class="border border-bottom margin margin-top-20-px"></div>

          <AppButton
            style="width: 100%; margin-top: 20px"
            :onPress="onLogout"
            title="LOGOUT"
            type="primary"
          />
        </div>

        <AppButton
          style="width: 100%; margin-top: 30px"
          :onPress="onBuilded"
          title="CHANGE EMAIL"
          type="sekunder"
        />

        <AppButton
          style="width: 100%; margin-top: 10px"
          :onPress="onBuilded"
          title="CHANGE PASSWORD"
          type="sekunder"
        />
      </div>
      <div class="width width-73 width-mobile">
        <div class="card shadow-sm bg-white">
          <div class="width w-full">
            <div class="font-bold big margin margin-bottom-20-px">Biodata</div>

            <div class="margin margin-bottom-20-px">
              <div class="font-bold">Profil</div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px text-[11px]">ID</div>
              <div class="text-[11px] font-semibold">{{ user && user.id }}</div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px text-[11px]">Nama</div>
              <div class="text-[11px] font-semibold">{{ user && user.name }}</div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px text-[11px]">Role</div>
              <div class="text-[11px] font-semibold">
                {{ user && user.role_name }}
              </div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px">
                <div class="text-[11px]">Enabled</div>
                <div class="micro text-black">Is this user enable ?</div>
              </div>
              <!-- <div class="font-semibold">{{ user && user.enabled ? 'Enable' : 'Disable' }}</div> -->
              <div>
                <label class="switch green">
                  <input
                    type="checkbox"
                    name="enabled"
                    id="enabled"
                    v-model="user.enabled"
                  />
                  <span class="slider round" />
                </label>
              </div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px">
                <div class="text-[11px]">Status</div>
                <div class="micro text-black">Is this user active ?</div>
              </div>
              <!-- <div class="font-semibold">{{ user && user.status && user.status === 'active' ? 'Active' : 'Inactive' }}</div> -->
              <div>
                <div class="flex">
                  <label class="radio">
                    <input
                      type="radio"
                      name="status"
                      id="active"
                      value="active"
                      v-model="user.status"
                    />
                    <span class="checkmark" />
                    <span class="micro"> Active </span>
                  </label>

                  <label class="radio">
                    <input
                      type="radio"
                      name="status"
                      id="inactive"
                      value="inactive"
                      v-model="user.status"
                    />
                    <span class="checkmark" />
                    <span class="micro"> Inactive </span>
                  </label>
                </div>
              </div>
            </div>

            <div class="margin margin-bottom-20-px margin-top-40-px">
              <div class="text-[11px] font-bold">Kontak</div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px text-[11px]">Email</div>
              <div class="text-[11px] font-semibold">
                {{ user && user.email }}
              </div>
            </div>
            <div
              class="width w-full flex margin margin-bottom-20-px"
            >
              <div class="width width-300-px text-[11px]">No. Handphone</div>
              <div class="text-[11px] font-semibold">-</div>
            </div>

            <div
              class="width width-80 width-mobile margin margin-top-40-px margin-bottom-40-px"
            >
              <div class="flex">
                <div class="width width-300-px"></div>
                <div>
                  <button class="btn btn-main">UPDATE PROFIL</button>
                </div>
              </div>
              <!-- <div class="light-grey">
                                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eligendi labore dolores dolorem beatae. Dolorum tempore nam temporibus!
                            </div> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import AppWrapper from '../../../components/modules/AppWrapper'
import AppButton from '../../../components/modules/AppButton'
import AppText from '../../../components/modules/AppText'
import AppForm from '../../../components/modules/AppForm'
import AppCardCharts from '../../../components/modules/AppCardCharts'

export default {
  name: 'App',
  data() {
    return {}
  },
  components: {
    AppWrapper,
    AppButton,
    AppText,
    AppCardCharts,
    AppForm,
  },
  methods: {
    ...mapActions({
      removeCookieAuth: 'auth/removeCookieAuth',
      signOut: 'auth/signOut',
    }),

    async onLogout() {
      var a = confirm('logout your session ?')
      if (a) {
        const rest = await this.signOut(this.token)

        if (rest.data.status === 'ok') {
          this.removeCookieAuth()
          // this.$router.push({ name: 'home' })
          window.location = this.initUrl
        }

        console.log('LOGOUT', rest)
      }
    },

    onBuilded() {
      alert('still builded !')
    },
  },
  computed: {
    ...mapGetters({
      authenticated: 'auth/authenticated',
      user: 'auth/user',
      token: 'auth/token',
    }),
  },
}
</script>
