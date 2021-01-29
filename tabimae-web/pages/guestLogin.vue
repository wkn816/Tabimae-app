<template>
  <v-row>
    <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
      <v-card color=#f3d2c1>
        <v-card-title primary-title class="justify-center">
          <v-icon large color=#001858>
            mdi-bag-checked
          </v-icon>
          <span class="title">ゲストログイン</span>
        </v-card-title>

        <v-card-text color=#001858 class="text">
          <span class="text">ゲストログインでのご利用の場合履歴を残すことは出来ません。</span><br>
          <span class="text">よろしいですか？</span><br>
            <v-card-text class="text">はい
              <v-icon medium color=#001858>
                mdi-arrow-right-bold-outline
              </v-icon>
            <v-hover v-slot:default="{ hover }">
              <v-btn dark class="guest-btn" @click="guestLogin" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>ゲストログイン
              </v-btn>
            </v-hover><br>
            </v-card-text>

            <sv-card-text class="text">いいえ
              <v-icon medium color=#001858>
                mdi-arrow-right-bold-outline
              </v-icon>
            <v-hover v-slot:default="{ hover }">
              <v-btn dark class="guest-btn" to="signup" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>新規会員登録　
              </v-btn>
            </v-hover>
            </sv-card-text>

        </v-card-text>
      </v-card>
</v-col>
  </v-row>
</template>

<script>
  import axios from "@/plugins/axios";
  import firebase from "@/plugins/firebase";
  export default {
    data() {
      return {

      };
    },
    methods: {

      async guestLogin() {
        firebase
          .auth()
          .signInWithEmailAndPassword(process.env.GUEST_LOGIN_EMAIL, process.env.GUESTPW)
          .catch(error => {
            console.log(error);
            this.error = (code => {
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

  // .guest-btn{
  //   cursor: pointer;
  //     display: block;
  //     text-align: center;
  //     height: 150px;
  //     border-radius: 8px;
  //     border: 1px solid #dddddd;
  //     box-shadow: 4px 4px #f582ae;
  // }
  .title {
    color: #001858;
    text-align: center;
  }

  .signup-card {
    margin: 12px;
  }

  .text {
    text-align: center;
    color: #001858;

  }
  .yes-card{
    margin: 30px 0 30px 0;
  }

</style>
