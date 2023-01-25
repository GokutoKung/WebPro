<template>
  <div class="container hero is-fullheight is-fluid has-background-dark">
    <section class="section" id="app">
      <div class="content">
        <div class="columns is-multiline">
          <div class="column is-3" v-for="bill in bills" :key="bill.bill_id">
            <div class="card">
              <div class="card-image pt-5">
                <figure class="image">
                  <img
                    style="height: 120px; width: 200px"
                    src="https://www.seekpng.com/png/detail/303-3038219_pay-transparent-png-mobile-payment-icon-png.png"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="is-size-4 has-text-centered">{{ bill.pay_method }}</div>
                <div class="content has-text-centered" style="height: 10px">
                  {{ bill.price }} ฿
                </div>
                <div class="content has-text-centered" style="height: 10px">
                  Name: {{ bill.fname }} {{bill.lname}}
                </div>
                <div class="content has-text-centered" style="height: 10px">
                  Date: {{bill.order_date}}
                </div>
              </div>
              <footer class="card-footer">
                <router-link
                  class="card-footer-item"
                  :to="`/bill/${bill.order_id}`"
                  >Read more...</router-link
                >
              </footer>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: "bill",
  props: ["user"],
  data() {
    return {
      bills: [],
    };
  },
  mounted() {
    this.getBills();
  },
  methods: {
    getBills() {
      if (this.isCustomer()){
        axios
        .get(`http://localhost:3000/bill/cust/${this.user.cust_id}`)
        .then((res) => {
          this.bills = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
      }
      else if (this.isEmployee()) {
        axios
        .get("http://localhost:3000/bill")
        .then((res) => {
          this.bills = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
      }
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
