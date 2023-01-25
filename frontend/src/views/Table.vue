<template>
  <div
    :style="{
      'background-image':
        'url(https://cdn.discordapp.com/attachments/844870220757860372/971414753534672916/coffee-g220b0b952_1280.png)',
      'background-size': 'cover'
    }"
  >
    <div class="container is-widescreen has-text-centered">
      <section class="section" id="app">
        <div class="content">
          <div
            class="column is-5"
            style="display: inline-block; text-align: left"
          >
            <div class="columns is-multiline">
              <div class="column is-6" v-for="t in table" :key="t.table_id">
                <div class="card">
                  <div class="card-image pt-5">
                    <figure class="image" v-if="t.status == 'unavailable'">
                      <img
                        style="height: 120px; width: 200px"
                        src="https://media.discordapp.net/attachments/844870220757860372/971619616965144636/ty.png"
                        alt="Placeholder image"
                      />
                    </figure>
                    <figure class="image" v-if="t.status == 'available'">
                      <img
                        style="height: 120px; width: 200px"
                        src="https://media.discordapp.net/attachments/934752929892667422/971620982869606430/try.png"
                        alt="Placeholder image"
                      />
                    </figure>
                  </div>
                  <div class="card-content has-text-centered">
                    <span class="icon-text">
                      <span style="height: 10px"
                        >Table No. {{ t.table_no }}<br />Status:
                        {{ t.status }}</span
                      >
                    </span>
                  </div>
                  <div class="card-footer">
                    <a
                      class="card-footer-item has-background-danger"
                      v-if="t.status == 'unavailable'"
                      @click="changeStatus('available', t.table_id)"
                      style="color: white"
                    >
                      In Used
                    </a>
                    <a
                      class="card-footer-item has-background-success"
                      v-if="t.status == 'available'"
                      @click="changeStatus('unavailable', t.table_id)"
                      style="color: white"
                    >
                      Not Used
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>
<script>
import axios from "@/plugins/axios";

export default {
  name: "managetable",
  props: ["user"],
  data() {
    return {
      table: [],
    };
  },
  mounted() {
    this.getTable();
  },

  methods: {
    getTable() {
      axios
        .get(`http://localhost:3000/table/${this.user.rest_id}`)
        .then((res) => {
          this.table = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    changeStatus(status, table_id) {
      axios
        .put(`http://localhost:3000/status/${table_id}`, { status: status })
        .then((res) => {
          this.getTable();
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
