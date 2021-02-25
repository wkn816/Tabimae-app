<template>
  <div>
    <v-dialog v-model="dialog" scrollable max-width="1060px">
      <template v-slot:activator="{ on, attrs }">
        <img :src="image_src" v-bind="attrs" v-on="on" class="train-img">
      </template>
      <v-card>
        <p class="train-info-title" text-center>列車ご乗車の際のご注意事項</p>
        <v-divider></v-divider>
        <v-card-text>
          <ul class="train-info-text">
            <h3>切符の購入</h3>
            <li>新幹線は「乗車券」と「特急券」の2種類が必要です。</li>
            <li>購入した切符の券面に記載の乗車日/乗車時間/座席を確認しましょう。</li>
            <li>年末年始やGWの繁忙期は早めに指定券の購入をしましょう。</li>
            <li>指定券は乗車日１ヶ月前午前１０時からです。</li>
            <h3>乗り遅れ・払い戻し</h3>
            <li>購入した列車に乗り遅れてしまった場合、払い戻しは不可で、同日の後続列車の自由席にご乗車いただけます。</li>
            <li>切符の払い戻しは、出発前の場合のみ可能です。その際「払戻手数料」が発生します。</li>
            <h3 style="color:red">＊2020年５月20日からの新ルール＊</h3>
            <li>東海道・山陽・九州新幹線ご利用の場合で、「3辺の合計が160cm超250cm以内」の荷物（特大荷物）を車内に持ち込む場合、「特大荷物スペースつき座席」をご予約ください。</li>
            <li>「特大荷物スペース」の予約なしに特大荷物を持ち込んだ場合、持込手数料（1,000円/税込）をいただきます。その際は、乗務員が指定する箇所に荷物を収納してください。</li>
            <li>特大荷物スペースつき座席」は、列車によっては混み合う場合もありますので、早目のご予約をお願いします。満席の場合は前後の列車をご予約ください。</li>
            <li>なお、160cm以下の車内への持ち込みはこれまで通り、荷物棚に収納することができます。</li>
            <li>ベビーカーやスポーツ用品・楽器等に特大荷物のルールは適用されませんが、特大荷物スペースをご希望の場合には予約が必要となります。</li>
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

  .train-info-title{
    color: #001858;
    text-align: center;
    font-size: 30px;
    @include sp {
    font-size: 20px;
    }
  }

  .train-info-text {
    color: #001858;
    text-align: left;
  }
  ul li{
    padding-left: 1em;
    text-indent: -1em;
  }
  h3{
    padding-left: -1em;
    text-indent: -1em;
  }
</style>
