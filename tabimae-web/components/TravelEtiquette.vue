<template>
  <div>
        <!-- <v-col cols="12" offset-sm="3" sm="3" offset-md="3" md="3" offset-lg="3" lg="3"> -->
      <img :src="image_src" @click="openModal" class="new_travel_info-img">
        <!-- </v-col> -->
      <Modal v-if="modalFlag" @close-modal="closeModal">
<v-badge>
<img src="../assets/img/new_travel_style.png" height="500" width="400" alt="サンプル画像" align="bottom" ><br>

<v-btn class="mx-2"
        fab
        dark
        small
        color="primary"
        @click="closeModal">
          <v-icon>mdi-close-thick</v-icon>
        </v-btn>
</v-badge>
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
        image_src: require("../assets/img/travel_e.JPG"),
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
    width: 320px;
    box-shadow: 5px 10px 20px rgba(0, 0, 0, 0.883);
    &:hover {
      transform: scale(1.04);
      transition-duration: 40ms;
    }
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
  //
</style>
