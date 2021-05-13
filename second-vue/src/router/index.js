import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from "../views/Home"
import adminHome from '../views/admin/Home'
import Login from '../views/admin/Login'

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    children: [
      {
        path: '/home',
        name: 'Home',
        component: Home
      }
    ]
  },
  {
    path: '/admin',
    name: 'Login',
    component: Login,
    hidden: true
  },
  {
    path: '/admin/home',
    name: 'Home',
    component: adminHome,
    hidden: true
  }
]

const router = new VueRouter({
  routes
})

export default router
