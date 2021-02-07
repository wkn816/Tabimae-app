<template>
  <v-app class="bg">
    <v-row>
      <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
        <v-card color=#8bd3dd class="signup-card">
          <v-card-title primary-title class="justify-center">
          <v-icon
        x-large
        color=#e53170
      >
      mdi-chevron-double-right
      </v-icon>
      <v-title class="display">新規会員登録</v-title>
      <v-icon
        x-large
        color=#e53170
      >
      mdi-chevron-double-left      </v-icon>
          </v-card-title>
          <v-card-text color=#001858>
            <form>
              <v-text-field v-model="name" :counter="10" label="Name" data-vv-name="name" required></v-text-field>
              <v-text-field v-model="email" :counter="20" label="Email" data-vv-name="email" required></v-text-field>
              <v-text-field v-model="password" label="password" data-vv-name="password" required
                :type="show1 ? 'text' : 'password'" :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="show1 = !show1"></v-text-field>
              <v-text-field v-model="passwordConfirm" label="passwordConfirm" data-vv-name="passwordConfirm" required
                :type="show2 ? 'text' : 'password'" :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="show2 = !show2"></v-text-field>
              <v-hover v-slot:default="{ hover }">
                <v-btn block dark class="mr-4" @click="signup" color="#001858" elevation="5">
                  <v-icon v-text="hover ? 'mdi-account-plus' : ''">mdi-account-plus-outline</v-icon>会員登録

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

        <v-card color=#f3d2c1>
          <v-card-title primary-title class="justify-center">
            <v-icon large color=#001858>
              mdi-bag-checked
            </v-icon>
            <span class="title">登録せずにすぐご利用になりたい方はこちら</span>
          </v-card-title>
          <v-card-text color=#001858>
            <v-hover v-slot:default="{ hover }">
              <v-btn block dark class="guest-btn" @click="guestLogin" color="#001858" elevation="10">
                <v-icon v-text="hover ? 'mdi-briefcase-account' : ''">mdi-briefcase-account-outline</v-icon>ゲストログイン
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
        show1: false,
        show2: false,
        error: "",
      };
    },
    methods: {
      async signup() {
        if (this.password !== this.passwordConfirm) {
          this.error = "※パスワードとパスワード確認が一致していません";
        }

        const res = await firebase
          .auth()
          .createUserWithEmailAndPassword(this.email, this.password)
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
        this.$router.push("/");
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
    },
  };

</script>

<style lang="scss" scoped>
  .errors {
    color: red;
    margin-top: 20px;
  }

  .bg {
    background-color: #fef6e4;
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
  .display{
  color: #001858;
  text-align: center;
  font-size: 30px;
  font-family: 'TabimaeFont';

}

</style>
