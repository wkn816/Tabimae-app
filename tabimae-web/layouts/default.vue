<template>
  <v-app class="bg">
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
    >
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <nuxt-link to="/travel_list"></nuxt-link>
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar :clipped-left="clipped" fixed app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-btn icon @click.stop="miniVariant = !miniVariant">
        <v-icon>mdi-{{ `chevron-${miniVariant ? "right" : "left"}` }}</v-icon>
      </v-btn>
      <v-btn icon @click.stop="clipped = !clipped">
        <v-icon>mdi-application</v-icon>
      </v-btn>
      <v-btn icon @click.stop="fixed = !fixed">
        <v-icon>mdi-minus</v-icon>
      </v-btn>
      <v-toolbar-title v-text="title" />
      <v-spacer />
      
      <v-btn @click="logOut">ログアウト</v-btn>
      <v-btn icon @click.stop="rightDrawer = !rightDrawer">
        <v-icon>mdi-menu</v-icon>
      </v-btn>
    </v-app-bar>
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
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
    <v-footer :absolute="!fixed" app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
    <template v-if="this.$store.state.auth.currentUser">
      <nuxt />
    </template>
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
      title: "Tabimae"
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
            icon: "mdi-apps",
            title: "新規登録",
            to: "/travel_new"
          },
          {
            icon: "mdi-chart-bubble",
            title: "旅行一覧",
            to: "/travel_list"
          }
        ];
      } else {
        return [
          {
            icon: "mdi-apps",
            title: "ログイン",
            to: "/login"
          },
          {
            icon: "mdi-chart-bubble",
            title: "新規登録",
            to: "/signup"
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
    }
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
  background-color: #000;
  background-size: 100%;
  color: #ffffff;
}
</style>
