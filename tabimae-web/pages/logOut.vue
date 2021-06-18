<template>
<v-app class="bg">
    <!-- <v-row> -->
    <v-col cols="12" lg="6" offset-lg="3">
      <v-card color=#f3d2c1 class="guestcard">
        <v-card-title primary-title class="justify-center">
        </v-card-title>

        <v-card-text color=#001858 class="text">
            <v-card-text class="text">
            <v-hover v-slot:default="{ hover }">
              <v-btn large dark class="guest-btn" @click="logOut" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-exit-to-app' : ''"></v-icon>ログアウトする
              </v-btn>
            </v-hover><br>
            </v-card-text>

            <v-card-text class="text">
            <v-hover v-slot:default="{ hover }">
              <v-btn large dark class="guest-btn" to="/" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-wallet-travel' : ''"></v-icon>このまま続ける
              </v-btn>
            </v-hover>
<br>ログアウト後　再度ご利用になる場合は、ログインし直してください。
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

      async logOut() {
        await firebase
          .auth()
          .signOut()
          .catch(error => {
            console.log(error);
          });

        this.$store.commit("setUser", null);
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