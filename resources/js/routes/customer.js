import CustomerLayout from '../layouts/Customer.vue';
import CustomeDashboard from '../views/customer/Index.vue';
import CustomerCreateInvitation from '../views/customer/createInvitation/Index.vue';

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