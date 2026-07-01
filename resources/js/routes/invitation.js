import InvitationLayout from '../layouts/Invitation.vue';
// import Home from '../views/customer/home/Index.vue';
import Informations from '../views/customer/informations/Index.vue';
import Invitation from '../views/customer/invitation/Index.vue';
import Package from '../views/customer/package/Index.vue';
import Themes from '../views/customer/themes/Index.vue';
import Songs from '../views/customer/songs/Index.vue';
import GoogleMap from '../views/customer/googleMap/Index.vue';
import LoveStory from '../views/customer/loveStory/Index.vue';
import Brides from '../views/customer/brides/Index.vue';
import Events from '../views/customer/events/Index.vue';
// import EventSchedule from '../views/customer/eventSchedule/Index.vue';
import Galleries from '../views/customer/galleries/Index.vue';
import YoutubeVideos from '../views/customer/youtubeVideo/Index.vue';
import Gifts from '../views/customer/gifts/Index.vue';
import SpecialThanks from '../views/customer/specialThanks/Index.vue';
import GuestBook from '../views/customer/guestBook/Index.vue';
import Reservations from '../views/customer/reservations/Index.vue';
import Setting from '../views/customer/setting/Index.vue';

const routes = {
    path: '/customer/invitation/:id/',
    component: InvitationLayout,
    children: [
        {
            name: 'invitation-home',
            path: 'home',
            component: Invitation
        },
        {
            name: 'invitation-main',
            path: 'main',
            component: Invitation,
        },
        {
            name: 'invitation-informations',
            path: 'informations',
            component: Informations
        },
        {
            name: 'invitation-package',
            path: 'package',
            component: Package
        },
        {
            name: 'invitation-themes',
            path: 'themes',
            component: Themes
        },
        {
            name: 'invitation-songs',
            path: 'songs',
            component: Songs
        },
        {
            name: 'invitation-google-map',
            path: 'google-map',
            component: GoogleMap
        },
        {
            name: 'invitation-love-story',
            path: 'love-story',
            component: LoveStory
        },
        {
            name: 'invitation-bride',
            path: 'brides',
            component: Brides
        },
        {
            name: 'invitation-event',
            path: 'events',
            component: Events
        },
        // {
        //     name: 'invitation-event-schedule',
        //     path: 'event-schedule',
        //     component: EventSchedule
        // },
        {
            name: 'invitation-gallery',
            path: 'galleries',
            component: Galleries
        },
        {
            name: 'invitation-youtube-video',
            path: 'youtube-video',
            component: YoutubeVideos
        },
        {
            name: 'invitation-gift',
            path: 'gifts',
            component: Gifts
        },
        {
            name: 'invitation-special-thanks',
            path: 'special-thanks',
            component: SpecialThanks
        },
        {
            name: 'invitation-guest-book',
            path: 'guest-book',
            component: GuestBook
        },
        {
            name: 'invitation-reservation',
            path: 'reservations',
            component: Reservations
        },
        {
            name: 'invitation-setting',
            path: 'settings',
            component: Setting
        }
    ]
}

export default routes