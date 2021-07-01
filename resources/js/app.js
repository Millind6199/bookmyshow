/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import Vue from "vue";

require('./bootstrap');

window.Vue = require('vue').default;
import VueRouter from 'vue-router';

Vue.use(VueRouter)
/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

// Vue.component('example-component', require('./components/ExampleComponent.vue').default);
// Vue.component('Login', require('./components/Login.vue').default);

const routes = [
        {
        path: '/',
        component: require('./components/Login.vue').default,
            meta: {
            requiresAuth: false
            },
        },

    {
        path: '/signup',
        component: require('./components/User/Signup.vue').default,
        meta: {
            requiresAuth: false
        },
    },
    {
        path: '/dashboard',
        component: require('./components/Admin/Dashboard.vue').default,
        meta: {
            requiresAuth: true
        },
    },
    {
        path: '/home',
        component: require('./components/Admin/Home.vue').default,
        meta: {
            requiresAuth: true
        },
    },
    {
        path: '/addmovie',
        component: require('./components/Admin/Addmovie.vue').default,
        meta: {
            requiresAuth: true
        },
    },
    {
        path: '/viewdata',
        component: require('./components/Admin/Viewdata.vue').default,
        meta: {
            requiresAuth: true
        },
    },
    {
        path: '/viewdata/:id',
        component: require('./components/Admin/viewdetail.vue').default,
        meta: {
            requiresAuth: true
        },
    },





]

const router = new VueRouter({
    // mode: 'history',
    routes
})


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router: router
});


router.beforeEach((to, from, next) => {
    if(to.matched.some(record => record.meta.requiresAuth)) {
        if (localStorage.getItem('isAuth') == 'true') {
            next()
            return
        }
        next('/')
    } else {
        next()
    }
})

export default router;


