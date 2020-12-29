<template>
  <div>
    <h1>新規登録画面</h1>
    <nuxt-link to="/travel_list">旅程一覧</nuxt-link>
    <h2 v-if="success">登録したよ!</h2>
    <v-container class="px-0" fluid>

    <v-container fluid>
    <v-radio-group
      v-model="transport"
      mandatory
    >
      <v-radio
        label="列車"
        value="train"
      ></v-radio>
      <v-radio
        label="飛行機"
        value="air"
      ></v-radio>
    </v-radio-group>
  </v-container>

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
        transport: "",
        name: "",
        success: false,
      };
    },
  methods: {
    async createTravel() {
      const travel = {
        transport: this.transport,
        name: this.name,
        user_id: this.$store.state.auth.currentUser.id
      };
        console.log(travel);
      const {
        data
      } = await axios.post("/v1/travels", { travel });
      this.transport = "";
      this.name = "";
      this.success = true;
    }
  },
  computed: {
    user(){
      return this.$store.state.auth.currentUser
  }
}
};
</script>
