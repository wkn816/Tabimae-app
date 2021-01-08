<template>
    <v-card>
    <h1>詳細画面</h1>
  </v-card>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  
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
      this.travelData = await axios.get("/v1/travels", { params: { user } });

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

<style></style>
