import Admin from '../components/layouts/Admin.vue';
import NotFoundWeb from '../components/web/404.vue';
import Dashboard from '../components/admin/Index.vue';
import Profile from '../components/admin/profile/Index.vue';
import Bizpar from '../components/admin/bizpar/Index.vue';
import Category from '../components/admin/category/Index.vue';
import Role from '../components/admin/role/Index.vue';
import UserList from '../components/admin/user/Index.vue';
import Permission from '../components/admin/permission/Index.vue';
import Themes from '../components/admin/themes/Index.vue';
import Songs from '../components/admin/songs/Index.vue';
import Invitations from '../components/admin/invitations/Index.vue';

const routes = {
    path: '/admin',
    component: Admin,
    children: [
        {
            name: 'dashboard',
            path: '/admin-dashboard',
            component: Dashboard
        },
        {
            name: 'profile',
            path: '/admin-profile',
            component: Profile
        },

        // admin
        {
            name: 'bizpar',
            path: '/admin-bizpar',
            component: Bizpar
        },
        {
            name: 'category',
            path: '/admin-category',
            component: Category
        },
        {
            name: 'role',
            path: '/admin-role',
            component: Role
        },
        {
            name: 'permission',
            path: '/admin-permission',
            component: Permission
        },
        {
            name: 'userlist',
            path: '/admin-user-list',
            component: UserList
        },
        {
            name: 'themes',
            path: '/admin-themes',
            component: Themes
        },
        {
            name: 'songs',
            path: '/admin-songs',
            component: Songs
        },
        {
            name: 'invitations',
            path: '/admin-invitations',
            component: Invitations
        },

        // info
        {
            name: '404',
            path: '/admin-not-found',
            component: NotFoundWeb
        }
    ]
}

export default routes