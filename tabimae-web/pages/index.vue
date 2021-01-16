<template>
  <v-hover v-slot:default="{ hover }">
    <v-btn class="guest-btn" @click="guestLogin">
      <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>ゲストログイン
    </v-btn>
  </v-hover>
</template>

<script>
import NewTravel from "@/components/NewTravel";
import TravelList from "@/components/TravelList";
import axios from "@/plugins/axios";
import firebase from "@/plugins/firebase";
export default {
  components: {
    NewTravel,
    TravelList,
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

<style></style>
