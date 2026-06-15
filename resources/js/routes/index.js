import routeAdmin from './admin'
import routeWeb from './web'
import routeCustomer from './customer'
import routeInvitation from './invitation'
import routeTheme from './theme'

export const routes = [
    { ...routeAdmin },
    { ...routeWeb },
    { ...routeCustomer },
    { ...routeInvitation },
    { ...routeTheme },
];