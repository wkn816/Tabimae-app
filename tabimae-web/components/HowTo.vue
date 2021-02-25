<template>
  <div>
    <v-dialog v-model="dialog" scrollable max-width="1060px">
      <template v-slot:activator="{ on, attrs }">
        <img :src="image_src" v-bind="attrs" v-on="on" class="howto-img">
      </template>
      <v-card>
        <p class="howto-info-title" text-center>タビマエの使い方</p>
        <v-divider></v-divider>
        <v-card-text>
          <ul class="howto-info-text">
            <h3>はじめに</h3>
            タビマエのご利用誠にありがとうございます。
            <li>当アプリは、新規会員登録していただくことで、いつどこでもご自身の旅行を確認すことができます。</li>
            <li>既に、新規会員登録されている方は「ログイン」から登録したメールアドレスとパスワードを入力して頂きご利用ください。</li>
            <li>タビマエをすぐお試し頂きたい方は「ゲストログイン」をご利用ください。</li>
            <h3>タビ登録機能</h3>
            <li>お決まりのご旅行の・出発日・出発地/到着地・出発時間/到着時間・旅行のテーマを登録してください。</li>
            <li>旅行のテーマ（例）「家族旅行」「卒業旅行」「自分探し旅」など自由にテーマを設定できます！</li>
            <h3>タビ確認機能</h3>
            <li>旅行一覧画面にて、「詳細」ボタンをクリックすると、より詳しく登録した旅行を確認できます。</li>
            <li>登録した旅行の・出発日・出発地/到着地・出発時間/到着時間・旅行のテーマを確認できます。</li>
            <li>登録したタビを確認することで、日付や場所、時間の間違いを防ぎます。</li>
            <li>出発までの残り日数を確認することができます。</li>
            <li>出発日が過ぎたタビは自動的に削除されます。</li>
            <h3>その他機能</h3>
            <li>出発までの残り日数に合わせた、メッセージが表示されます。</li>
            <li>メッセージを参考に旅行準備を進めましょう。</li>
            <li>忘れものリストに自由に持ち物を追加して、忘れ物を防ぎましょう。</li>
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

  Vue.use(VModal)

  export default {
    data() {
      return {
        image_src: require("../assets/img/howto.JPG"),
        dialogm1: '',
        dialog: false,
      }
    },
    components: {
      VueTyper,

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

  .howto-img {
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

  .v-card {
    background-color: aliceblue;
    width: 1000px;
  }

  .howto-info-title {
    color: #001858;
    text-align: center;
    font-size: 30px;
    @include sp {
    font-size: 20px;
    }
  }

  .howto-info-text {
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
