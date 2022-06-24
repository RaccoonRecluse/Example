import Vue from "vue";
import VueRouter from "vue-router";

import Test from "./components/Test.vue";
import Register from "./components/Register.vue";
import Login from "./components/Login.vue";
import Main from "./components/Main.vue";
import Catalog from "./components/Catalog.vue";
import Product from "./components/Product.vue";
import Favorite from "./components/Favorite.vue";
import Articles from "./components/Articles.vue";
import Articl from "./components/Articl.vue";

Vue.use(VueRouter);

export default new VueRouter({
    routes: [
        {
            path: "/test",
            component: Test,
            name: "test",
        },
        {
            path: "/registration",
            component: Register,
            name: "register",
        },
        {
            path: "/login",
            component: Login,
            name: "login",
        },
        {
            path: "/",
            component: Main,
            name: "Main",
        },
        {
            path: "/catalog",
            component: Catalog,
            name: "Catalog",
        },
        {
            path: "/product/:id",
            component: Product,
            name: "Product",
        },
        {
            path: "/articles/:id",
            component: Articl,
            name: "Articl",
        },
        {
            path: "/favorite",
            component: Favorite,
            name: "Favorite",
        },{
            path: "/articles",
            component: Articles,
            name: "Articles",
        },
    ],
});
