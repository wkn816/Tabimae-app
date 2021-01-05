<template>
<div>

  <!-- {{ data }} -->

  <!-- {{ transport }} -->
  <!-- {{ travels }} -->
  <!-- {{ trains }} -->
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
        const result = await axios.get("/v1/users", { user });
      console.log(result);
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