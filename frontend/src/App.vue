<template>
  <div id="app">
    <!-- nav bar -->
    <nav class="navbar has-background-warning" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <router-link to="/" class="navbar-item is-size-4">
          DB Restaurant
        </router-link>
      </div>
      <div class="navbar-menu">
        <div
          class="navbar-start"
          style="position: absolute; left: 50%; transform: translateX(-50%)"
        >
          <router-link to="/reservation" v-if="isCustomer()" class="navbar-item is-size-5">
            Reservation
          </router-link>
          <router-link to="/payment/" v-if="isEmployee()" class="navbar-item is-size-5">
            Payment
          </router-link>
          <router-link to="/order" v-if="isEmployee()" class="navbar-item is-size-5">
            Order
          </router-link>
          <router-link to="/table" v-if="isEmployee()" class="navbar-item is-size-5">
            Table
          </router-link>
          <router-link to="/total" v-if="isEmployee()" class="navbar-item is-size-5">
            Total Sale
          </router-link>
          <router-link to="/bill" v-if="isEmployee() || isCustomer()" class="navbar-item is-size-5">
            Bill
          </router-link>
        </div>
        <div class="navbar-end">
          <div v-if="user" class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              <figure class="image is-24x24 my-auto">
                <img
                  class="is-rounded"
                  src="https://bulma.io/images/placeholders/128x128.png"
                />
              </figure>
              <span class="pl-3"
                >{{ user.first_name }} {{ user.last_name }}</span
              >
            </a>
            <div class="navbar-dropdown">
              <a class="navbar-item">
                <router-link to="/profile"> Profile </router-link>
              </a>
              <a class="navbar-item" @click="logOut()">
                <router-link to="/"> Log out </router-link>
              </a>
            </div>
          </div>

          <div v-if="!user" class="navbar-item">
            <router-link to="/user/login">
              <strong>Login</strong>
            </router-link>
          </div>
          <div v-if="!user" class="navbar-item">
            <router-link to="/user/signup">
              <strong>Signup</strong>
            </router-link>
          </div>
        </div>
      </div>
    </nav>

    <router-view
      :key="$route.fullPath"
      @auth-change="onAuthChange"
      :user="user"
    />
  </div>
</template>

<script>
import axios from "@/plugins/axios";
export default {
  data() {
    return {
      user: null,
    };
  },
  mounted() {
    this.onAuthChange();
  },
  methods: {
    onAuthChange() {
      const token = localStorage.getItem("token");
      if (token) {
        this.getUser();
      }
    },
    getUser() {
      axios.get("/user/me").then((res) => {
        this.user = res.data;
      });
    },
    logOut() {
      localStorage.removeItem("token");
      window.location.href = "/";
    },
    isCustomer() {
      if (!this.user) return false
      return this.user.role === "cust"
    },
    isEmployee() {
      if (!this.user) return false
      return this.user.role === "emp"
    }
  },
};
</script>