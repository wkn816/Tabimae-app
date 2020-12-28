<template>
  <div>
    <h1>旅行一覧ページ</h1>
    <v-data-table :headers="headers" :items="travels">
      <template v-slot:item.action="{ item }">
        <v-icon small @click="deleteItem(item)">delete</v-icon>
      </template>
    </v-data-table>
  </div>
</template>

<script>
import axios from "@/plugins/axios";


export default {

  data() {
    return {
      todos: [],
    };
  },
};
</script>

<style>
</style>