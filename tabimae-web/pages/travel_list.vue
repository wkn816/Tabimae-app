<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card color="#f3d2c1" elevation="“20”">
            <v-card-title primary-title class="justify-center">
              <v-icon large color="#001858">mdi-bag-checked</v-icon>
              <span class="title">旅行一覧</span>
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card elevation="“20”" color="#f3d2c1">
            <v-simple-table class="list-table" style="color:#001858">
              <thead class="list-thead">
                <tr>
                  <th style="color:#001858">詳細</th>
                  <th style="color:#001858">出発日</th>
                  <th style="color:#001858">出発地</th>
                  <th style="color:#001858">到着地</th>
                  <th style="color:#001858">出発時間</th>
                  <th style="color:#001858">到着時間</th>
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
                  <td class="show-btn">
                    <router-link style="text-decoration: none;" :to="`/travel/${travel}`">
                      <v-icon>mdi-feature-search-outline</v-icon>
                    </router-link>
                  </td>
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
          <v-icon large color="#001858">mdi-bag-checked</v-icon>
          <span class="title">旅行出発前に知っておきたいこと</span>
        </v-card-title>
        <v-card-text color="#001858">
          <p>画像をクリックすると知っておきたい情報をチェックできます</p>
        </v-card-text>
        <v-row>
          <Train />
          <Air />
          <TravelEtiquette />
        </v-row>
      </v-card>
    </v-container>

  </div>
</template>

<script>
  import axios from "@/plugins/axios";
  import TravelNew from "@/pages/travel_new";import Train from "~/components/Train.vue";
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
    background-color: #f3d2c1;
    // font-size: 100px;
  }

  .show-btn {
    background-color: #001858;
    border: solid 3px #001858;
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
  }

  .title {
  color: #001858;
  text-align: center;
}
p {
  color: #001858;
  text-align: center;
}



</style>
