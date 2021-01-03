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
          <p>出発時間</p><vue-timepicker v-model="departure_time" format="A:h:mm:"></vue-timepicker>
          <p>到着時間</p><vue-timepicker v-model="arrival_time" format="A:h:mm:"></vue-timepicker>

      </template>

      <template v-if="transport === 'air'">
        <h1>飛行機で行く</h1>
        <v-col cols="12" md="4">
          <v-text-field v-model="departure_place" :counter="10" label="出発地" required></v-text-field>
          <v-text-field v-model="arrival_place" :counter="10" label="到着地" required></v-text-field>
        </v-col>
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
import VueTimepicker from 'vue2-timepicker'
import 'vue2-timepicker/dist/VueTimepicker.css'
export default {
  components: {
      'vue-timepicker': VueTimepicker,
  },
  data() {
    return {
      travel: "",
      transport: "",
      name: "",
      departure_place: "",
      arrival_place: "",
      departure_time: "",
      arrival_time: "",

      success: false,
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
          departure_time: this.departure_time,
          arrival_time: this.arrival_time,
          user_id: this.$store.state.auth.currentUser.id
        };
        console.log(train_params);
        const res_train = await axios.post("/v1/trains", { train: train_params });
        console.log(res_train);
        this.departure_place = "";
        this.arrival_place = "";
        this.departure_time = "";
        this.arrival_time = "";

      }
      // this.$router.push 詳細画面へ遷移。
    }
  },
  computed: {
    user() {
      return
      this.$store.state.auth.currentUser;
    }

  }
};
</script>

