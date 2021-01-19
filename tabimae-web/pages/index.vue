<template>
  <div class="test">
    <Home />
    <v-hover v-slot:default="{ hover }">
      <v-btn  block
        dark class="guest-btn" @click="guestLogin">
        <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>ゲストログイン
      </v-btn>
    </v-hover>
    <v-container>
      <v-row>
        <About />
      </v-row>
      <v-row>
        <Train />
        <Air />
        <TravelEtiquette />
      </v-row>
    </v-container>
  </div>

</template>

<script>
  import NewTravel from "@/components/NewTravel";
  import TravelList from "@/components/TravelList";
  import axios from "@/plugins/axios";
  import firebase from "@/plugins/firebase";
  import Home from '~/components/Home.vue'; // 今回追加
  import Train from '~/components/Train.vue';
  import Air from '~/components/Air.vue';
  import TravelEtiquette from '~/components/TravelEtiquette.vue';
  import About from '~/components/About.vue';



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
      openModal() {
        this.modalFlag = true
      },
      closeModal() {
        this.modalFlag = false
      }
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

<style lang="scss" scoped>


</style>
