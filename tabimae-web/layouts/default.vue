<template>
  <v-app class="bg">
    <v-navigation-drawer absolute
        temporary v-model="drawer" :mini-variant="miniVariant" :clipped="clipped" fixed color=#f3d2c1>
      <v-list>
        <v-list-item v-for="(item, i) in items" :key="i" :to="item.to" router exact>
          <v-list-item-action>
            <v-icon color=#001858>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title class="list-item" v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar fixed color="rgba(10,10,100,0.2)">
      <v-app-bar-nav-icon color="#001858" @click.stop="drawer = !drawer" />
      <!-- <v-btn icon @click.stop="miniVariant = !miniVariant">
        <v-icon>mdi-{{ `chevron-${miniVariant ? "right" : "left"}` }}</v-icon>
      </v-btn>
      <v-btn icon @click.stop="clipped = !clipped">
        <v-icon>mdi-bag-checked</v-icon>
      </v-btn>
      <v-btn icon @click.stop="fixed = !fixed">
        <v-icon>mdi-minus</v-icon>
      </v-btn> -->
      <v-btn text color="#001858" @click="travelTop" v-text="title" />
      <v-spacer />

      <v-container v-if="user">
        <v-row>
          <v-col cols="12" offset-lg="6" offset-sm="7" offset-md="7" sm="5" md="5" lg="6">
            <v-btn text color="#001858" @click="travelTop">TOP</v-btn>
            <v-btn text color="#001858" @click="travelNew">旅行登録</v-btn>
            <v-btn text color="#001858" @click="travelList">旅行一覧</v-btn>
            <v-btn text color="#001858" @click="logOut">ログアウト</v-btn>
          </v-col>
        </v-row>
      </v-container>
      <v-container v-else>
        <v-row>
          <v-col cols="12" offset-lg="6" sm="11" md="11" lg="6">
            <v-btn text color="#001858" @click="travelTop">TOP</v-btn>
            <v-btn text color="#001858" @click="signup">会員登録</v-btn>
            <v-btn text color="#001858" @click="login">ログイン</v-btn>
            <v-btn text color="#001858" @click="guestLogin">ゲストログイン</v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-app-bar>
    <v-main>
      <template>
        <nuxt />
      </template>
    </v-main>
    <v-navigation-drawer v-model="rightDrawer" :right="right" temporary fixed app>
      <v-list>
        <v-list-item @click.native="right = !right">
          <v-list-item-action>
            <v-icon light>
              mdi-repeat
            </v-icon>
          </v-list-item-action>
          <v-list-item-title>Switch drawer (click me)</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-footer :absolute="!fixed" app color="rgba(10,10,100,0.2)">
      <span style="color:#001858">&copy; {{ new Date().getFullYear() }}</span>
      <span></span>
    </v-footer>
  </v-app>
</template>

<script>
  import firebase from "@/plugins/firebase";
  import axios from "@/plugins/axios";

  export default {
    data() {
      return {
        clipped: false,
        drawer: false,
        fixed: false,
        // items: [
        //   {
        //     icon: 'mdi-apps',
        //     title: '新規登録',
        //     to: '/travel_new'
        //   },
        //   {
        //     icon: 'mdi-chart-bubble',
        //     title: '旅行一覧',
        //     to: '/travel_list'
        //   }
        // ],
        miniVariant: false,
        right: true,
        rightDrawer: false,
        title: "タビマエ"
      };
    },
    computed: {
      user() {
        return this.$store.state.auth.currentUser;
      },
      items() {
        if (this.user) {
          return [
            {
              icon: "mdi-bag-checked",
              title: "TOP",
              to: "/"
            },
            {
              icon: "mdi-briefcase-plus-outline",
              title: "旅行新規登録",
              to: "/travelNew"
            },
            {
              icon: "mdi-format-list-bulleted",
              title: "旅行一覧",
              to: "/travelList"
            }
          ];
        } else {
          return [{
              icon: "mdi-bag-checked",
              title: "TOP画面",
              to: "/"
            },
            {
              icon: "mdi-account-plus",
              title: "新規会員登録",
              to: "/signup"
            },
            {
              icon: "mdi-account-search",
              title: "ログイン",
              to: "/login"
            },
            {
              icon: "mdi-briefcase-account",
              title: "ゲストログイン",
              to: "/guestLogin"
            },
          ];
        }
      }
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
      async travelNew() {
        this.$router.push("/travelNew");
      },
      async travelList() {
        this.$router.push("/travelList");
      },
      async travelTop() {
        this.$router.push("/");
      },
      async signup() {
        this.$router.push("/signup");
      },
      async login() {
        this.$router.push("/login");
      },
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
    }
  };

</script>

<style scoped>
  .errors {
    color: red;
    margin-top: 20px;
  }

  * {
    margin: 0;
    padding: 0;
    font-family: 'TabimaeFont';
  }

  v-app {
    background-size: 100%;
    font-family: 'TabimaeFont';
  }

  .bg {
    background-color: #ffffff;
    background-size: 100%;
    color: #001858;
    font-family: 'TabimaeFont';
  }

  .list-item {
    color: #001858 !important;
    font-family: 'TabimaeFont';
  }
  .header-item{
    color: #001858 !important;
    font-family: 'TabimaeFont';
  }
  .v-toolbar__title{
    color: #001858;
        font-family: 'HogeHogeFont';

  }
</style>
<style>

.v-app-bar{
position: relative;
	height: 50vh;
}
.v-footer{
position: relative;
	height: 8vh;
}
</style>>