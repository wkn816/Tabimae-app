<template>
  <div>
        <!-- <v-col cols="12" offset-sm="6" sm="4" offset-md="6" md="4" offset-lg="3" lg="3"> -->
      <img :src="image_src" @click="openModal" class="howto-img">
    <!-- </v-col> -->
    <Modal v-if="modalFlag" @close-modal="closeModal">
      <v-col sm="11" md="10" lg="10">
        <h1 class="howto-info-title">タビマエの使い方</h1>
        <ul class="howto-info-text">
          <h2>はじめに</h2>
          タビマエのご利用誠にありがとうございます。
          <li>当アプリは、新規会員登録していただくことで、いつどこでもご自身の旅行を確認すことができます。</li>
          <li>既に、新規会員登録されている方は「ログイン」から登録したメールアドレスとパスワードを入力して頂きご利用ください。</li>
          <li>タビマエをすぐお試し頂きたい方は「ゲストログイン」をご利用ください。</li>
          <h2>タビ登録機能</h2>
          <li>お決まりのご旅行の・出発日・出発地/到着地・出発時間/到着時間・旅行のテーマを登録してください。</li>
          <li>旅行のテーマ（例）「家族旅行」「卒業旅行」「自分探し旅」など自由にテーマを設定できます！</li>
          <h2>タビ確認機能</h2>
          <li>旅行一覧画面にて、「詳細」ボタンをクリックすると、より詳しく登録した旅行を確認できます。</li>
          <li>登録した旅行の・出発日・出発地/到着地・出発時間/到着時間・旅行のテーマを確認できます。</li>
          <li>登録したタビを確認することで、日付や場所、時間の間違いを防ぎます。</li>
          <li>出発までの残り日数を確認することができます。</li>
          <li>出発日が過ぎたタビは自動的に削除されます。</li>
          <h2>その他機能</h2>
          <li>出発までの残り日数に合わせた、メッセージが表示されます。</li>
          <li>メッセージを参考に旅行準備を進めましょう。</li>
          <li>忘れものリストに自由に持ち物を追加して、忘れ物を防ぎましょう。</li>

        </ul>
        <v-btn class="mx-2"
        fab
        dark
        small
        color="primary"
        @click="closeModal">
          <v-icon>mdi-close-thick</v-icon>
        </v-btn>
      </v-col>

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
        image_src: require("../assets/img/howto.JPG") // ←

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

$sp: 480px;  // スマホ

@mixin sp {
  @media (max-width: ($sp)) {
    @content;
  }
}

  h1 {
    color: black;
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
.howto-info-title{
  color: #001858;
  text-align: center;
}
.howto-info-text{
  color: #001858;
  text-align: left;
}
</style>
