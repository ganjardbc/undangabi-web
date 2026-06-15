import Vue from 'vue'
import Vuex from 'vuex'
import auth from './auth'
import cart from './cart'
import toast from './toast'
import order from './order'
import wishelist from './wishelist'

// customer
import customerCategory from './customers/category'
import customerInvitation from './customers/invitation'
import customerTheme from './customers/theme'
import customerSong from './customers/song'
import customerPacket from './customers/packet'
import customerBrides from './customers/brides'
import customerEvents from './customers/events'
import customerGallery from './customers/gallery'
import customerGuestBook from './customers/guestBook'
import customerReservationLists from './customers/reservationLists'
import customerReservationSchedules from './customers/reservationSchedules'
import customerGifts from './customers/gifts'
import customerSpecialThanks from './customers/specialThanks'
import customerLoveStory from './customers/loveStory'

// invitation
import guestInvitation from './guest/invitation'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    auth,
    cart,
    toast,
    wishelist,
    order,

    // customers
    customerCategory,
    customerInvitation,
    customerTheme,
    customerSong,
    customerPacket,
    customerBrides,
    customerEvents,
    customerGallery,
    customerGuestBook,
    customerReservationLists,
    customerReservationSchedules,
    customerGifts,
    customerSpecialThanks,
    customerLoveStory,

    // invitation
    guestInvitation,
  },
})
