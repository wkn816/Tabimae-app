<template>
<div class="test">
    <Home/>
    <v-hover v-slot:default="{ hover }">
      <v-btn class="guest-btn" @click="guestLogin">
        <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>ゲストログイン
      </v-btn>
    </v-hover>

  </div>

</template>

<script>
  import NewTravel from "@/components/NewTravel";
  import TravelList from "@/components/TravelList";
  import axios from "@/plugins/axios";
  import firebase from "@/plugins/firebase";
  import Home from '~/components/Home.vue' // 今回追加



  export default {
    components: {
      NewTravel,
      TravelList,
      Home,
    },

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
        this.$router.push("/travel_list");
      },
      // .catch(error => {
      //   console.log(error);
      //   this.error = (code => {
      //     switch (code) {
      //       case "auth/user-not-found":
      //         return "メールアドレスが間違っています";
      //       case "auth/wrong-password":
      //         return "※パスワードが正しくありません";
      //       default:
      //         return "※メールアドレスとパスワードをご確認ください";
      //     }
      //   })(error.code);
      // });
    },
    // },
  };

</script>

<style  lang="scss" scoped>
.test {
  background: url("../assets/img/ppf.jpg");
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100vh;

  &-text {
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
  }
}
</style>
