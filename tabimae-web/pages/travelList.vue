<template>
  <v-app class="bg">
    <v-container>
      <v-row>
        <v-col cols="12" offset-lg="1" lg="10">
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
        <v-col cols="12" offset-lg="1" lg="10">
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


                <tbody>
                    <tr v-for="train in trains" v-bind:key="train">
                      <td class="show-btn">
                    <router-link style="text-decoration: none;" :to="`/travel/${travel}`">
                      <v-icon mdi-feature-search-outline></v-icon>詳細
                    </router-link>
                  </td>
                      <td class="blue lighten-5">{{train.trains[0].departure_day}}</td>
                      <td class="blue lighten-5">{{train.trains[0].departure_place}}</td>
                      <td class="blue lighten-5">{{train.trains[0].arrival_place}}</td>
                      <td class="blue lighten-5">{{train.trains[0].departure_time}}</td>
                      <td class="blue lighten-5">{{train.trains[0].arrival_time}}</td>
                    </tr>
                </tbody>
            </v-simple-table>


          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container>
      <TravelInfo />
    </v-container>

  </v-app>
</template>

<script>
  import axios from "@/plugins/axios";
  import TravelNew from "@/pages/travelNew";
  import Train from "~/components/Train.vue";
  import Air from "~/components/Air.vue";
  import TravelEtiquette from "~/components/TravelEtiquette.vue";
  import TravelInfo from "~/components/TravelInfo.vue";

  export default {
    data() {
      return {
        travelData: [],
        trains: [],
      };
    },
    async fetch() {
      const user = this.$store.state.auth.currentUser;
      if (user) {
        this.travelData = await axios.get("/v1/travels", {
          params: {
            user
          }
        });
        // console.log(this.travelData);
        // console.log(this.travelData.data);
        // console.log(this.travelData.data[0].trains[0].departure_day);
        const travel = [this.travelData.data];
        //travel配列の各項目を全て読み取る
        for(let trains of travel){
        this.trains = trains;
        }
        this.travel = this.travelData.data[0].id;
      }
    },
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
  }

  .show-btn {
    background-color: #e53170;
    /*角の丸み*/
    text-decoration: none;
    text-align: center;
    // display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
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

  .travellist-card {
    margin-top: 80px;
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
