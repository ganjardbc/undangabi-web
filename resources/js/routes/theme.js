import ThemeLayout from '../layouts/Theme.vue';
import Generate from '../views/themes/Generate.vue';
import InvitationGenerator from '../views/themes/InvitationGenerator.vue';
import InvitationGeneratorPrivate from '../views/themes/InvitationGeneratorPrivate.vue';

const routes = {
    path: '/invitation',
    component: ThemeLayout,
    children: [
        {
            name: 'generate-only',
            path: '/:id',
            component: Generate
        },
        {
            name: 'generate-invitation',
            path: '/:id/generator',
            component: InvitationGenerator
        },
        {
            name: 'generate-invitation-private',
            path: '/:id/generator-private',
            component: InvitationGeneratorPrivate
        },
        {
            name: 'generate',
            path: '/:id/:guestId',
            component: Generate
        },
    ]
}

export default routes 