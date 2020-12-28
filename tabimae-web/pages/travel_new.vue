<template>
  <div>
    <h1>新規登録画面</h1>
    <nuxt-link to="/travel_list">旅程一覧</nuxt-link>
    <v-container class="px-0" fluid>
      <!-- <v-radio-group v-model="transport">
      <v-radio
        label="列車"
        value="train"
      ></v-radio>
      <v-radio
        label="飛行機"
        value="air"
      ></v-radio>
    </v-radio-group> -->
    <h2 v-if="success">登録したよ!</h2>
      <v-col cols="12" md="4">
        <v-text-field
          v-model="name"
          :counter="10"
          label="旅行のテーマ"
          required
        ></v-text-field>
      </v-col>
      <v-btn @click="createTravel">決定</v-btn>
      {{ user }}
    </v-container>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
    data () {
      return {
        travel: "",
        name: "",
        success: false,
      };
    },
  methods: {
    async createTravel() {
      console.log(this.$store.state.auth.currentUser);
      const travel = {
        name: this.name,
        user_id: this.$store.state.auth.currentUser.id
      };
      console.log(travel);
      const {
        data
      } = await axios.post("/v1/travels", { travel });
      this.name = "";
      this.success = true;
      console.log(data);
    }
  },
  computed: {
  user(){
    return this.$store.state.auth.currentUser
  }
}
};
</script>
