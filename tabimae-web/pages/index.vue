<template>
  <div class="test">
    <Home />

    <v-container v-if="user">
      <v-row>
        <div class="page">
          <div class="buttons">
            <v-col cols="12" sm="8" offset-xs="3" xs="8" offset-md="3" md="9" offset-lg="3" lg="8">
              <ButtonDefault to="/travel_new" class="button">
                <template v-slot:label>
                  <v-icon large color="#001858">mdi-briefcase-plus-outline</v-icon>タビ新規登録
                  <p class="btn-text">まずは、旅行情報を登録してみよう</p>
                </template>
              </ButtonDefault>
            </v-col>
            <v-col cols="12" sm="8" xs="12" offset-md="3" md="9" offset-lg="3" lg="8">
              <ButtonDefault to="/travel_list" class="button">
                <template v-slot:label>
                  <v-icon large color="#001858">mdi-format-list-bulleted</v-icon>タビ一覧
                  <p class="btn-text">登録したタビの一覧を確認できます</p>
                </template>
              </ButtonDefault>
            </v-col>
          </div>
        </div>
      </v-row>

      <v-card color="#f3d2c1">
        <v-card-title primary-title class="justify-center">
          <v-icon large color="#001858">mdi-bag-checked</v-icon>
          <span class="title">旅行出発前に知っておきたいこと</span>
        </v-card-title>
        <v-card-text color="#001858">
          <p>画像をクリックすると知っておきたい情報をチェックできます</p>
        </v-card-text>
        <v-row>
          <Train />
          <Air />
          <TravelEtiquette />
        </v-row>
      </v-card>
    </v-container>

    <v-container v-else>
      <v-row>
        <div class="page">
          <div class="buttons">
            <v-col cols="12" sm="8" offset-xs="3" xs="8" offset-md="3" md="9" offset-lg="0" lg="5">
              <ButtonDefault to="/signup" class="button">
                <template v-slot:label>
                  <v-icon large color="#001858">mdi-account-plus</v-icon>新規会員登録
                  <p class="btn-text">はじめてご利用で履歴を残したい方</p>
                </template>
              </ButtonDefault>
            </v-col>
            <v-col cols="12" sm="8" offset-xs="3" xs="8" offset-md="3" md="9" offset-lg="1" lg="5">
              <ButtonDefault to="login" class="button">
                <template v-slot:label>
                  <v-icon large color="#001858">mdi-account-search</v-icon>ログイン
                  <p class="btn-text">既に会員登録がお済みの方</p>
                </template>
              </ButtonDefault>
            </v-col>
            <v-col cols="12" sm="8" offset-xs="3" xs="8" offset-md="3" md="9" offset-lg="1" lg="6">
              <ButtonDefault to="signup" class="guestLogin-button">
                <template v-slot:label @click="guestLogin">
                  <v-icon large color="#001858">mdi-briefcase-account</v-icon>ゲストログイン
                  <p class="btn-text">はじめてのご利用で一回限りご利用の方</p>
                </template>
              </ButtonDefault>
            </v-col>
          </div>
        </div>
      </v-row>
      </v-container>

        <About />

    <v-col sm="11" md="11" lg="12">
      <v-card color="#f3d2c1">
        <v-card-title primary-title class="justify-center">
          <v-icon large color="#001858">mdi-bag-checked</v-icon>
          <span class="title">旅行出発前に知っておきたいこと</span>
        </v-card-title>
        <v-card-text color="#001858">
          <p>画像をクリックすると知っておきたい情報をチェックできます</p>
        </v-card-text>
        <v-row>
          <Train />
          <Air />
          <TravelEtiquette />
        </v-row>
      </v-card>
    </v-col>

  </div>
</template>

<script>
  import NewTravel from "@/components/NewTravel";
  import TravelList from "@/components/TravelList";
  import axios from "@/plugins/axios";
  import firebase from "@/plugins/firebase";
  import Home from "~/components/Home.vue"; // 今回追加
  import Train from "~/components/Train.vue";
  import Air from "~/components/Air.vue";
  import TravelEtiquette from "~/components/TravelEtiquette.vue";
  import About from "~/components/About.vue";
  import ButtonDefault from "~/components/ButtonDefault.vue";

  export default {
    components: {
      NewTravel,
      TravelList,
      Home,
      ButtonDefault
    },
// created() {
//      console.log("API_KEY:", process.env.API_KEY);
//   },
    data() {
      return {};
    },
    computed: {
      user() {
        return this.$store.state.auth.currentUser;
      }
    },
    async fetch() {
      // console.log(this.$store.state.auth.currentUser.id);
      const user = this.$store.state.auth.currentUser;
    },
    methods: {
      async guestLogin() {
        await firebase
          .auth()
          .signInWithEmailAndPassword(
            process.env.GUEST_LOGIN_EMAIL,
            process.env.GUESTPW
          )
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
      openModal() {
        this.modalFlag = true;
      },

      closeModal() {
        this.modalFlag = false;
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

  };

</script>

<style lang="scss" scoped>
  .button {
    /* background-color: #f3d2c1; */
    border: solid 5px #001858;
    /*線*/
    border-radius: 10px;
    /*角の丸み*/
    text-decoration: none;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
    box-shadow: 4px 4px #f582ae;
    background-color: #abd1c6;
  }
.guestLogin-button{
   /* background-color: #f3d2c1; */
    border: solid 5px #001858;
    /*線*/
    border-radius: 10px;
    /*角の丸み*/
    text-decoration: none;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
    box-shadow: 4px 4px #f582ae;
    background-color: #eebbc3;
}
  .page {
    padding: 30px;

    >.buttons {
      display: -webkit-flex;

      >.button {}
    }
  }

  .btn-text {
    font-size: 12px;
  }

  p {
    color: #001858;
    text-align: center;
  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
  }

  .title {
    color: #001858;
    text-align: center;
  }


</style>
