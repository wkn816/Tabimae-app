<template>
  <div>
    <v-dialog v-model="dialog" scrollable max-width="1060px">
      <template v-slot:activator="{ on, attrs }">
        <img :src="image_src" v-bind="attrs" v-on="on" class="train-img">
      </template>
      <v-card>
        <v-card-title class="train-info-title">列車ご乗車の際のご注意事項</v-card-title>
        <v-divider></v-divider>
        <v-card-text>
          <ul class="train-info-text">
            <h3>新幹線ご利用の場合</h3>
            <li>新幹線は「乗車券」と「特急券」の2種類が必要です。</li>
            <li>購入した切符の券面に記載の乗車日/乗車時間/座席を確認しましょう。</li>
            <li>年末年始やGWの繁忙期は早めに指定券の購入をしましょう。</li>
            <li>指定券は乗車日１ヶ月前午前１０時からです。</li>
            <li>東海道・山陽・九州新幹線ご利用の場合で、「3辺の合計が160cm超250cm以内」の荷物（特大荷物）を車内に持ち込む場合、「特大荷物スペースつき座席」をご予約ください。</li>
            <li>「特大荷物スペースつき座席」の予約なしに特大荷物を持ち込んだ場合、持込手数料¥1.000が発生します</li>
            <li>購入した列車に乗り遅れてしまった場合、払い戻しは不可で、同日の後続列車の自由席にご乗車いただけます。</li>
            <li>切符の払い戻しは、出発前の場合のみ可能です。その際「払戻手数料」が発生します。</li>
          </ul>
        </v-card-text>
        <v-divider></v-divider>
        <v-btn color="blue darken-1" text @click="dialog = false">
          <v-icon>
            mdi-close-circle-outline
          </v-icon>
        </v-btn>
      </v-card>
    </v-dialog>
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
        image_src: require("../assets/img/train_info.JPG"),
        dialogm1: '',
        dialog: false,
      }
    },
    components: {
      VueTyper,
      Modal,
    },
  }

</script>
<style lang="scss" scoped>
  $sp: 480px; // スマホ

  @mixin sp {
    @media (max-width: ($sp)) {
      @content;
    }
  }

  .v-card {
    background-color: aliceblue;
    width: 1000px;
  }

  .train-img {
    width: 350px;
    box-shadow: 5px 10px 20px rgba(0, 0, 0, 0.883);

    &:hover {
      transform: scale(1.04);
      transition-duration: 40ms;
    }

    @include sp {
      width: 250px;
    }
  }

  .train-info-title {
    color: #001858;
    text-align: center;
  }

  .train-info-text {
    color: #001858;
    text-align: left;
    padding-top: 60px;
  }

</style>
