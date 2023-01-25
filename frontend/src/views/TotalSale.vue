<template>
  <div
    :style="{
      'background-image':
        'url(https://cdn.discordapp.com/attachments/844870220757860372/971797212382236733/ax.jpg)',
      'background-size': 'cover',
    }"
  >
    <div class="container hero is-fullheight">
      <section class="section" id="app">
        <div class="field is-grouped is-grouped-centered">
          <div class="field is-horizontal">
            <div class="field-label is-normal">
              <label class="label" style="color: white">From</label>
            </div>
          </div>
          <div class="control">
            <input class="input" type="month" v-model="month" />
          </div>
          <div class="control">
            <button class="button is-success" @click="getOrder()">
              Submit
            </button>
          </div>
        </div>
        <div class="content">
          <table>
            <!-- 1 -->
            <tr>
              <th
                colspan="4"
                style="
                  color: white;
                  background-color: dodgerblue;
                  text-align: center;
                "
              >
                Total Sale
              </th>
            </tr>
            <!-- 2 -->
            <tr>
              <th style="background-color: white">Food</th>
              <th style="background-color: white">Total Sale</th>
              <th style="background-color: white">Unit Price</th>
              <th style="background-color: white">Total Price</th>
            </tr>
            <!-- 3 -->
            <tr v-for="o in order" :key="o.f_id">
              <td style="background-color: white">{{ o.name }}</td>
              <td style="background-color: white">{{ o.total }}</td>
              <td style="background-color: white">{{ o.unit_price }}</td>
              <td style="background-color: white">{{ o.price }}</td>
            </tr>
          </table>
        </div>
      </section>
    </div>
  </div>
</template>
 
<script>
import axios from "@/plugins/axios";

export default {
  name: "total",
  props: ["user"],
  data() {
    return {
      order: [],
      month: null,
      total_price: 0,
    };
  },
  methods: {
    getOrder() {
      axios
        .post("http://localhost:3000/total", { month: this.month + "%" })
        .then((res) => {
          this.order = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>