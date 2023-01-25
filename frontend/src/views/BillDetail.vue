<template>
  <div
    :style="{
      'background-image':
        'url(https://cdn.discordapp.com/attachments/844870220757860372/971796963089600603/ac.jpg)',
      'background-size': 'cover',
    }"
  >
    <div class="container is-widescreen hero is-fullheight">
      <section class="" id="app">
        <div class="content mt-5">
          <table>
            <!-- 1 -->
            <tr>
              <th
                colspan="3"
                style="
                  color: white;
                  background-color: dodgerblue;
                  text-align: center;
                "
              >
                Bill
              </th>
            </tr>
            <!-- 2 -->
            <tr>
              <th style="background-color: white">Date</th>
              <td style="background-color: white" colspan="2">
                {{ order_date }}
              </td>
            </tr>
            <!-- 3 -->
            <tr>
              <th style="background-color: white">Name</th>
              <th style="background-color: white">Amount</th>
              <th style="background-color: white">Price</th>
            </tr>
            <!-- 4 -->
            <tr v-for="detail in details" :key="detail.item_no">
              <td style="background-color: white">{{ detail.name }}</td>
              <td style="background-color: white">{{ detail.item_amounts }}</td>
              <td style="background-color: white">{{ detail.unit_price }}</td>
            </tr>
            <!-- 5 -->
            <tr>
              <th style="background-color: white" colspan="2">Total</th>
              <td style="background-color: white; font-weight: bold">
                {{ total_price }} ฿
              </td>
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
  name: "bill-detail",
  props: ["user"],
  data() {
    return {
      details: [],
      order_date: null,
      total_price: null,
    };
  },
  mounted() {
    this.getDetail(this.$route.params.id);
  },
  methods: {
    getDetail(id) {
      axios
        .get(`http://localhost:3000/bill/${id}`)
        .then((res) => {
          this.details = res.data;
          this.order_date = this.details[0].order_date;
          this.total_price = this.details[0].total_price;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
