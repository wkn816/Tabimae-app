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
    <v-data-table
      :items="transport"
    ></v-data-table>
  </v-card>
</template>

<script>
import TravelNew from "@/pages/travel_new";

export default {
  // components: {
  //   TravelNew,
  // },
  data() {
    return {
      // travel_params: "",
      //   {
      // travel: "",
      transport: "",
      // name: "",
      // departure_place: "",
      // arrival_place: "",
      // departure_time: "",
      // arrival_time: "",

        };
      // ],
      // search: "",
      // headers: [
      //   {
      //     text: "タイトル",
      //     align: "left",
      //     sortable: false,
      //     value: "title",
      //   },
      //   { text: "ユーザー名", value: "username" },
      // ],
  },
};
</script>

<style>
</style>