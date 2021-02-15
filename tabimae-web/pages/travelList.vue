<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card color="#ffc6c7" elevation="2" class="travellist-card">
            <v-card-title primary-title class="justify-center">
              <v-icon x-large color=#e53170>
                mdi-chevron-double-right
              </v-icon>
              <span class="travellist-title">旅行一覧</span>
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
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card elevation="10">
            <v-simple-table class="list-table" style="color:#001858">
              <thead class="list-thead">
                <tr>
                  <th></th>
                  <th style="color:#fffffe">出発日</th>
                  <th style="color:#fffffe">出発地</th>
                  <th style="color:#fffffe">到着地</th>
                  <th style="color:#fffffe">出発時間</th>
                  <th style="color:#fffffe">到着時間</th>
                </tr>
              </thead>
              <!-- <v-card elevation="20" color=#f3d2c1> -->
              <!-- <router-link style=“text-decoration: none; color: inherit;” :to=“`/travel/${travel.id}`“>詳細へ遷移
              </router-link>-->
              <tbody>
                <!-- <div v-for="travel in travelData.data"> -->
                <!-- <router-link
                  style="text-decoration: none; color: inherit;"
                  :to="`/travel/${travel.id}`"
                > -->
                <tr v-for="train in trains">
                  <!-- <tr v-for="train in travelData.data"> -->
                  <!-- <v-hover v-slot:default="{ hover }"> -->
                  <td class="show-btn">
                    <router-link style="text-decoration: none;" :to="`/travel/${travel}`">
                      <v-icon mdi-feature-search-outline></v-icon>詳細
                    </router-link>
                  </td>
                  <!-- </v-hover> -->
                  <td class="blue lighten-5">
                    {{ train.departure_day }}
                  </td>
                  <td class="blue lighten-5">{{ train.departure_place }}</td>
                  <td class="blue lighten-5">{{ train.arrival_place }}</td>
                  <td class="blue lighten-5">{{ train.departure_time }}</td>
                  <td class="blue lighten-5">{{ train.arrival_time }}</td>

                </tr>
                <!-- </v-card> -->
                <!-- </div> -->

              </tbody>
            </v-simple-table>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container>
      <v-card color="#f3d2c1">
        <v-card-title primary-title class="justify-center">
          <v-icon x-large color=#e53170>
            mdi-chevron-double-right
          </v-icon>
          <v-title class="display">旅行出発前に知っておきたいこと</v-title>
          <v-icon x-large color=#e53170>
            mdi-chevron-double-left </v-icon>
        </v-card-title>
        <v-card-text color="#001858">
          <p>画像をクリックすると知っておきたい情報をチェックできます</p>
        </v-card-text>
        <v-row>
            <v-col offset="" cols="1" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="2" lg="2">
              <Train />
            </v-col>
            <v-col cols="12" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="2" lg="2">
              <Air />
            </v-col>
            <v-col cols="12" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="2" lg="3">
              <TravelEtiquette />
            </v-col>
            <v-col cols="12" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="1" lg="1">
              <HowTo />
            </v-col>
          </v-row>
      </v-card>
    </v-container>

  </div>
</template>

<script>
  import axios from "@/plugins/axios";
  import TravelNew from "@/pages/travelNew";
  import Train from "~/components/Train.vue";
  import Air from "~/components/Air.vue";
  import TravelEtiquette from "~/components/TravelEtiquette.vue";

  export default {
    // components: {
    //   TravelNew,
    // },
    data() {
      return {
        // travel_params: "",
        //   {
        travelData: [],
        trains: [],
        travel: "",
        transport: "",
        userName: {}
        // name: "",
        // departure_place: "",
        // arrival_place: "",
        // departure_time: "",
        // arrival_time: "",
      };
    },
    async fetch() {
      // console.log(this.$store.state.auth.currentUser.id);
      const user = this.$store.state.auth.currentUser;
      // debugger
      if (user) {
        this.travelData = await axios.get("/v1/travels", {
          params: {
            user
          }
        });
        // debugger

        //filterで作り直された配列がtravelNameに入る
        console.log(this.travelData);
        this.trains = this.travelData.data[0].trains;
        this.travel = this.travelData.data[0].id;
      }
    },

    // created() {
    //   this.userName = this.travelData.data.filter(function(value) {
    //     console.log(value);
    //   });
    // },

    computed: {
      // returnUserName() {
      //   if (this.travelData !== undefined){ return }
      //   console.log(this.travelData.data);
      //   const userName = this.travelData.data.filter(function(value) {
      //     console.log(value);
      //   });
      //   // return "アイウエオ";
      // }
      // user() {
      //   return this.$store.state.auth.currentUser;
      // }
    }
  };

</script>

<style lang="scss" scoped>
  .v-card {
    width: 100%;
    // text-align: center;
    margin-bottom: 30px;
  }

  .list-table {
    background-color: #001858 !important;
    // font-size: 100px;
  }

  .show-btn {
    background-color: #e53170;
    /*線*/
    // border-radius: 10px;
    /*角の丸み*/
    text-decoration: none;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;

    // box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.4);
    &:hover {
      transform: scale(1.04);
      transition-duration: 80ms;
    }
  }

  .travellist-title {
    color: #001858;
    text-align: center;
    font-size: 25px;
  }

  p {
    color: #001858;
    text-align: center;
  }

  .travellist-card {
    margin-top: 80px;
  }

  .display {
    color: #001858;
    text-align: center;
    font-size: 30px;
    font-family: 'TabimaeFont';
  }

  .v-application a {
    color: #fffffe;
    font-weight: 100;
    font-size: 18px;

    &:hover {
      transform: scale(1.04);
      transition-duration: 40ms;
      color: #271c19;
    }
  }

</style>
