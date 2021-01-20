<template>
  <div>
        <v-col sm="10" md="10" lg="10">
      <img :src="image_src" @click="openModal" class="new_travel_info-img">
        </v-col>
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
        image_src: require("../assets/img/new_travel_info.png") // ←

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

  .new_travel_info-img {
    width: 290px;
    box-shadow: 5px 10px 20px rgba(0, 0, 0, 0.883);

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
