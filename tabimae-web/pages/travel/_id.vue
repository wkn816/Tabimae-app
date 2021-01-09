<template>
  <v-card>
    <h1>詳細画面</h1>
    <!-- {{res_travel_show}} -->
    {{res_travel_show.data.name}}
    {{res_travel_show.data}}
    {{res_travel_show.data.trains.departure_day}}

  </v-card>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  data() {
    return {
      res_travel_show: {}
    };
  },
  // async asyncData({ params }) {
  //   // console.log(this.$store.state.auth.currentUser.id);
  //   // const user = this.$store.state.auth.currentUser;
  //   // debugger
  //   if (user) {
  //     //this.travelData = await axios.get("/v1/travels/${ travel.id }");
  //     // console.log(travel.id);
  //     this.travelData = await axios.get(
  //       `${process.env.BASE_URL}/travels/${params.id}`
  //     );
  //     console.log(this.travelData);

  //     //filterで作り直された配列がtravelNameに入る
  //     console.log(this.travelData);
  //   }
  // },
  async asyncData({ params }) {
    try {
      // debugger
      const res_travel_show = await axios.get(
        // `${process.env.BASE_URL}/v1/travels/${params.id}`
        // `http://localhost:8080/travels/${params.id}`
        `/v1/travels/${params.id}`
      );
      console.log(res_travel_show.data.trains);
      return {
        res_travel_show
      };
    } catch (err) {
      console.log("err", err);
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

<style></style>
