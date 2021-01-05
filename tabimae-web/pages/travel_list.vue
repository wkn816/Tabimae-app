<template>
<div>

  <!-- {{ data }} -->

  <!-- {{ transport }} -->
  <!-- {{ travels }} -->
  <!-- {{ trains }} -->
  <template v-model="travel_index">
    <h1>旅行一覧画面</h1>
    <v-btn @click="asyncData">表示</v-btn>

  </template>
  {{result}}
</div>
</template>

<script>
  // import TravelNew from "@/pages/travel_new";
  import axios from "@/plugins/axios";

// import axios from "axios"

// const url = "test/api/path"

export default {

  data() {
    return {
      travel_index: "",
      result: "",
      travel: "",
      data: "",
      transport: ""
    }
  },
  // computed: {
    // user() {
    //   return this.$store.state.auth.currentUser;
    // },
    // travels(){
    //   return this.$store.state.auth.travels;
    // },
    // trains(){
    //   return this.$store.state.auth.trains;
    // }
    // departure_day_test () {
    //   return this.choice_departure_day ? moment(this.choice_departure_daye).format('dddd, MMMM Do YYYY') : ''
    // },
  // },
    methods:{
      async asyncData() {
        const user_params ={

        }
      //   const result = await axios.get("/v1/users", { user_params });
      // console.log(result);
        const travelresult = await axios.get("/v1/users", {  });
        console.log(travelresult);
      // return {
        //   transport: this.transport
      // }
    },
    }
  // methods: {
  //   fetch() {
  //     this.transport = createTravel()
  //   }
  // }
}
</script>

<style>
</style>