<template>
  <v-hover v-slot:default="{ hover }">
    <v-btn class="guest-btn" @click="guestLogin">
      <v-icon v-text="hover ? 'mdi-heart' : ''"></v-icon>サッソク試してみる
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
    TravelList
  },
  data() {
    return {
    };
  },
  methods: {
    async guestLogin() {
      this.$store.commit("setLoading", true);
        const res = await firebase
        .auth()
        .signInWithEmailAndPassword("testtest777@gmail.com", "aaaaaa")
        .catch((error) => {
            this.error = ((code) => {
              switch (code) {
                case "auth/email-already-in-use":
                  return "既にそのメールアドレスは使われています";
                case "auth/wrong-password":
                  return "※パスワードが正しくありません";
                case "auth/weak-password":
                  return "※パスワードは最低6文字以上にしてください";
                default:
                  return "※メールアドレスとパスワードをご確認ください";
              }
            })(error.code);
          });
          const user = {
          email: res.user.email,
          name: this.name,
          uid: res.user.uid,
        };
        await axios.post("/v1/users", {
          user
        }).catch((err) => {
          console.log({
            err
          });
        });
        this.$router.push("/travel_list");
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
  },
};
</script>

<style></style>
