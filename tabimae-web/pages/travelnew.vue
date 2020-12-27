<template>
  <div>
    <h1>新規登録画面</h1>
    <v-container class="px-0" fluid>
    <v-radio-group v-model="radioGroup">
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
  </div>
</template>


<script>
export default {
    data () {
      return {
        radioGroup: [],
      }
    },
  };
</script>