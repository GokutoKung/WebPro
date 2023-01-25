<template>
  <div
    :style="{ 'background-image': 'url(https://cdn.discordapp.com/attachments/844870220757860372/971791810798166106/cv.png)', 'background-size':'cover'}"
  >
  <div class="container hero is-fullheight" style="
        align-items: center;
      position:relative;
      height:100px;
      ">
    <div
      class="column is-5"
    >
      <div class="box">
        <h2 class="title has-text-centered">Proof of Payment</h2>
        <article class="media">
          <div class="media-content">
            <div class="content">
              <div class="field">
                <label class="label">Price</label>
                <div class="control">
                  <input
                    class="input"
                    type="price"
                    placeholder="Enter your price"
                    v-model="price"
                  />
                </div>
              </div>

              <div class="field">
                <label class="label">Order</label>
                <div class="control">
                  <input
                    class="input"
                    type="price"
                    placeholder="Enter your Order No."
                    v-model="orderNo"
                  />
                </div>
              </div>

              <div class="field">
                <label class="label">Pay Methods</label>
                <div class="control">
                  <div class="select is-fullwidth">
                    <select v-model="payMethod">
                      <option value="cash">Cash</option>
                      <option value="credit">Credit</option>
                    </select>
                  </div>
                </div>
              </div>

              <div class="field is-grouped is-grouped-centered">
                <div class="control">
                  <button class="button is-success" @click="submit()">
                    <router-link to="/" style="color:white"> Submit </router-link>
                  </button>
                </div>
                <div class="control">
                  <router-link class="button is-danger" to="/"
                    >Cancel</router-link
                  >
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: "payment",
  props: ["user"],
  data() {
    return {
      payMethod: null,
      price: null,
      orderNo: null,
    };
  },
  methods: {
    submit() {
      axios
        .post(`http://localhost:3000/bill/${this.orderNo}`, {
          paymethod: this.payMethod,
          price: this.price,
        })
        .then((res) => {
          this.foods = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>