<template>
  <div>
    <v-container class="train-info">
      <v-row>
        <v-col cols="4" sm="10" md="10" lg="10">
      <img :src="image_src" @click="openModal" class="train-img">
        </v-col>
      </v-row>
    </v-container>
      <Modal v-if="modalFlag">
        <ul>
          <li v-for="item in items" :key="item">
            <v-checkbox v-model="selected" :label="item" :value="item"></v-checkbox>
          </li>
        </ul>
        <button @click="closeModal">閉じる</button>
      </Modal>
  </div>
</template>

<script>
  import {
    VueTyper
  } from 'vue-typer'
  import moment from "moment";
  import Vue from 'vue'
  import VModal from 'vue-js-modal'
  import Modal from '~/components/Modal.vue'
  Vue.use(VModal)

  export default {
    data() {
      return {
        modalFlag: false,
        image_src: require("../assets/img/train_info.JPG") // ←

      }
    },
    components: {
      VueTyper,
      Modal,

    },
    methods: {
      openModal() {
        this.modalFlag = true
      },
      closeModal() {
        this.modalFlag = false
      }
    }
  }

</script>
<style lang="scss" scoped>
  h1 {
    color: black;
  }

  .train-img {
    width: 240px;
  }
  // .main-introduction {
  //     margin: 2em 0;
  //     position: relative;
  //     padding: 0.5em 1.5em;
  //     border-top: solid 2px white;
  //     border-bottom: solid 2px white;
  //     font-size: 20px;
  //     font-family: "dot";
  //     letter-spacing: 10px;
  // }

</style>
