<template>
  <v-app class="bg">
    <v-row>
      <v-col cols="12" lg="6" offset-lg="3">
        <v-card color=#8bd3dd class="login-card">
          <v-card-title primary-title class="justify-center">
            <v-icon x-large color=#e53170>
              mdi-chevron-double-right
            </v-icon>
            <v-card-title class="login-title">ログイン</v-card-title>
            <v-icon x-large color=#e53170>
              mdi-chevron-double-left </v-icon>
          </v-card-title>
          <v-card-text color=#fef6e4>
            <form>
              <v-text-field v-model="email" :counter="20" label="email" data-vv-name="email" required>
              </v-text-field>
              <v-text-field v-model="password" label="password" data-vv-name="password" required
                :type="show1 ? 'text' : 'password'" :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="show1 = !show1"></v-text-field>
              <v-hover v-slot:default="{ hover }">
                <v-btn block dark class="login-btn" @click="login(email,password)" color="#001858" elevation="5">
                  <v-icon v-text="hover ? 'mdi-account-search' : ''">mdi-account-search-outline</v-icon>ログイン

                </v-btn>
              </v-hover>
              <p v-if="error" class="errors">{{ error }}</p>
            </form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12" lg="6" offset-lg="3">
        <v-card color=#f3d2c1>
          <v-card-title primary-title class="justify-center">
            <v-icon x-large color=#e53170>
              mdi-chevron-double-right
            </v-icon>
            <v-card-title class="login-title">はじめての方はこちら</v-card-title>
            <v-icon x-large color=#e53170>
              mdi-chevron-double-left </v-icon>
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
        show1: true,
        error: "",
      };
    },
    methods: {
      async login(email,password) {
        const errorMessage = [
        "メールアドレスを入力してください",
        "パスワードを入力してください",
      ];
        if (email == "") {
          this.error = errorMessage[0];
          return
        }
        if (password == "") {
          this.error = errorMessage[1];
          return
        }
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
    text-align: center;
  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
  }

  .login-title {
    color: #001858;
    text-align: center;
  }

  .signin-title {
    color: #001858;
    text-align: center;
  }

  .login-btn {
    cursor: pointer;
    display: block;
    text-align: center;
    height: 150px;
    border-radius: 8px;
    border: 1px solid #dddddd;
    box-shadow: 4px 4px #f582ae;
  }

  .login-card {
    margin-top: 170px;
  }

</style>
