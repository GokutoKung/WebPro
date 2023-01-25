<template>
    <div class="container is-fluid has-background-grey-lighter">
      <div class="columns is-centered">
        <div class="column is-5">
          <h1 class="title has-text-centered">Sign Up</h1>
          <!-- Sign up form -->
          <div class="field">
            <label class="label">Username</label>
            <div class="control has-icons-left">
              <input
                v-model="$v.username.$model"
                :class="{ 'is-danger': $v.username.$error }"
                class="input"
                type="text"
              />
              <span class="icon is-small is-left">
                <i class="fas fa-user"></i>
              </span>
            </div>
            <template v-if="$v.username.$error">
              <p class="help is-danger" v-if="!$v.username.required">
                This field is required
              </p>
              <p class="help is-danger" v-if="!$v.username.minLength">
                Must be at least 5 characters
              </p>
            </template>
          </div>

          <div class="field">
            <label class="label">Password</label>
            <div class="control has-icons-left has-icons-right">
              <input
                v-model="$v.password.$model"
                :class="{ 'is-danger': $v.password.$error }"
                class="input"
                type="password"
              />
              <span class="icon is-small is-left">
                <i class="fas fa-lock"></i>
              </span>
            </div>
            <template v-if="$v.password.$error">
              <p class="help is-danger" v-if="!$v.password.required">
                This field is required
              </p>
              <p class="help is-danger" v-if="!$v.password.minLength">
                Must be at least 8 character
              </p>
              <p class="help is-danger" v-if="!$v.password.complex">
                Password too easy
              </p>
            </template>
          </div>

          <div class="field">
            <label class="label">Confirm Password</label>
            <div class="control has-icons-left has-icons-right">
              <input
                v-model="$v.confirm_password.$model"
                :class="{ 'is-danger': $v.confirm_password.$error }"
                class="input"
                type="password"
              />
              <span class="icon is-small is-left">
                <i class="fas fa-lock"></i>
              </span>
            </div>
            <template v-if="$v.confirm_password.$error">
              <p class="help is-danger" v-if="!$v.confirm_password.sameAs">
                Password not match
              </p>
            </template>
          </div>

          <div class="field">
            <label class="label">Email</label>
            <div class="control has-icons-left has-icons-right">
              <input
                v-model="$v.email.$model"
                :class="{ 'is-danger': $v.email.$error }"
                class="input"
                type="text"
              />
              <span class="icon is-small is-left">
                <i class="fas fa-envelope"></i>
              </span>
            </div>
            <template v-if="$v.email.$error">
              <p class="help is-danger" v-if="!$v.email.required">
                This field is required
              </p>
              <p class="help is-danger" v-if="!$v.email.email">Invalid Email</p>
            </template>
          </div>

          <div class="field">
            <label class="label">Phone Number</label>
            <div class="control has-icons-left has-icons-right">
              <input
                v-model="$v.phone.$model"
                :class="{ 'is-danger': $v.phone.$error }"
                class="input"
                type="text"
              />
              <span class="icon is-small is-left">
                <i class="fas fa-mobile"></i>
              </span>
            </div>
            <template v-if="$v.phone.$error">
              <p class="help is-danger" v-if="!$v.phone.required">
                This field is required
              </p>
              <p class="help is-danger" v-if="!$v.phone.phone">
                Invalid Phone Number
              </p>
            </template>
          </div>

          <div class="field">
            <label class="label">First Name</label>
            <div class="control has-icons-left has-icons-right">
              <input
                v-model="$v.first_name.$model"
                :class="{ 'is-danger': $v.first_name.$error }"
                class="input"
                type="text"
              />
            </div>
            <template v-if="$v.first_name.$error">
              <p class="help is-danger" v-if="!$v.first_name.required">
                This field is required
              </p>
            </template>
          </div>

          <div class="field">
            <label class="label">Last Name</label>
            <div class="control has-icons-left has-icons-right">
              <input
                v-model="$v.last_name.$model"
                :class="{ 'is-danger': $v.last_name.$error }"
                class="input"
                type="text"
              />
            </div>
            <template v-if="$v.last_name.$error">
              <p class="help is-danger" v-if="!$v.last_name.required">
                This field is required
              </p>
            </template>
          </div>

          <button class="button is-primary is-fullwidth" @click="submit()">Sign Up</button>

          <p class="my-3">Already have an account? <a href="#">Login</a></p>
        </div>
      </div>
    </div>
</template>

<script>
import axios from '@/plugins/axios'
import {
  required,
  email,
  helpers,
  minLength,
  maxLength,
  sameAs,
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
  data() {
    return {
      username: "",
      password: "",
      confirm_password: "",
      email: "",
      phone: "",
      first_name: "",
      last_name: "",
    };
  },
  methods: {
    submit() {
      this.$v.$touch();

      if (!this.$v.$invalid) {
        let data = {
          username: this.username,
          password: this.password,
          confirm_password: this.confirm_password,
          email: this.email,
          phone: this.phone,
          first_name: this.first_name,
          last_name: this.last_name,
        };

        axios
          .post("http://localhost:3000/user/signup", data)
          .then((res) => {
            alert("Sign up Success");
          })
          .catch((err) => {
            alert(err.response.data.details.message)
          });
      }
    },
  },
  validations: {
    email: {
      required: required,
      email: email,
    },
    phone: {
      required: required,
      phone: phone,
    },
    password: {
      required: required,
      minLength: minLength(8),
      complex: complexPassword,
    },
    confirm_password: {
      sameAs: sameAs("password"),
    },
    username: {
      required: required,
      minLength: minLength(5),
      maxLength: maxLength(10),
    },
    first_name: {
      required: required,
      maxLength: maxLength(150),
    },
    last_name: {
      required: required,
      maxLength: maxLength(150),
    },
  },
};
</script>