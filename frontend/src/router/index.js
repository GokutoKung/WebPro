import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    meta: { login: true },
    component: () => import("../views/Home.vue")
  },
  {
    path: "/user/login",
    name: "login",
    meta: { guess: true },
    component: () => import("../views/Login.vue")
  },
  {
    path: "/user/signup",
    name: "signup",
    meta: { guess: true },
    component: () => import("../views/Signup.vue")
  },
  {
    path: "/reservation",
    name: "reservation",
    meta: { login: true },
    component: () => import("../views/Reservation.vue")
  },
  {
    path: "/bill",
    name: "bill",
    meta: { login: true },
    component: () => import("../views/Bill.vue")
  },
  {
    path: "/bill/:id",
    name: "bill-detail",
    meta: { login: true },
    component: () => import("../views/BillDetail.vue")
  },
  {
    path: "/order",
    name: "order",
    meta: { login: true },
    component: () => import("../views/Order.vue")
  },
  {
    path: "/payment",
    name: "payment",
    meta: { login: true },
    component: () => import("../views/Payment.vue")
  },
  {
    path: "/total",
    name: "total",
    meta: { login: true },
    component: () => import("../views/TotalSale.vue")
  },
  {
    path: "/table",
    name: "mangetable",
    meta: { login: true },
    component: () => import("../views/Table.vue")
  },
  {
    path: "/profile",
    name: "profile",
    meta: { login: true },
    component: () => import("../views/Profile.vue")
  }
];
const router = new VueRouter({ routes });

router.beforeEach((to, from, next) => {
  const isLoggedIn = !!localStorage.getItem("token");

  if (to.meta.login && !isLoggedIn) {
    alert("Please login first!");
    next({ path: "/user/login" });
  }

  if (to.meta.guess && isLoggedIn) {
    alert("You've already logged in");
    next({ path: "/" });
  }

  next();
});

export default router;
