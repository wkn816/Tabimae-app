<template>
  <div>
    <h1>新規登録画面</h1>
    <nuxt-link to="/travel_list">旅程一覧</nuxt-link>
    <h2 v-if="success">登録したよ!</h2>
    <v-container class="px-0" fluid>
      <v-container fluid>
        <v-radio-group v-model="transport" mandatory>
          <v-radio label="列車" value="train"></v-radio>
          <v-radio label="飛行機" value="air"></v-radio>
        </v-radio-group>
      </v-container>

      <template v-if="transport === 'train'">
        <h1>列車で行く</h1>
        <v-col cols="12" md="4">
        <v-text-field v-model="departure_place" :counter="10" label="出発地" required></v-text-field>
        <v-text-field v-model="arrival_place" :counter="10" label="到着地" required></v-text-field>
      </v-col>
      </template>

      <template v-if="transport === 'air'">
        <h1>飛行機</h1>
      </template>

      <v-col cols="12" md="4">
        <v-text-field v-model="name" :counter="10" label="旅行のテーマ" required></v-text-field>
      </v-col>

      <v-btn @click="createTravel">決定</v-btn>
      {{ user }}
    </v-container>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  data() {
    return {
      travel: "",
      transport: "",
      name: "",
      departure_place: "",
      arrival_place: "",
      success: false
      // departure_date: ''
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
      console.log(data.id);
      this.transport = "";
      this.name = "";
      this.success = true;

      if(this.transport === 'air') {
        const air_params = {
          travel_id: data.data.id,
          // departure_place: this.departure_place,
          // arrival_place: this.arrival_place
          //カラムたくさん追加します
          //カラムたくさん追加します
          //カラムたくさん追加します
          //カラムたくさん追加します
        }
        const res_air = await axios.post("/v1/airs", { air_params });
      } else {
        const train_params = {
          departure_place: this.departure_place,
          arrival_place: this.arrival_place,
          user_id: this.$store.state.auth.currentUser.id
          };
        const res_train = await axios.post("/v1/trains", { train_params });
        this.departure_place = "";
        this.arrival_place = "";
      };
      // this.$router.push 詳細画面へ遷移。
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser;
    }
  }
};
</script>

