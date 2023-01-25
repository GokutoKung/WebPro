<template>
  <div
    :style="{
      'background-image':
        'url(https://cdn.discordapp.com/attachments/844870220757860372/971414754142871583/abstract-blur-interior-coffee-shop-or-cafe-for-background_42682-256.jpg)',
      'background-size': 'cover,contain',
    }"
  >
    <div class="container has-text-centered">
      <div class="column is-5" style="display: inline-block; text-align: left">
        <div class="box">
          <h2 class="title has-text-centered">Reservation</h2>
          <article class="media">
            <div class="media-content">
              <div class="content">
                <div class="field">
                  <label class="label">Date</label>
                  <div class="control">
                    <input class="input" type="datetime-local" v-model="date" />
                  </div>
                </div>
                <div class="field">
                  <label class="label">Branch</label>
                  <div class="select is-fullwidth">
                    <select v-model="branch">
                      <option
                        :value="rest.rest_id"
                        v-for="rest in restaurants"
                        :key="rest.rest_id"
                      >
                        {{ rest.rest_id }}
                      </option>
                    </select>
                  </div>
                </div>
                <div class="field">
                  <label class="label">Table</label>
                  <div class="select is-fullwidth">
                    <select v-model="t">
                      <option
                        :value="t.table_id"
                        v-for="t in table"
                        :key="t.table_id"
                      >
                        {{ t.table_no }}
                      </option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </article>
        </div>

        <div class="box">
          <h2 class="title has-text-centered">Infomation</h2>
          <article class="media">
            <div class="media-content">
              <div class="content">
                <label class="label">Branch</label>
                <p>{{ info_branch }}</p>
              </div>
              <div class="content">
                <label class="label">Address</label>
                <p>{{ info_address }}</p>
              </div>
              <div class="content">
                <label class="label">Phone</label>
                <p>{{ info_phone }}</p>
              </div>
              <div class="content">
                <label class="label">Num of Seat</label>
                <p>{{ info_seat }}</p>
              </div>
            </div>
          </article>
        </div>

        <div class="field is-grouped is-grouped-centered">
          <div class="control">
            <button
              class="button is-success"
              @click="addReservation(user.cust_id, t)"
            >
              <router-link to="/" style="color: white"> Submit </router-link>
            </button>
          </div>
          <div class="control">
            <router-link class="button is-danger" to="/">Cancel</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: "rerservation",
  props: ["user"],
  data() {
    return {
      date: null,
      branch: 1,
      t: 1,
      table: [],
      restaurants: [],
      info_branch: null,
      info_address: null,
      info_phone: null,
      info: [],
      info_seat: null,
    };
  },
  mounted() {
    this.getRest();
    this.getTable(this.branch);
    this.getInfo(this.branch);
    this.getInfoSeat(this.t);
  },
  watch: {
    branch() {
      this.getTable(this.branch);
      this.getInfo(this.branch);
    },
    t() {
      this.getInfoSeat(this.t);
    },
  },
  methods: {
    addReservation(cust_id, table_id) {
      axios
        .post(`http://localhost:3000/${cust_id}/resv/${table_id}`, {
          eating_date: this.date,
        })
        .then((res) => {})
        .catch((err) => {
          console.log(err);
        });
    },
    getRest() {
      axios
        .get(`http://localhost:3000/rest`)
        .then((res) => {
          this.restaurants = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getTable(branch) {
      axios
        .get(`http://localhost:3000/table/${branch}`)
        .then((res) => {
          this.table = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getInfo(branch) {
      axios
        .get(`http://localhost:3000/info/${branch}`)
        .then((res) => {
          this.info_branch = res.data.rest_id;
          this.info_address = res.data.address;
          this.info_phone = res.data.phone;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getInfoSeat(table) {
      axios
        .get(`http://localhost:3000/info/seat/${table}`)
        .then((res) => {
          this.info_seat = res.data.number_of_seat;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
