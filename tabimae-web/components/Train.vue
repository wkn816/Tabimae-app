<template>
  <div>

        <v-col sm="10" md="10" lg="10">
      <img :src="image_src" @click="openModal" class="train-img">
        </v-col>

      <Modal v-if="modalFlag">
        <!-- <ul>
          <li v-for="item in items" :key="item">

            <v-checkbox v-model="selected" :label="item" :value="item"></v-checkbox>
          </li>
        </ul> -->
        <h2 class="train-info-title">列車ご乗車の際のご注意事項</h2>
        <ul class="train-info-text">
          <li>新幹線ご利用の場合</li>
          <li>新幹線は「乗車券」と「特急券」の2種類が必要です。</li>
          <li>購入した切符の券面に記載の乗車日/乗車時間/座席を確認しましょう</li>
          <li>東海道・山陽・九州新幹線ご利用の場合で、「3辺の合計が160cm超250cm以内」の荷物（「特大荷物」）を車内に持ち込む場合、「特大荷物スペースつき座席」をご予約ください</li>
          <li>「特大荷物スペースつき座席」の予約なしに特大荷物を持ち込んだ場合、持込手数料¥1.000が発生します</li>
          <li>購入した列車に乗り遅れてしまった場合、払い戻しは不可で、同日の後続列車の自由席にご乗車いただけます。<｀/li>
          <li>新幹線ご利用の場合</li>
        </ul>
        <button @click="closeModal" class="modal-close">閉じる</button>
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
    width: 320px;
    box-shadow: 5px 10px 20px rgba(0, 0, 0, 0.883);
    &:hover {
      transform: scale(1.04);
      transition-duration: 40ms;
    }
  }
.modal-close{
    background-color: #001858;
    font-weight: bolder;
    // border: solid 5px #f582ae;
    /*線*/
    border-radius: 10px;
    /*角の丸み*/
    text-decoration: none;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
    box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.883);
    padding: 7px;
}
.train-info-title{
  color: #001858;
}
.train-info-text{
  color: #001858;
}

</style>
