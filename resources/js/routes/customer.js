import CustomerLayout from '../components/layouts/Customer.vue';
import CustomeDashboard from '../components/customer/Index.vue';
import CustomerCreateInvitation from '../components/customer/createInvitation/Index.vue';

const routes = {
    path: '/customer',
    component: CustomerLayout,
    children: [
        {
            name: 'customer-dashboard',
            path : 'invitation',
            component: CustomeDashboard
        },
        {
            name: 'customer-create-invitation',
            path : 'create-invitation',
            component: CustomerCreateInvitation
        },
    ]
}

export default routes