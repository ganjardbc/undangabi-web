import Web from '../layouts/Web.vue';
import Login from '../views/auth/Login.vue';
import Register from '../views/auth/Register.vue';
import Home from '../views/web/Index.vue';
import NotFoundWeb from '../views/web/404.vue';
import HowToOrders from '../views/web/infos/HowToOrders.vue';
import AboutUs from '../views/web/infos/AboutUs.vue';

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