<template>
  <div>
        <!-- <v-col cols="12" offset-sm="6" sm="4" offset-md="6" md="4" offset-lg="3" lg="3"> -->
      <img :src="image_src" @click="openModal" class="air-img">
    <!-- </v-col> -->
    <Modal v-if="modalFlag" @close-modal="closeModal">
      <v-col sm="11" md="10" lg="10">
        <h2 class="air-info-title">飛行機ご搭乗の際のご注意事項</h2>
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
        image_src: require("../assets/img/air_info.JPG") // ←

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

  .air-img {
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
.air-info-title{
  color: #001858;
  text-align: center;
}
.air-info-text{
  color: #001858;
  text-align: left;
}
</style>
