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
        <v-row justify="center">
        <v-col cols="8">
          <v-text-field v-model="departure_day" single-line>
            <template v-slot:append-outer>
              <date-picker v-model="departure_day"/>
            </template>
          </v-text-field>
        </v-col>
        <v-col cols="8">
          <p>日付： {{ departure_day }}</p>
        </v-col>
      </v-row>
      </template>

      <template v-if="transport === 'air'">
        <h1>飛行機で行く</h1>
      <v-text-field v-model="departure_place" :counter="10" label="出発地" required></v-text-field>
      <v-text-field v-model="arrival_place" :counter="10" label="到着地" required></v-text-field>
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
      success: false,
      departure_day: null,
    };
  },
  methods: {
    async createTravel() {
      const travel_params = {
        transport: this.transport,
        name: this.name,
        user_id: this.$store.state.auth.currentUser.id
      };
      console.log(travel_params);
      const { data } = await axios.post("/v1/travels", { travel: travel_params });
      console.log(data.id);
      this.transport = "";
      this.name = "";
      this.success = true;

      if (this.transport === "air") {
        console.log(data);
        const air_params = {
          travel_id: data.id,
          departure_place: this.departure_place,
          arrival_place: this.arrival_place,
          user_id: this.$store.state.auth.currentUser.id
          //カラムたくさん追加します
          //カラムたくさん追加します
          //カラムたくさん追加します
          //カラムたくさん追加します
        };
        console.log(air_params);
        const res_air = await axios.post("/v1/airs", { air: air_params });
        console.log(res_air);
        this.departure_place = "";
        this.arrival_place = "";
      } else {
        const train_params = {
          travel_id: data.id,
          departure_place: this.departure_place,
          arrival_place: this.arrival_place,
          user_id: this.$store.state.auth.currentUser.id
        };
        console.log(train_params);
        const res_train = await axios.post("/v1/trains", { train: train_params });
        console.log(res_train);
        this.departure_place = "";
        this.arrival_place = "";

      }
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

