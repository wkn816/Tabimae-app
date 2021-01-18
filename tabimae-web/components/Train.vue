<template>
<div>
  <h1>aaaaa</h1>

<v-btn class="help_link__button" @click="openModal">
        列車で行く場合の注意点
      </v-btn>
      <img :src="image_src" @click="openModal">
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
import { VueTyper } from 'vue-typer'
import moment from "moment";
import Vue from 'vue'
import VModal from 'vue-js-modal'
import Modal from '~/components/Modal.vue'
  Vue.use(VModal)

export default {
  data(){
    return{
    modalFlag: false,
    image_src: require("../assets/img/pf.jpeg") // ←

    }
  },
components: {
    VueTyper,
    Modal,

  },
  methods:{
      openModal() {
        this.modalFlag = true
      },
      closeModal() {
        this.modalFlag = false
      }
  }
}
</script>
<style  lang="scss" scoped>
.home-hero__content {
  // background: url("../assets/img/pf.jpeg");
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100vh;

  &-text {
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
  }
}

h1{
  color: black;
}

</style>