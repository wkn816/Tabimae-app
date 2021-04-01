<template>
  <v-app class="bg">
    <v-row>
      <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
        <v-card color="#8bd3dd" class="signup-card">
          <v-card-title primary-title class="justify-center">
            <v-icon x-large color="#e53170">
              mdi-chevron-double-right
            </v-icon>
            <v-card-title class="signin-title">新規会員登録</v-card-title>
            <v-icon x-large color="#e53170"> mdi-chevron-double-left </v-icon>
          </v-card-title>
          <v-card-text color="#001858">
            <form>
              <v-text-field
                v-model="name"
                :counter="10"
                label="Name"
                data-vv-name="name"
                required
              ></v-text-field>
              <v-text-field
                v-model="email"
                :counter="20"
                label="Email"
                data-vv-name="email"
                required
              ></v-text-field>
              <v-text-field
                v-model="password"
                label="password"
                data-vv-name="password"
                required
                :type="show1 ? 'text' : 'password'"
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="show1 = !show1"
              ></v-text-field>
              <v-text-field
                v-model="passwordConfirm"
                label="passwordConfirm"
                data-vv-name="passwordConfirm"
                required
                :type="show2 ? 'text' : 'password'"
                :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="show2 = !show2"
              ></v-text-field>
              <v-hover v-slot:default="{ hover }">
                <v-btn
                  block
                  dark
                  class="mr-4"
                  @click="signup(name, email, password, passwordConfirm)"
                  color="#001858"
                  elevation="5"
                >
                  <v-icon v-text="hover ? 'mdi-account-plus' : ''"
                    >mdi-account-plus-outline</v-icon
                  >入力完了
                </v-btn>
              </v-hover>
              <p v-if="error" class="errors">{{ error }}</p>
            </form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
        <v-card color="#f3d2c1">
          <v-card-title primary-title class="justify-center">
            <v-icon x-large color="#e53170">
              mdi-chevron-double-right
            </v-icon>
            <v-card-title class="signin-title"
              >すぐご利用になりたい方はこちら</v-card-title
            >
            <v-icon x-large color="#e53170"> mdi-chevron-double-left </v-icon>
          </v-card-title>
          <v-card-text color="#001858">
            <v-hover v-slot:default="{ hover }">
              <v-btn
                block
                dark
                class="guest-btn"
                @click="guestLogin(GUEST_LOGIN_EMAIL, GUESTPW)"
                color="#001858"
                elevation="10"
              >
                <v-icon v-text="hover ? 'mdi-briefcase-account' : ''"
                  >mdi-briefcase-account-outline</v-icon
                >ゲストログインですぐ利用
              </v-btn>
            </v-hover>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-app>
</template>
<script>
import axios from "@/plugins/axios";
import firebase from "@/plugins/firebase";
export default {
  data() {
    return {
      email: "",
      name: "",
      password: "",
      passwordConfirm: "",
      show1: true,
      show2: true,
      error: ""
    };
  },

  methods: {
    async signup(name, email, password, passwordConfirm) {
      const errorMessage = [
        "※パスワードとパスワード確認が一致していません",
        "名前を入力してください",
        "メールアドレスを入力してください",
        "パスワードを入力してください",
        "パスワードは確認用で2回入力してください"
      ];
      if (password !== passwordConfirm) {
        this.error = errorMessage[0];
        return;
      }
      if (name == "") {
        this.error = errorMessage[1]
        return
      }
      if (email == "") {
        this.error = errorMessage[2]
        return;
      }
      if (password == "") {
        this.error = errorMessage[3];
        return;
      }
      if (passwordConfirm == "") {
        this.error = errorMessage[4];
        return;
      }
      this.$store.commit("loading/setLoading", true);
      const res = await firebase
        .auth()
        .createUserWithEmailAndPassword(email, password)
        .catch(error => {
          this.error = (code => {
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
        name,
        uid: res.user.uid
      };
      const { data } = await axios.post("/v1/users", { user }).catch(err => {
        console.log({ err });
      });

      setTimeout(() => {
        this.$store.commit("loading/setLoading", false);
      }, 1000);
      this.$store.commit("auth/setUser", data);
      this.$router.push("/");
    },

    async guestLogin(GUEST_LOGIN_EMAIL, GUESTPW) {
      this.$store.commit("loading/setLoading", true);
      firebase
        .auth()
        .signInWithEmailAndPassword(
          process.env.GUEST_LOGIN_EMAIL,
          process.env.GUESTPW
        )
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
    }
  }
};
</script>

<style lang="scss" scoped>
.errors {
  color: red;
  margin-top: 20px;
  text-align: center;
}

.guest-btn {
  cursor: pointer;
  display: block;
  text-align: center;
  height: 150px;
  border-radius: 8px;
  border: 1px solid #dddddd;
  box-shadow: 4px 4px #f582ae;
}

.title {
  color: #001858;
  text-align: center;
}

.signup-card {
  margin-top: 100px;
}

.signin-title {
  color: #001858;
  text-align: center;
  font-size: 24px;
  font-family: "TabimaeFont";
}
</style>
