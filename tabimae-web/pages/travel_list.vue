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

      <v-ul v-for="travel in travelData.data">
        <v-container>
    <v-card elevation="20" color=#f3d2c1>
          <!-- <v-row> -->
            <!-- <li>{{ travel.transport }}</li> -->
            <v-ul v-for="train in travel.trains">
              <v-row>
                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-li>
                    <h5 class="item-title">出発日</h5>
                    <v-card-text class="item-text">
                      {{ train.departure_day }}
                    </v-card-text>
                  </v-li>
                </v-col>
                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-card-text class="item-text">
                    <v-li>{{ travel.name }}</v-li>
                  </v-card-text>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-li>
                    <h5 class="item-title">出発地</h5>
                    <v-card-text class="item-text">
                      {{ train.departure_place }}
                    </v-card-text>
                  </v-li>
                </v-col>

                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-li>
                    <h5 class="item-title">到着地</h5>
                    <v-card-text class="item-text">
                      {{ train.arrival_place }}
                    </v-card-text>
                  </v-li>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-li>
                    <h5 class="item-title">出発時間</h5>
                    <v-card-text class="item-text">
                      {{ train.departure_time }}
                    </v-card-text>
                  </v-li>
                </v-col>

                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-li>
                    <h5 class="item-title">到着時間</h5>
                    <v-card-text class="item-text">
                      {{ train.arrival_time }}
                    </v-card-text>
                  </v-li>
                </v-col>
              </v-row>
              <nuxt-link :to="`/travel/${travel.id}`">詳細へ遷移</nuxt-link>
            </v-ul>

    <!-- </v-row> -->
    </v-card>
    </v-container>
    </v-ul>
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
  .item-text {
    color: #001858;
    // font-size: 35px;
  }

  .v-card {
    width: 100%;
    // text-align: center;
  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
  }

  .title {
    color: #001858;
    text-align: center;
  }

  .item-text {
    font-size: 23px;
    color: #001858;
    // text-shadow:
    //     1px 0 0 #f582ae,
    //     0 1px 0 #f582ae,
    //     -1px 0 0 #f582ae,
    //     0 -1px 0 #f582ae
  }

  .item-title {
    font-size: 15px;
    color: #001858;
  }

</style>
