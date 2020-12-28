<template>
  <div>
    <h1>新規登録画面</h1>
    <v-container class="px-0" fluid>
    <v-radio-group v-model="transport">
      <v-radio
        label="列車"
        value="train"
      ></v-radio>
      <v-radio
        label="飛行機"
        value="air"
      ></v-radio>
    </v-radio-group>
      <v-btn @click="handleSubmit">決定</v-btn>
  </v-container>
  </div>
</template>


<script>
import axios from "@/plugins/axios";
export default {
    data () {
      return {
        transport: "",
      }
    },
  // methods: {
  //   handleSubmit() {
  //     const travel = {
  //       transport: this.transport,
  //       user_id: this.user.id
  //     };
  //     this.transport = "";
  //   async travelnew (travel) {
  //     const res = await axios.post(travelnew, { travel });
  //     }
  //   }
  // }
  };
</script>