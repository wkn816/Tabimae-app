<template>
  <v-card>
    <v-card-title>
      旅行一覧
      <v-spacer></v-spacer>
      <!-- <v-text-field
        v-model="search"
        append-icon="search"
        label="Search"
        single-line
        hide-details
      ></v-text-field> -->
    </v-card-title>
    <!-- <v-data-table
      :items="transport"
    ></v-data-table> -->
    <!-- {{ travelData }} -->
    <!-- {{ returnUserName }} -->
    {{ userName }}
  </v-card>
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
    this.travelData = await axios.get("/v1/travels");
    this.filteingUserName();
    //filterで作り直された配列がtravelNameに入る
  },
  // created() {
  //   this.userName = this.travelData.data.filter(function(value) {
  //     console.log(value);
  //   });
  // },
  methods: {
    filteingUserName() {
      console.log(this.travelData);
      this.userName = this.travelData.data.map(function(value) {
        console.log(value.trains);
        return value.trains;
      });
      console.log(this.userName);
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
  }
};
</script>

<style></style>
