<template>
  <v-app class="bg">
    <v-navigation-drawer v-model="drawer" :mini-variant="miniVariant" :clipped="clipped" fixed app color=#f3d2c1>
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
    <v-app-bar :clipped-left="clipped" fixed app color=#8bd3dd>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-btn icon @click.stop="miniVariant = !miniVariant">
        <v-icon>mdi-{{ `chevron-${miniVariant ? "right" : "left"}` }}</v-icon>
      </v-btn>
      <v-btn icon @click.stop="clipped = !clipped">
        <v-icon>mdi-application</v-icon>
      </v-btn>
      <!-- <v-btn icon @click.stop="fixed = !fixed">
        <v-icon>mdi-minus</v-icon>
      </v-btn> -->
      <v-toolbar-title v-text="title" />
      <v-spacer />

      <v-container v-if="user">
        <v-row>
          <v-col cols="12" offset-lg="7" sm="11" md="11" lg="5">
            <v-btn @click="travelTop" class="header-item" style="background-color:#f3d2c1">TOPへ</v-btn>
            <v-btn @click="travelNew" class="header-item" style="background-color:#f3d2c1">旅行登録</v-btn>
            <v-btn @click="travelList" class="header-item" style="background-color:#f3d2c1">旅行一覧</v-btn>
            <v-btn @click="logOut" class="header-item" style="background-color:#f3d2c1">ログアウト</v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-app-bar>
    <v-main>
      <template>
        <nuxt />
      </template>
    </v-main>
    <v-navigation-drawer v-model="rightDrawer" :right="right" temporary fixed>
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
    <!-- <v-footer :absolute="!fixed" app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer> -->
  </v-app>
</template>

<script>
  import firebase from "@/plugins/firebase";
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
              icon: "mdi-chart-bubble",
              title: "TOP",
              to: "/"
            },
            {
              icon: "mdi-apps",
              title: "旅行新規登録",
              to: "/travel_new"
            },
            {
              icon: "mdi-chart-bubble",
              title: "旅行一覧",
              to: "/travel_list"
            }
          ];
        } else {
          return [{
              icon: "mdi-apps",
              title: "TOP画面",
              to: "/"
            },
            {
              icon: "mdi-chart-bubble",
              title: "新規会員登録",
              to: "/signup"
            },
            {
              icon: "mdi-chart-bubble",
              title: "ログイン",
              to: "/login"
            }
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
        this.$router.push("/login");
      },
      async travelNew() {
        this.$router.push("/travel_new");
      },
      async travelList() {
        this.$router.push("/travel_list");
      },
      async travelTop() {
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
  }

  v-app {
    background-size: 100%;
  }

  .bg {
    background-color: #fef6e4;
    background-size: 100%;
    color: #001858;
  }

  .list-item {
    color: #001858;
  }
.header-item{
color: #001858;
}
</style>
