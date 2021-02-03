<template>
<v-app class="bg">
  <v-row>
      <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
      <v-card color=#f3d2c1 class="ttt">
        <v-card-title primary-title class="justify-center">
          <v-icon large color=#001858>
            mdi-bag-checked
          </v-icon>
          <span class="title">ログイン</span>

        </v-card-title>
        <v-card-text color=#001858>
        <form>
          <v-text-field v-model="email" :counter="20" label="email" data-vv-name="email" required input-class="ttt">
          </v-text-field>
          <v-text-field v-model="password" label="password" data-vv-name="password" required
            :type="show1 ? 'text' : 'password'" :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show1 = !show1"></v-text-field>
          <v-btn block dark class="mr-4" @click="login" color="#001858" elevation="5">ログイン</v-btn>
          <p v-if="error" class="errors">{{ error }}</p>
        </form>
        </v-card-text>
      </v-card>
    </v-col>
  </v-row>
  <v-row>
      <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">

        <v-card color=#f3d2c1>
          <v-card-title primary-title class="justify-center">
            <v-icon large color=#001858>
              mdi-bag-checked
            </v-icon>
            <span class="title">初めてご利用の方はこちらから</span>
          </v-card-title>
          <v-card-text color=#001858>
            <v-hover v-slot:default="{ hover }">
              <v-btn block dark class="guest-btn" to="/signup" nuxt color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>会員登録
              </v-btn>
            </v-hover>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>

</v-app>

</template>

<script>
  import firebase from "@/plugins/firebase";
  import axios from "@/plugins/axios";
  export default {
    data() {
      return {
        email: "",
        password: "",
        show1: false,
        error: "",
      };
    },
    methods: {
      async login() {
        await firebase
          .auth()
          .signInWithEmailAndPassword(this.email, this.password)
          .catch((error) => {
            console.log(error);
            this.error = ((code) => {
              switch (code) {
                case "auth/user-not-found":
                  return "メールアドレスが間違っています";
                case "auth/wrong-password":
                  return "※パスワードが正しくありません";
                default:
                  return "※メールアドレスとパスワードをご確認ください";
              }
            })(error.code);
          });
        this.$router.push("/");
      },

    },
  };

</script>

<style lang="scss" scoped>
  .errors {
    color: red;
    margin-top: 20px;
  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
  }

  .title{
  color: #001858;
  text-align: center;
}
.mr-4{
  cursor: pointer;
    display: block;
    text-align: center;
    height: 150px;
    border-radius: 8px;
    border: 1px solid #dddddd;
    box-shadow: 4px 4px #f582ae;
}
.ttt{
  margin-top: 200px;
}
</style>
