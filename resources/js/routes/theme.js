import ThemeLayout from '../components/layouts/Theme.vue';
import Generate from '../components/themes/Generate.vue';
import InvitationGenerator from '../components/themes/InvitationGenerator.vue';
import InvitationGeneratorPrivate from '../components/themes/InvitationGeneratorPrivate.vue';

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