<template>
  <div class="container hero is-fullheight is-fluid has-background-dark">
    <section class="section" id="app">
      <div class="content">
        <div class="columns is-multiline">
          <div class="column is-3" v-for="food in foods" :key="food.f_id">
            <div class="card">
              <div class="card-image pt-5">
                <figure class="image">
                  <img
                    style="height: 120px; width: 220px"
                    :src="food.image"
                    alt="Placeholder image"
                  />
                </figure>
              </div>
              <div class="card-content">
                <div class="is-size-4 has-text-centered">{{ food.name }}</div>
                <div class="content has-text-danger has-text-centered" style="height: 10px">
                  {{ food.price }} ฿
                </div>
              </div>
              <footer class="card-footer"></footer>
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
  name: "Home",
  props: ["user"],
  data() {
    return {
      foods: [],
    };
  },
  mounted() {
    this.getFoods();
  },
  methods: {
    getFoods() {
      axios
        .get("http://localhost:3000/foods",)
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
