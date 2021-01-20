<template>
  <v-app class="bg">
    <v-row>
      <v-col cols="12" sm="10" md="6" lg="6" offset-lg="3">
        <v-card color=#f3d2c1>
          <v-card-title primary-title class="justify-center">
            <v-icon large color=#001858>
              mdi-bag-checked
            </v-icon>
            <span class="title">新規会員登録</span>
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
              <v-btn class="mr-4" @click="signup" color="#001858">
                <div class="submit">登録</div>
              </v-btn>
              <p v-if="error" class="errors">{{ error }}</p>
            </form>
          </v-card-text>

        </v-card>
      </v-col>
    </v-row>
    <nuxt />
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
        this.$router.push("/travel_list");
      },
    },
  };

</script>

<style scoped>
  .errors {
    color: red;
    margin-top: 20px;
  }

</style>
