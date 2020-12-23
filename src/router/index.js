import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index'
import Product from '../views/Product'
import Show from '../views/Show'
import Cart from '../views/Cart'
import Category from '../views/Category'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Index',
    component: Index
  },
  {
    path: '/product',
    name: 'product',
    component: Product
  },
  {
    path: '/show',
    name: 'show',
    component: Show
  },
  {
    path: '/information',
  },
  {
    path: '/message',
  },
  {
    path: '/about',
    name: 'About',
    // component: () => import('../views/About')
  },
  {
    path: '/join',
  },
  {
    path: '/contact',
  },
  {
    path: '/category',
    name: 'category',
    component: Category
  },
  {
    path: '/cart',
    name: 'cart',
    component: Cart
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
