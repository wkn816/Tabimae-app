<template>
  <v-app class="bg">
    <v-container>
      <v-row>
        <v-col cols="12" offset-lg="1" lg="10">
          <v-card color=#f9bc60 elevation=“20” class="travelnew-card">
            <v-card-title primary-title class="justify-center">
              <v-icon x-large color=#e53170>
                mdi-chevron-double-right
              </v-icon>
              <v-card-title class="display">旅行新規登録</v-card-title>
              <v-icon x-large color=#e53170>
                mdi-chevron-double-left
              </v-icon>
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>


    <v-container>
      <v-row>
        <v-col cols="12" offset-lg="2" lg="8">
          <h2 v-if="success">登録したよ!</h2>
          <v-card elevation=“20”>
            <v-container fluid class="transport-radio">
              <v-card-title>交通手段を選択してください</v-card-title>
              <v-radio-group row v-model="transport" mandatory>
                <v-radio label="列車" value="train" color=#f9bc60></v-radio>
                <v-radio label="飛行機" value="air" color=#f9bc60></v-radio>
              </v-radio-group>
            </v-container>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container>
      <v-row>
        <v-col cols="12" offset-lg="2" lg="8">
          <v-card v-if="transport === 'train'" color=#232946 elevation=“24”>
            <h1 class="transport-title">
              <v-icon large color=#fef6e4>mdi-train</v-icon>
              列車で行く
            </h1>
                <p v-if="error" class="errors">{{ error }}</p>
            <!-- 出発日入力フォーム -->
            <v-row>
              <v-col cols="12" offset-sm="2" sm="3" offset-md="2" md="3" offset-lg="2" lg="3">
                <v-menu v-model="choice_departure_day" :close-on-content-click="false" max-width="290">
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field outlined append-icon="mdi-calendar-month-outline" label="出発日" :value="departure_day"
                      clearable readonly v-bind="attrs" v-on="on" @click:clear="departure_day = null"></v-text-field>
                  </template>
                  <v-date-picker v-model="departure_day" @change="choice_departure_day = departure_day">
                  </v-date-picker>
                </v-menu>
              </v-col>
            </v-row>
            <!-- 出発地・到着地入力フォーム -->
            <v-row justify="center" align-content="center">
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="4" offset-lg="2" lg="4">
                <v-text-field class="place-form" outlined append-icon="mdi-map-marker" v-model="departure_place"
                  :counter="10" label="出発駅" required>
                </v-text-field>
              </v-col>
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="4" offset-lg="1" lg="5">
                <v-text-field class="place-form" outlined append-icon="mdi-map-marker" v-model="arrival_place"
                  :counter="10" label="到着駅" required>
                </v-text-field>
              </v-col>
            </v-row>
            <!-- 出発時間・到着時間入力フォーム -->
            <v-row justify="center" align-content="center">
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="4" offset-lg="1" lg="4">
                <p class="my-time-picker">
                  <vue-timepicker v-model="departure_time" format="A:h:mm:" hour-label="時" minute-label="分"
                    apm-label="区分" am-text="午前" pm-text="午後" placeholder="出発時間" input-class="time-font"
                    close-on-complete></vue-timepicker>
                </p>
              </v-col>
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="4" offset-lg="1" lg="4">
                <p class="my-time-picker">
                  <vue-timepicker v-model="arrival_time" format="A:h:mm:" hour-label="時" minute-label="分" apm-label="区分"
                    am-text="午前" pm-text="午後" placeholder="到着時間" input-class="time-font" close-on-complete>
                  </vue-timepicker>
                </p>
              </v-col>
            </v-row>
            <!-- 旅行の名前入力フォーム -->
            <v-row>
              <v-col cols="12" offset-sm="1" sm="4" offset-md="2" md="5" offset-lg="2" lg="5">
                <v-text-field outlined append-icon="mdi-comment-edit-outline" v-model="name" :counter="15"
                  label="旅行のテーマ" required></v-text-field>
              </v-col>
              <!-- 決定ボタン -->
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="3" offset-lg="1" lg="3">
                <v-hover v-slot:default="{ hover }">
                  <v-btn elevation="2" outlined raised rounded x-large @click="createTravel"
                    class="create">

                    <v-icon v-text="hover ? 'mdi-check-bold' : ''"></v-icon>決定
                  </v-btn>
                </v-hover>

              </v-col>
            </v-row>
            <v-row justify="center" align-content="center">
            </v-row>
          </v-card>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12" offset-lg="2" lg="8">
          <v-card v-if="transport === 'air'" color=#232946 elevation=“24”>
            <!-- <template v-if="transport === 'train'"> -->
            <h1 class="transport-title">
              <v-icon large color=#fef6e4>mdi-airplane</v-icon>
              飛行機で行く
            </h1>
            <p v-if="error" class="errors">{{ error }}</p>
            <!-- 出発日入力フォーム -->
            <v-row>
              <v-col cols="12" offset-sm="1" sm="3" offset-md="2" md="5" offset-lg="2" lg="3">
                <v-menu v-model="choice_departure_day" :close-on-content-click="false" max-width="290">
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field outlined append-icon="mdi-calendar-month-outline" label="搭乗日" :value="departure_day"
                      clearable readonly v-bind="attrs" v-on="on" @click:clear="departure_day = null"></v-text-field>
                  </template>
                  <v-date-picker v-model="departure_day" @change="choice_departure_day = departure_day">
                  </v-date-picker>
                </v-menu>
              </v-col>
            </v-row>
            <!-- 出発地・到着地入力フォーム -->
            <v-row justify="center" align-content="center">
              <v-col cols="12" offset-sm="1" sm="4" offset-md="2" md="4" offset-lg="2" lg="4">
                <v-text-field class="place-form" outlined append-icon="mdi-map-marker" v-model="departure_place"
                  :counter="10" label="出発空港" required>
                </v-text-field>
              </v-col>
              <v-col cols="12" offset-sm="1" sm="5" offset-md="1" md="5" offset-lg="1" lg="5">
                <v-text-field class="place-form" outlined append-icon="mdi-map-marker" v-model="arrival_place"
                  :counter="10" label="到着空港" required>
                </v-text-field>
              </v-col>
            </v-row>
            <!-- 出発時間・到着時間入力フォーム -->
            <v-row justify="center" align-content="center">
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="4" offset-lg="1" lg="4">
                <p class="my-time-picker">
                  <vue-timepicker v-model="departure_time" format="A:h:mm:" hour-label="時" minute-label="分"
                    apm-label="区分" am-text="午前" pm-text="午後" placeholder="出発時間" input-class="time-font"
                    close-on-complete></vue-timepicker>
                </p>
              </v-col>
              <v-col cols="12" offset-sm="1" sm="4" offset-md="1" md="4" offset-lg="1" lg="4">
                <p class="my-time-picker">
                  <vue-timepicker v-model="arrival_time" format="A:h:mm:" hour-label="時" minute-label="分" apm-label="区分"
                    am-text="午前" pm-text="午後" placeholder="到着時間" input-class="time-font" close-on-complete>
                  </vue-timepicker>
                </p>
              </v-col>
            </v-row>
            <!-- 旅行の名前入力フォーム -->
            <v-row>
              <v-col cols="12" offset-sm="1" sm="5" offset-md="2" md="5" offset-lg="2" lg="5">
                <v-text-field outlined append-icon="mdi-comment-edit-outline" v-model="name" :counter="15"
                  label="旅行のテーマ" required></v-text-field>
              </v-col>
              <!-- 決定ボタン -->
              <v-col cols="12" offset-sm="1" sm="3" offset-md="1" md="3" offset-lg="1" lg="3">
                <v-hover v-slot:default="{ hover }">
                  <v-btn elevation="2" outlined raised rounded x-large @click="createTravel"
                    class="create">
                    <v-icon v-text="hover ? 'mdi-check-bold' : ''"></v-icon>決定
                  </v-btn>
                </v-hover>
              </v-col>
            </v-row>
            <v-row justify="center" align-content="center">
            </v-row>

          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
  import axios from "@/plugins/axios";
  import VueTimepicker from "vue2-timepicker";
  import "vue2-timepicker/dist/VueTimepicker.css";
  import moment from "moment";
  import {
    format,
    parseISO
  } from "date-fns";

  export default {
    components: {
      "vue-timepicker": VueTimepicker
    },
    data() {
      return {
        travel: "",
        transport: "",
        name: "",
        departure_place: "",
        arrival_place: "",
        departure_time: "",
        arrival_time: "",
        departure_day: "",
        success: false,
        choice_departure_day: false,
        error: "",
      };
    },
    methods: {
      async createTravel() {
        if (this.departure_day == "") {
          this.error = "出発日を入力してください";
          return
        }
        if (this.departure_place == "") {
          this.error = "出発地を入力してください";
          return
        }
        if (this.arrival_place == "") {
          this.error = "到着地を入力してください";
          return
        }
        if (this.departure_time == "") {
          this.error = "出発時間を入力してください";
          return
        }
        if (this.arrival_time == "") {
          this.error = "到着時間を入力してください";
          return
        }
        if (this.name == "") {
          this.error = "旅行のテーマを入力してください";
          return
        }
          this.$store.commit("loading/setLoading", true);

        const travel_params = {
          transport: this.transport,
          name: this.name,
          user_id: this.$store.state.auth.currentUser.id
        };
        console.log(travel_params);
        const {
          data
        } = await axios.post("/v1/travels", {
          travel: travel_params
        });
        console.log(data);
        this.transport = "";
        this.name = "";
        this.success = true;

        if (this.transport === "air") {
          console.log(data);
          const air_params = {
            travel_id: data.id,
            departure_place: this.departure_place,
            arrival_place: this.arrival_place,
            departure_time: this.departure_time,
            arrival_time: this.arrival_time,
            departure_day: this.departure_day,
            user_id: this.$store.state.auth.currentUser.id
          };
          console.log(air_params);
          const res_air = await axios.post("/v1/airs", {
            air: air_params
          });
          console.log(res_air);
          this.departure_place = "";
          this.arrival_place = "";
          this.departure_time = "";
          this.arrival_time = "";
          this.departure_day = "";
        } else {
          const train_params = {
            travel_id: data.id,
            departure_place: this.departure_place,
            arrival_place: this.arrival_place,
            departure_time: this.departure_time,
            arrival_time: this.arrival_time,
            departure_day: this.departure_day,
            user_id: this.$store.state.auth.currentUser.id
          };
          console.log(train_params);
          const res_train = await axios.post("/v1/trains", {
            train: train_params
          });
          console.log(res_train);
          this.departure_place = "";
          this.arrival_place = "";
          this.departure_time = "";
          this.arrival_time = "";
          this.departure_day = "";
        }
        setTimeout(() => {
          this.$store.commit("loading/setLoading", false);
        }, 1000);
          this.$router.push("/travelList");
      }
    },
    computed: {
      //82行目でuserが持っている値を画面上に表示
      user() {
        return this.$store.state.auth.currentUser;
      },
      //83行目でtravelsが持っている値のみ画面上に表示
      travels() {
        return this.$store.state.auth.travels;
      }
    },
    created() {
      console.log(format(parseISO(new Date().toISOString()), "yyyy-MM-dd"));
    },
    mounted() {
      console.log("computedのtravels", this.travels);
      console.log("vuexのtravels", this.$store.state.auth.travels);
    }
  };

</script>

<style scoped>
  .my-time-picker>>>.vue__time-picker .dropdown ul li:not([disabled]).active,
  .my-time-picker>>>.vue__time-picker .dropdown ul li:not([disabled]).active:focus,
  .my-time-picker>>>.vue__time-picker .dropdown ul li:not([disabled]).active:hover {
    background: #999;
  }

</style>

<style lang="scss" scoped>
.errors {
    color: red;
    margin-top: 20px;
    text-align: center;
  }
  .transport-radio {
    background-color: #232946;
    font-weight: bolder;
    // border: solid 5px #f9bc60;
    /*線*/
    border-radius: 10px;
    /*角の丸み*/
    text-decoration: none;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
    box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
    color: #fef6e4;
  }

  .place-form {
    float: left;
  }

  .title {
    color: #001858;
  }

  .transport-title {
    color: #fef6e4;
    text-align: center;
    padding-bottom: 20px;
  }

  .create {
    color: black !important;
    background-color: #ffc6c7 !important;
    &:hover {
      transform: scale(1.04);
      transition-duration: 40ms;
    }
  }

  .travelnew-card {
    margin-top: 80px;
  }

  .display {
    color: #001858;
    text-align: center;
    font-size: 25px;
    font-family: 'TabimaeFont';
  }

</style>
<style>
  .time-font {
    color: seashell !important;
  }

</style>
