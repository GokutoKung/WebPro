<template>
  <div
    :style="{
      'background-image':
        'url(https://cdn.discordapp.com/attachments/844870220757860372/971792740855730196/qq.jpg)',
      'background-size': 'cover,contain',
    }"
  >
    <div
      class="container hero is-fullheight"
      style="align-items: center; position: relative; height: 100px"
    >
      <div class="column is-7">
        <div class="box">
          <h2 class="title has-text-centered">Order</h2>
          <article class="media">
            <div class="media-content">
              <div class="content">
                <div
                  class="field is-grouped"
                  v-for="(item, index) in items"
                  :key="item.id"
                >
                  <div class="field-label is-normal">
                    <label class="label">Food: {{ item.food_name }} </label>
                  </div>
                  <div class="field-label is-normal has-text-centered">
                    <label class="label">Amount: {{ item.amount }} </label>
                  </div>
                  <div class="control">
                    <button class="button is-danger" @click="deleteItem(index)">
                      Delete
                    </button>
                  </div>
                </div>
              </div>
              <div class="field is-grouped">
                <div class="field-label is-normal">
                  <label class="label">Foods:</label>
                </div>
                <div class="control">
                  <div class="select">
                    <select v-model="newItem">
                      <option
                        :value="food.f_id"
                        v-for="food in foods"
                        :key="food.f_id"
                      >
                        {{ food.name }}
                      </option>
                    </select>
                  </div>
                </div>
                <div class="field-label is-normal">
                  <label class="label">Amount:</label>
                </div>
                <div class="control">
                  <input
                    v-model="newAmount"
                    class="input"
                    type="text"
                    placeholder="Enter your Amount"
                  />
                </div>
                <div class="control">
                  <button class="button" @click="addItem()">
                    <span class="icon">
                      <i class="fas fa-plus"></i>
                    </span>
                  </button>
                </div>
              </div>
              <div class="field is-grouped is-grouped-centered">
                <label
                  class="label"
                  style="position: relative; left: -30px; top: 5px"
                  >ID</label
                >
                <div class="control has-text-centered">
                  <input
                    class="input"
                    type="text"
                    v-model="cust_id"
                    placeholder="Enter Customer ID"
                  />
                </div>
                <div class="control">
                  <button class="button is-success" @click="submit()">
                    <router-link to="/" style="color: white">
                      Submit
                    </router-link>
                  </button>
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
  name: "order",
  props: ["user"],
  data() {
    return {
      foods: [],
      items: [],
      newItem: null,
      newAmount: null,
      total: 0,
      price: 0,
      cust_id: null,
      newOrderId: null,
    };
  },
  mounted() {
    this.getFoods();
    this.getNewOrderId();
  },
  watch: {
    items() {
      this.sumPrice();
    },
  },
  methods: {
    getFoods() {
      axios
        .get("http://localhost:3000/foods")
        .then((res) => {
          this.foods = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addItem() {
      this.items.push({
        food: this.newItem,
        food_name: this.setFoodName(this.newItem),
        amount: parseInt(this.newAmount),
        unit_price: parseInt(this.setUnitPrice(this.newItem)),
      });
      this.newItem = null;
      this.newAmount = null;
    },
    setFoodName(id) {
      for (var i in this.foods) {
        if (this.foods[i].f_id === id) {
          return this.foods[i].name;
        }
      }
    },
    setUnitPrice(id) {
      for (var i in this.foods) {
        if (this.foods[i].f_id === id) {
          return this.foods[i].price;
        }
      }
    },
    deleteItem(index) {
      this.items.splice(index, 1);
    },
    sumPrice() {
      this.total = 0;
      for (var i in this.items) {
        this.total += this.items[i].unit_price * this.items[i].amount;
      }
      this.price = this.total;
    },
    getNewOrderId() {
      axios
        .get("http://localhost:3000/order/new")
        .then((res) => {
          this.newOrderId = res.data.id + 1;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addOrderItem() {
      for (var i in this.items) {
        axios
          .post(`http://localhost:3000/additem/${this.newOrderId}`, {
            unit_price: this.items[i].unit_price,
            amount: this.items[i].amount,
            f_id: this.items[i].food,
          })
          .then((res) => {})
          .catch((err) => {
            console.log(err);
          });
      }
    },
    confirmOrder() {
      axios
        .post(
          `http://localhost:3000/${this.cust_id}/order/${this.user.rest_id}`,
          { price: this.price, item: this.items, id: this.newOrderId }
        )
        .then((res) => {})
        .catch((err) => {
          console.log(err);
        });
    },
    submit() {
      this.confirmOrder();
      this.addOrderItem();
    },
  },
};
</script>
