import InvitationLayout from '../components/layouts/Invitation.vue';
// import Home from '../components/customer/home/Index.vue';
import Informations from '../components/customer/informations/Index.vue';
import Invitation from '../components/customer/invitation/Index.vue';
import Package from '../components/customer/package/Index.vue';
import Themes from '../components/customer/themes/Index.vue';
import Songs from '../components/customer/songs/Index.vue';
import GoogleMap from '../components/customer/googleMap/Index.vue';
import LoveStory from '../components/customer/loveStory/Index.vue';
import Brides from '../components/customer/brides/Index.vue';
import Events from '../components/customer/events/Index.vue';
// import EventSchedule from '../components/customer/eventSchedule/Index.vue';
import Galleries from '../components/customer/galleries/Index.vue';
import YoutubeVideos from '../components/customer/youtubeVideo/Index.vue';
import Gifts from '../components/customer/gifts/Index.vue';
import SpecialThanks from '../components/customer/specialThanks/Index.vue';
import GuestBook from '../components/customer/guestBook/Index.vue';
import Reservations from '../components/customer/reservations/Index.vue';
import Setting from '../components/customer/setting/Index.vue';

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