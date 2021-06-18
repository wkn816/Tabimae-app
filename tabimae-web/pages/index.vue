<template>
  <v-app class="bg">
    <Home />
    <v-container v-if="user">
      <div class="page">
        <div class="buttons">

          <v-row>
            <v-col cols="12" offset-lg="1" lg="4">
              <ButtonDefault to="/travelNew" class="traveladd-button">
                <template v-slot:label class="test">
                  <v-icon large color="#001858">mdi-briefcase-plus-outline</v-icon>
                  <span class="top-btn">タビを登録する</span>
                  <p class="btn-text">まずは、旅行情報を登録してみよう</p>
                </template>
              </ButtonDefault>
            </v-col>

            <v-col cols="12" offset-lg="2" lg="4">
              <ButtonDefault to="/travelList" class="travellist-button">
                <template v-slot:label>
                  <v-icon large color="#001858">mdi-format-list-bulleted</v-icon>
                  <span class="top-btn">タビ一覧</span>
                  <p class="btn-text">登録したタビの一覧を確認できます</p>
                </template>
              </ButtonDefault>
            </v-col>
          </v-row>
        </div>
      </div>
      <TravelInfo />
    </v-container>

    <v-container v-else>
        <div class="page">
          <div class="buttons">
            <v-row>
            <v-col cols="12" offset-lg="0" lg="3">
                <ButtonDefault to="/signup" class="button">
                  <template v-slot:label>
                    <v-icon large color="#001858">mdi-account-plus</v-icon>
                    <span class="top-btn">新規会員登録</span>
                    <p class="btn-text">はじめてご利用で履歴を残したい方</p>
                  </template>
                </ButtonDefault>
              </v-col>
            <v-col cols="12" offset-lg="1" lg="3">
                <ButtonDefault to="login" class="button">
                  <template v-slot:label>
                    <v-icon large color="#001858">mdi-account-search</v-icon>
                    <span class="top-btn">ログイン</span>
                    <p class="btn-text">既に会員登録がお済みの方</p>
                  </template>
                </ButtonDefault>
              </v-col>
            <v-col cols="12"offset-lg="1" lg="4">
                <div @click="guestLogin">
                <GuestLoginButton class="guestLogin-button">
                  <template v-slot:label>
                    <v-icon large color="#001858">mdi-briefcase-account</v-icon>
                    <span class="top-btn">ゲストログイン</span>
                    <p class="btn-text">はじめてのご利用で一回限りご利用の方</p>
                  </template>
                </GuestLoginButton>
                </div>
              </v-col>
            </v-row>
          </div>
        </div>
      <About />
      <TravelInfo />
    </v-container>
  </v-app>
</template>

<script>
  import axios from "@/plugins/axios";
  import firebase from "@/plugins/firebase";
  import Home from "@/components/Home.vue";
  import Train from "@/components/Train.vue";
  import Air from "@/components/Air.vue";
  import TravelEtiquette from "@/components/TravelEtiquette.vue";
  import HowTo from "@/components/HowTo.vue";
  import About from "@/components/About.vue";
  import ButtonDefault from "@/components/ButtonDefault.vue";
  import GuestLoginButton from "@/components/GuestLoginButton.vue";
  import TravelInfo from "@/components/TravelInfo.vue";

  export default {
    components: {
      Home,
      Train,
      Air,
      TravelEtiquette,
      HowTo,
      About,
      ButtonDefault,
      GuestLoginButton,
      TravelInfo
    },

    computed: {
      user() {
        return this.$store.state.auth.currentUser;
      }
    },

    data() {
      return {};
    },

    async fetch() {
      const user = this.$store.state.auth.currentUser;
    },
    methods: {
      async guestLogin() {
          this.$store.commit("loading/setLoading", true);
        firebase
          .auth()
          .signInWithEmailAndPassword(process.env.GUEST_LOGIN_EMAIL, process.env.GUESTPW)
          .then(() => {
          setTimeout(() => {
              this.$store.commit("loading/setLoading", false);
            }, 1000);
            })
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
    },

  };

</script>

<style lang="scss" scoped>
  $tab: 680px; // タブレット
  $sp: 480px; // スマホ

  @mixin tab {
    @media (max-width: ($tab)) {
      @content;
    }
  }

  @mixin sp {
    @media (max-width: ($sp)) {
      @content;
    }
  }

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
    box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.4);
    background-color: #d1d1e9;
    color: #001858;
  }

  .guestLogin-button {
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
    box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.4);
    background-color: #ffc0ad;
    color: #001858;

  }

  .page {
    padding: 30px;

  }

  .btn-text {
    font-size: 12px;
  }

  p {
    color: #001858;
    text-align: center;
    font-family: 'TabimaeFont';
  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
    font-family: 'TabimaeFont';
  }

  .title {
    color: #001858;
    text-align: center;
    font-family: 'TabimaeFont';
  }

  .traveladd-button {
    color: #001858;
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
    box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.4);
    background-color: #f9bc60;
    font-family: 'TabimaeFont';
  }

  .travellist-button {
    color: #001858;
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
    box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.4);
    background-color: #2cb67d;
    font-family: 'TabimaeFont';
  }

  .top-btn {
    font-family: 'TabimaeFont';
  }
  .buttons{
        font-family: 'TabimaeFont';

  }


</style>
