<template>
<v-app class="bg">
    <!-- <v-row> -->
    <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
      <v-card color=#f3d2c1 class="guestcard">
        <v-card-title primary-title class="justify-center">
          <!-- <v-icon large color=#001858>
            mdi-bag-checked
          </v-icon> -->
          <v-icon
        x-large
        color=#e53170
      >
      mdi-chevron-double-right
      </v-icon>
          <v-title class="display">ゲストログイン</v-title>
          <v-icon
        x-large
        color=#e53170
      >
      mdi-chevron-double-left      </v-icon>
        </v-card-title>

        <v-card-text color=#001858 class="text">
          <span class="text">ゲストログインでのご利用の場合履歴を残すことは出来ません。</span><br>
          <span class="text">よろしいですか？</span><br>
            <v-card-text class="text">
            <v-hover v-slot:default="{ hover }">
              <v-btn large dark class="guest-btn" @click="guestLogin" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-checkbox-marked-circle' : ''"></v-icon>YES
              </v-btn>
            </v-hover><br>
            </v-card-text>

            <v-card-text class="text">
            <v-hover v-slot:default="{ hover }">
              <v-btn large dark class="guest-btn" to="signup" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-close-circle' : ''"></v-icon>NO
              </v-btn>
            </v-hover>
<br>※『NO』の場合新規会員登録画面に移動します。
            </v-card-text>
                        <v-card-text class="text">
            </v-card-text>

        </v-card-text>
      </v-card>
</v-col>
  <!-- </v-row> -->
</v-app>
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
  .bg {
    background-color: #fef6e4;
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
  .guestcard{
    margin-top: 100px;
  }
  .display{
  color: #001858;
  text-align: center;
  font-size: 30px;
  font-family: 'TabimaeFont';
}

</style>
