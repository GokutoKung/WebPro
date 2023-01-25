<template>
<div
    :style="{ 'background-image': 'url(https://cdn.discordapp.com/attachments/844870220757860372/971791810798166106/cv.png)', 'background-size':'cover'}"
  >
  <div class="container hero is-fullheight" style="
        align-items: center;
      position:relative;
      height:100px;
      ">
    <div class="column is-6" style="display: inline-block; text-align: left">
      <div class="box">
        <h2 class="title has-text-centered">My Profile</h2>
        <article class="media">
          <div class="media-content">
            <div class="content">
              <div class="field">
                <label class="label">First Name</label>
                <div class="control">
                  <p v-if="editToggle == -1">{{ fname }}</p>
                  <input
                    v-if="editToggle == 1"
                    v-model="$v.editFname.$model"
                    :class="{ 'is-danger': $v.editFname.$error }"
                    class="input"
                    type="text"
                    :placeholder="fname"
                  />
                </div>
                <template v-if="$v.editFname.$error">
                  <p class="help is-danger" v-if="!$v.editFname.maxLength">
                    Must be up to 150 character
                  </p>
                </template>
              </div>

              <div class="field">
                <label class="label">Last Name</label>
                <div class="control">
                  <p v-if="editToggle == -1">{{ lname }}</p>
                  <input
                    v-if="editToggle == 1"
                    v-model="$v.editLname.$model"
                    :class="{ 'is-danger': $v.editLname.$error }"
                    class="input"
                    type="text"
                    :placeholder="lname"
                  />
                </div>
                <template v-if="$v.editLname.$error">
                  <p class="help is-danger" v-if="!$v.editLname.maxLength">
                    Must be up to 150 character
                  </p>
                </template>
              </div>

              <div class="field">
                <label class="label">Phone</label>
                <div class="control">
                  <p v-if="editToggle == -1">{{ phone }}</p>
                  <input
                    v-if="editToggle == 1"
                    v-model="$v.editPhone.$model"
                    :class="{ 'is-danger': $v.editPhone.$error }"
                    class="input"
                    type="text"
                    :placeholder="phone"
                  />
                </div>
                <template v-if="$v.editPhone.$error">
                  <p class="help is-danger" v-if="!$v.editPhone.phone">
                    Invalid Phone Number
                  </p>
                </template>
              </div>

              <div class="field">
                <label class="label">Email</label>
                <div class="control">
                  <p v-if="editToggle == -1">{{ email }}</p>
                  <input
                    v-if="editToggle == 1"
                    v-model="$v.editEmail.$model"
                    :class="{ 'is-danger': $v.editEmail.$error }"
                    class="input"
                    type="text"
                    :placeholder="email"
                  />
                </div>
                <template v-if="$v.editEmail.$error">
                  <p class="help is-danger" v-if="!$v.editEmail.email">
                    Invalid Email
                  </p>
                </template>
              </div>

              <div class="field" v-if="isCustomer()">
                <label class="label">Point</label>
                <div class="control">
                  <p>{{ point }}</p>
                </div>
              </div>

              <div class="field" v-if="isCustomer()">
                <label class="label">Customer No.</label>
                <div class="control">
                  <p>{{ cust_id }}</p>
                </div>
              </div>

              <div class="field" v-if="isEmployee()">
                <label class="label">Shift</label>
                <div class="control">
                  <p v-if="shift == 1">10.00 a.m. - 3.00 a.m.</p>
                  <p v-if="shift == 2">3.00 p.m. - 8.00 p.m.</p>
                </div>
              </div>

              <div class="field" v-if="isEmployee()">
                <label class="label">Employee No.</label>
                <div class="control">
                  <p>{{ emp_id }}</p>
                </div>
              </div>

              <div
                class="field is-grouped is-grouped-right"
                v-if="editToggle == -1"
              >
                <div class="control">
                  <button class="button is-warning" @click="openEdit()">
                    Edit Profile
                  </button>
                </div>
                <div class="control">
                  <button class="button is-danger" @click="openPass()">
                    Change Password
                  </button>
                </div>
              </div>

              <div
                class="field is-grouped is-grouped-right"
                v-if="editToggle == 1"
              >
                <div class="control">
                  <button class="button is-success" @click="saveEdit()">
                    Save
                  </button>
                </div>
                <div class="control">
                  <button class="button is-danger" @click="cancelEdit()">
                    Cancel
                  </button>
                </div>
              </div>

              <div class="field" v-if="passToggle == 1">
                <label class="label">Password</label>
                <div class="control has-icons-left has-icons-right">
                  <input
                    v-model="$v.editPass.$model"
                    :class="{ 'is-danger': $v.editPass.$error }"
                    class="input"
                    type="password"
                  />
                  <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                  </span>
                </div>
                <template v-if="$v.editPass.$error">
                  <p class="help is-danger" v-if="!$v.editPass.required">
                    This field is required
                  </p>
                  <p class="help is-danger" v-if="!$v.editPass.minLength">
                    Must be at least 8 character
                  </p>
                  <p class="help is-danger" v-if="!$v.editPass.complex">
                    Password too easy
                  </p>
                </template>
              </div>

              <div class="field" v-if="passToggle == 1">
                <label class="label">Confirm Password</label>
                <div class="control has-icons-left has-icons-right">
                  <input
                    v-model="$v.editConPass.$model"
                    :class="{ 'is-danger': $v.editConPass.$error }"
                    class="input"
                    type="password"
                  />
                  <span class="icon is-small is-left">
                    <i class="fas fa-lock"></i>
                  </span>
                </div>
                <template v-if="$v.editConPass.$error">
                  <p class="help is-danger" v-if="!$v.editConPass.sameAs">
                    Password not match
                  </p>
                </template>
              </div>

              <div
                class="field is-grouped is-grouped-right"
                v-if="passToggle == 1"
              >
                <div class="control">
                  <button class="button is-success" @click="savePass()">
                    Save
                  </button>
                </div>
                <div class="control">
                  <button class="button is-danger" @click="cancelPass()">
                    Cancel
                  </button>
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
import {
  email,
  helpers,
  maxLength,
  minLength,
  sameAs,
  required,
} from "vuelidate/lib/validators";

function phone(value) {
  return !helpers.req(value) || !!value.match(/0[0-9]{9}/);
}

function complexPassword(value) {
  if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
    return false;
  }
  return true;
}

export default {
  name: "profile",
  props: ["user"],
  data() {
    return {
      fname: null,
      lname: null,
      phone: null,
      email: null,
      point: null,
      cust_id: null,
      shift: null,
      emp_id: null,
      editToggle: -1,
      passToggle: -1,
      editFname: "",
      editLname: "",
      editPhone: "",
      editEmail: "",
      editPass: "",
      editConPass: "",
    };
  },
  mounted() {
    this.setProfile();
  },
  methods: {
    setProfile() {
      this.fname = this.user.first_name;
      this.lname = this.user.last_name;
      this.phone = this.user.phone;
      this.email = this.user.email;
      this.cust_id = this.user.cust_id;
      this.emp_id = this.user.emp_id;
      this.point = this.user.point;
      this.shift = this.user.shift;
    },
    openEdit() {
      this.editToggle = 1;
    },
    openPass() {
      this.passToggle = 1;
    },
    saveEdit() {
      this.$v.$touch();

      if (this.editFname != null) {
        this.fname = this.editFname;
      }

      if (this.editLname != null) {
        this.lname = this.editLname;
      }

      if (this.editEmail != null) {
        this.email = this.editEmail;
      }

      if (this.editPhone != null) {
        this.phone = this.editPhone;
      }

      if (this.editUsername != null) {
        this.user = this.editUsername;
      }

      axios
        .put(`http://localhost:3000/${this.user.id}/edit`, {
          fname: this.fname,
          lname: this.lname,
          phone: this.phone,
          email: this.email,
        })
        .then((res) => {
          this.editFname = null;
          this.editLname = null;
          this.editEmail = null;
          this.editPhone = null;
          this.editUsername = null;
          this.editToggle = -1;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    savePass() {
      this.$v.$touch();

      axios
        .put(`http://localhost:3000/pass/${this.user.id}`, {
          password: this.editPass,
          confirm_password: this.editConPass,
        })
        .then((res) => {
          this.editPass = "";
          this.editConPass = "";
          this.passToggle = -1;
        })
        .catch((err) => {
          console.log(err);
        });
    },
    cancelEdit() {
      this.editToggle = -1;
      this.editFname = null;
      this.editLname = null;
      this.editEmail = null;
      this.editPhone = null;
      this.editUsername = null;
    },
    cancelPass() {
      this.passToggle = -1;
      this.editPass = "";
      this.editConPass = "";
    },
    isCustomer() {
      if (!this.user) return false;
      return this.user.role === "cust";
    },
    isEmployee() {
      if (!this.user) return false;
      return this.user.role === "emp";
    },
  },
  validations: {
    editEmail: {
      email: email,
    },
    editPhone: {
      phone: phone,
    },
    editFname: {
      maxLength: maxLength(150),
    },
    editLname: {
      maxLength: maxLength(150),
    },
    editPass: {
      required: required,
      minLength: minLength(8),
      complex: complexPassword,
    },
    editConPass: {
      sameAs: sameAs("editPass"),
    },
  },
};
</script>
