<template>
  <v-card>
    <h1>詳細画面</h1>
    {{ res_travel_show.data.name }}
    {{ res_travel_show.data.trains[0].departure_day }}
    {{ res_travel_show.data.trains[0].departure_place }}
    {{ res_travel_show.data.trains[0].arrival_place }}
    {{ res_travel_show.data.trains[0].departure_time }}
    {{ res_travel_show.data.trains[0].arrival_time }}
    <v-icon small @click="deleteItem({res_travel_show})">削除</v-icon>
  </v-card>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  // props: ["travel"],
  data() {
    return {
      res_travel_show: {},
      res_delete: {}
    };
  },
  // console.log(array1[0]);

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
      console.log(res_travel_show);
      return {
        res_travel_show
      };
    } catch (err) {
      console.log("err", err);
    }
  },

  methods: {
    async deleteItem(res_travel_show) {
      console.log(res_travel_show);
      const res = confirm("本当に削除しますか？");
      if (res) {
        await axios.delete(`/v1/travels/${params.id}`);
      }
  　　},
    // }
    // methods: {
    // async deleteItem(id) {
    //   console.log(IDBCursor);
    //   const res_delete = await this.$axios.$delete(`/v1/travels/${params.id}`);
    // }
    // }
    // computed: {
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
