import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from "@/views/Home";
import Teacher from "@/views/Teacher";
import Course from "@/views/Course";
import News from "@/views/News";
import About from "@/views/About";
import HomeMain from "../views/Home-Main"
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
        name: 'Home-Main',
        component: HomeMain
      },
      {
        path: '/teacher',
        name: 'Teacher',
        component: Teacher
      },
      {
        path: '/course',
        name: 'Course',
        component: Course
      },
      {
        path: '/news',
        name: 'News',
        component: News
      },
      {
        path: '/about',
        name: 'About',
        component: About
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
