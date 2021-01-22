<template>
  <div>

    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card color=#f3d2c1>
            <v-card-title primary-title class="justify-center">
              <v-icon large color=#001858>
                mdi-bag-checked
              </v-icon>
              <span class="title">旅行一覧</span>
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-simple-table>
      <thead>
        <tr>
          <th>
            詳細
          </th>
          <th>
            出発日
          </th>
          <th>
            出発地
          </th>
          <th>
            到着地
          </th>
          <th>
            出発時間
          </th>
          <th>
            到着時間
          </th>
        </tr>
      </thead>


        <li v-for="travel in travelData.data">
      <tbody>
          <router-link style="text-decoration: none; color: inherit;" :to="`/travel/${travel.id}`">
            <!-- <v-card elevation="20" color=#f3d2c1> -->
            <!-- <router-link style=“text-decoration: none; color: inherit;” :to=“`/travel/${travel.id}`“>詳細へ遷移
                  </router-link> -->
            <tr v-for="train in travel.trains">
              <!-- <tr v-for="train in travelData.data"> -->
              <td>
                <v-btn>aaa</v-btn>
              </td>
              <td>{{ train.departure_day }}</td>
              <td>{{ travel.name }}</td>
              <td>{{ train.departure_place }}</td>
              <td>{{ train.arrival_place }}</td>
              <td>{{ train.departure_time }}</td>
              <td>{{ train.arrival_time }}</td>
            </tr>
            <!-- </v-card> -->
          </router-link>
      </tbody>
        </li>
    </v-simple-table>
  </div>
</template>

<script>
  import axios from "@/plugins/axios";
  import TravelNew from "@/pages/travel_new";

  export default {
    // components: {
    //   TravelNew,
    // },
    data() {
      return {
        // travel_params: "",
        //   {
        travelData: {},
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

        //filterで作り直された配列がtravelNameに入る
        console.log(this.travelData);
      }
    },

    // created() {
    //   this.userName = this.travelData.data.filter(function(value) {
    //     console.log(value);
    //   });
    // },
    methods: {
      filteingUserName() {
        // console.log(this.travelData);
        // this.userName = this.travelData.data.map(function(value) {
        //   console.log(value.username.user);
        //   return value.username;
        // });
        // console.log(this.userName);
      }
    },
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

</style>
