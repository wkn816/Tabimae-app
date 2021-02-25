<template>
  <div>
    <v-dialog
        v-model="dialog"
        scrollable
        max-width="1060px"
      >
          <template v-slot:activator="{ on, attrs }">
              <img :src="image_src" v-bind="attrs" v-on="on" class="air-img">
          </template>
        <v-card>
        <v-card-title class="air-info-title">飛行機ご搭乗の際のご注意事項</v-card-title>
          <v-divider></v-divider>
          <v-card-text>
        <ul class="air-info-text">
          <h3>チェックイン前</h3>
          <li>羽田・成田空港発着の場合、航空会社によって発着ターミナルが異なります。</li>
          <li>空港は大変広くなっており、空港内の移動には時間がかかります。余裕を持った行動を心がけましょう</li>
          <li>空港には、遅くても出発の４５分前に到着するようにしましょう。慣れていない方は１時間〜１時間半前をオススメします。</li>
          <li>夏休み、GWなどの繁忙期はチャックインカウンターが大変混み合います。乗り遅れに繋がりますので通常より早めに空港に到着できるようにしましょう。</li>
          <h3>手荷物について</h3>
          <li>預け荷物の大きさ・重量は航空会社によって異なります。各航空会社のホームページを確認しましょう。</li>
          <li>航空会社によって、預ける荷物の大きさ、重量に対して別途料金が発生する場合があります。</li>
          <li>預け荷物、機内持込み可能な品は細かく分けられています。荷造りする際に確認しましょう。</li>
          <li>機内持込み品に持込み不可な物が入っていた場合、その場で破棄されてしまう可能性がありますのでご注意ください。</li>
          <li>機内は、非常に乾燥しており、冷えやすいです。羽織り物があると安心です。</li>
          <h3>保安検査所通過</h3>
          <li>保安検査所では、手荷物・身に付けているアクセサリーなどの検査を行います</li>
          <li>保安検査所通過後、フライトの１０分〜２０分前に指定された搭乗口に到着しましょう。</li>
        </ul>
        </v-card-text>
          <v-divider></v-divider>
        <v-btn
              color="blue darken-1"
              text
              @click="dialog = false"
            >
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
        image_src: require("../assets/img/air_info.JPG"),
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
$sp: 480px;  // スマホ
@mixin sp {
  @media (max-width: ($sp)) {
    @content;
  }
}
.v-card{
  background-color: aliceblue;
  width: 1000px;
}
  .air-img {
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
.air-info-title{
  color: #001858;
  text-align: center;
}
.air-info-text{
  color: #001858;
  text-align: left;
}
</style>
