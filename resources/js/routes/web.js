import Web from '../components/layouts/Web.vue';
import Login from '../components/auth/Login.vue';
import Register from '../components/auth/Register.vue';
import Home from '../components/web/Index.vue';
import NotFoundWeb from '../components/web/404.vue';
import HowToOrders from '../components/web/infos/HowToOrders.vue';
import AboutUs from '../components/web/infos/AboutUs.vue';

const routes = {
    path: '/',
    component: Web,
    children: [
        // main
        {
            name: 'home',
            path: '/',
            component: Home
        },

        // auth
        {
            name: 'login',
            path: '/login',
            component: Login
        },
        {
            name: 'register',
            path: '/register',
            component: Register
        },

        // info
        {
            name: 'how-to-orders',
            path: '/how-to-orders',
            component: HowToOrders
        },
        {
            name: 'about-us',
            path: '/about-us',
            component: AboutUs
        },
        {
            name: '404WEB',
            path: '/not-found',
            component: NotFoundWeb
        }
    ]
}

export default routes