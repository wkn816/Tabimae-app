<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card color="#f3d2c1" class="travelshow-card">
            <v-card-title primary-title class="justify-center">
              <v-icon x-large color=#e53170>
                mdi-chevron-double-right
              </v-icon>
              <span class="travelshow-title">旅行詳細</span>
              <v-icon x-large color=#e53170>
                mdi-chevron-double-left
              </v-icon>
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="3">
          <v-card color="#001858" elevation="24">
            <v-card-title primary-title class="justify-center">
              <v-icon large>mdi-bag-checked</v-icon>
              <span class="title"></span>
            </v-card-title>

            <v-btn large class="justify-center" @click="openModal" style="background-color:#faae2b">
              <h3 style="color:#001858">持ち物リストをひらく</h3>
            </v-btn>

            <v-card raised class="ma-2" color="#fef6e4" elevation="24">
              <v-alert border="left" colored-border color="#8bd3dd" elevation="2" class="list">
                <h5 class="remind-ms">{{ text }}</h5>
              </v-alert>
            </v-card>
            <v-card raised class="ma-2" color="#fef6e4" elevation="24">
              <v-alert border="left" colored-border color="#8bd3dd" elevation="2" class="list">
                <h5 class="remind-ms">{{ text2 }}</h5>
              </v-alert>
            </v-card>
            <v-card raised class="ma-2" color="#fef6e4" elevation="24">
              <v-alert border="left" colored-border color="#8bd3dd" elevation="2" class="list">
                <h5 class="remind-ms">{{ text3 }}</h5>
              </v-alert>
            </v-card>
            <v-card raised class="ma-2" color="#fef6e4" elevation="24">
              <v-alert border="left" colored-border color="#8bd3dd" elevation="2" class="list">
                <h5 class="remind-ms">{{ text4 }}</h5>
              </v-alert>
            </v-card>
            <v-card raised class="ma-2" color="#fef6e4" elevation="24">
              <v-alert border="left" colored-border color="#8bd3dd" elevation="2" class="list">
                <h5 class="remind-ms">{{ text5 }}</h5>
              </v-alert>
            </v-card>
            <v-card raised class="ma-2" color="#fef6e4" elevation="24">
              <v-alert border="left" colored-border color="#8bd3dd" elevation="2" class="list">
                <h5 class="remind-ms">{{ text6 }}</h5>
              </v-alert>
            </v-card>

            <Modal v-if="modalFlag">

              <ul style="background-color:#001858">
                <li v-for="item in items" :key="item" class="belonging-list">
                  <v-checkbox
                  :label="item"
                  :value="item"
                  v-model="ex4"
                  color="#fec7d7"
                  hide-details
                  ></v-checkbox>
                </li>

                <!-- <li> -->
                <v-col cols="12" sm="11" md="12" lg="6">
                  <v-text-field label="持ち物追加" filled required v-model="item" :counter="15"></v-text-field>
                  <v-btn fab dark small color="#f582ae" @click="travelitem">追加</v-btn>
                </v-col>

                <!-- <v-btn @click="itemsubmit">送信</v-btn> -->
                <v-btn class="mx-2" fab dark small color="#8bd3dd" @click="closeModal">
                  <v-icon>mdi-close-thick</v-icon>
                </v-btn>
                <!-- </／li> -->
              </ul>

              <!-- <v-btn class="mx-2" fab dark small color="#8bd3dd" @click="closeModal">
                <v-icon>mdi-plus-box</v-icon>
              </v-btn> -->

            </Modal>
          </v-card>
        </v-col>

        <v-col cols="12" sm="11" md="11" lg="9">
          <v-card color="#001858" elevation="20">
            <v-row>
              <v-col cols="12" sm="11" md="11" lg="12">
                <v-card-title primary-title>
                  <span class="display-1">{{ res_travel_show.data.name }}まで{{ `あと${daylimit}日` }}</span>
                </v-card-title>
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12" sm="11" md="11" lg="12">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title">出発日</h5>
                </v-card-title>
                <v-card-text primary-title class="justify-center">
                  <span class="display-1">{{ res_travel_show.data.trains[0].departure_day }}</span>
                </v-card-text>
              </v-col>
            </v-row>

            <v-row>
              <v-col cols="12" sm="11" md="11" lg="5">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title">出発地</h5>
                </v-card-title>
                <v-card-text primary-title class="justify-center">
                  <span class="display-1">{{ res_travel_show.data.trains[0].departure_place }}</span>
                </v-card-text>
              </v-col>

              <v-col cols="12" sm="11" md="11" lg="2">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title"></h5>
                </v-card-title>
                <v-icon x-large color="##001858">mdi-arrow-right</v-icon>
              </v-col>

              <v-col cols="12" sm="11" md="11" lg="5">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title">到着地</h5>
                </v-card-title>
                <v-card-text primary-title class="justify-center">
                  <span class="display-1">{{ res_travel_show.data.trains[0].arrival_place }}</span>
                </v-card-text>
              </v-col>
            </v-row>

            <v-row>
              <v-col cols="12" sm="11" md="11" lg="5">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title">出発時間</h5>
                </v-card-title>
                <v-card-text primary-title class="justify-center">
                  <span class="title">{{ res_travel_show.data.trains[0].departure_time }}</span>
                </v-card-text>
              </v-col>
              <v-col cols="12" sm="11" md="11" lg="2">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title"></h5>
                </v-card-title>
                <v-icon x-large color="##001858"></v-icon>
              </v-col>
              <v-col cols="12" sm="11" md="11" lg="5">
                <v-card-title primary-title class="justify-center">
                  <h5 class="item-title">到着時間</h5>
                </v-card-title>
                <v-card-text primary-title class="justify-center">
                  <span class="title">{{ res_travel_show.data.trains[0].arrival_time }}</span>
                </v-card-text>
              </v-col>
            </v-row>
          </v-card>
          <v-col cols="12" offset-lg="11" sm="11" md="11" lg="1">
            <v-btn class="delete-btn" fab outlined color="#001858" @click="deleteItem({ res_travel_show })">
              <v-icon>mdi-trash-can-outline</v-icon>
            </v-btn>
          </v-col>
        </v-col>
      </v-row>

      <!-- <v-row> -->
      <!-- </v-row> -->
    </v-container>
    <v-container>
      <v-card color="#f3d2c1">
        <v-card-title primary-title class="justify-center">
          <v-icon x-large color=#e53170>
            mdi-chevron-double-right
          </v-icon>
          <v-title class="display">旅行出発前に知っておきたいこと</v-title>
          <v-icon x-large color=#e53170>
            mdi-chevron-double-left </v-icon>
        </v-card-title>
        <v-card-text >
          <p>画像をクリックすると知っておきたい情報をチェックできます</p>
        </v-card-text>
        <v-row>
            <v-col class="info-img" cols="12" offset-sm="3" sm="3" offset-md="3" md="3" offset-lg="2" lg="2">
              <Train />
            </v-col>
            <v-col class="info-img" cols="12" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="2" lg="2">
              <Air />
            </v-col>
            <v-col class="info-img" cols="12" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="2" lg="3">
              <TravelEtiquette />
            </v-col>
            <v-col class="info-img" cols="12" offset-sm="6" sm="4" offset-md="3" md="3" offset-lg="1" lg="1">
              <HowTo />
            </v-col>
          </v-row>
      </v-card>
    </v-container>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  </div>
</template>

<script>
  import axios from "@/plugins/axios";
  import moment from "moment";
  import Vue from "vue";
  import VModal from "vue-js-modal";
  import Modal from "~/components/Modal.vue";
  import Train from "~/components/Train.vue";
  import Air from "~/components/Air.vue";
  import TravelEtiquette from "~/components/TravelEtiquette.vue";


  Vue.use(VModal);

  export default {
    // props: ["travel"],
    data() {
      return {
        res_travel_show: {},
        res_delete: {},
        test: {},
        checkbox: true,
        modalFlag: false,
        modalFlag: false,
        items: [
          "運転免許証",
          "保険証",
          "クレジットカード",
          "切符類",
          "モバイルバッテリー",
          "マスク",
          "アルコール消毒液",
          "常備薬"
        ],
        checkeditems: [],
        main: "main",
        item: ""
      };
    },

    async asyncData({
      params
    }) {
      try {
        // debugger
        const res_travel_show = await axios.get(
          // `${process.env.BASE_URL}/v1/travels/${params.id}`
          // `http://localhost:8080/travels/${params.id}`
          `/v1/travels/${params.id}`
        );
        const departure_day = moment(
          res_travel_show.data.trains[0].departure_day
        );
        const checkeditems = res_travel_show.data.travelitems;
        const daylimit = departure_day.diff(moment(), "days");
        let text;
        let text2;
        let text3;
        let text4;
        let text5;
        let text6;
        if (daylimit > 20) {
          text = "切符・航空券の手配はできた？";
          text2 = "必要ならレンタカーも予約しよう";
          text3 = "新型コロナウイルスの影響で営業形態が変更になっている場合があるから出発前にしっかり確認！";
          text4 = "最新の時刻表を確認しよう";
          text5 = "三密はしっかり回避！";
          text6 = "素敵な旅行になりますように♪";
        } else if (daylimit > 2 && daylimit < 20) {
          text = "準備はばっちり？";
          text2 = "体調管理には気を付けてね";
          text3 = "お土産袋を持っていくと便利かも";
          text4 = "三密はしっかり回避！";
          text5 = "新型コロナウイルスの影響で営業形態が変更になっている場合があるから出発前にしっかり確認！";
          text6 = "天気予報もしっかり確認しよう";
        } else if (daylimit == 1) {
          text = "準備はばっちり？";
          text2 = "体調管理には気を付けてね";
          text3 = "お土産袋を持っていくと便利かも";
          text4 = "三密はしっかり回避！";
          text5 = "新型コロナウイルスの影響で営業形態が変更になっている場合があるから出発前にしっかり確認！";
          text6 = "天気予報もしっかり確認しよう";
        } else if (daylimit == 0) {
          text = "準備はばっちり？";
          text2 = "体調管理には気を付けてね";
          text3 = "お土産袋を持っていくと便利かも";
          text4 = "三密はしっかり回避！";
          text5 = "新型コロナウイルスの影響で営業形態が変更になっている場合があるから出発前にしっかり確認！";
          text6 = "天気予報もしっかり確認しよう";
        } else {
          text = "乗り継ぎ時間は余裕を持ってね♪";
          text2 = "体調管理には気を付けてね";
          text3 = "お土産袋を持っていくと便利かも";
          text4 = "三密はしっかり回避！";
          text5 = "新型コロナウイルスの影響で営業形態が変更になっている場合があるから出発前にしっかり確認！";
          text6 = "天気予報もしっかり確認しよう";
        }
        // console.log(res_travel_show);
        return {
          res_travel_show,
          checkeditems,
          daylimit,
          text,
          text2,
          text3,
          text4,
          text5,
          text6,
        };
      } catch (err) {
        console.log("err", err);
      }

      // const daylimit =
    },
    components: {
      Modal
    },
    methods: {
      async deleteItem(res_travel_show) {
        // debugger
        console.log(res_travel_show);
        const res = confirm("本当に削除しますか？");
        let deleteres;
        if (res) {
          deleteres = await axios.delete(
            `/v1/travels/${res_travel_show.res_travel_show.data.id}`
          );
        } else {
          this.$router.push("/travelList");
        }
        // debugger
        if (deleteres.status == 200) {
          this.$router.push("/");
        }
      },
      openModal() {
        this.modalFlag = true;
      },
      hide() {
        this.$modal.hide("modal-content");
      },
      openModal() {
        this.modalFlag = true;
      },
      closeModal() {
        this.modalFlag = false;
      },
      travelitem() {
        this.items.push(this.item);
        this.item = "";
      },
      async itemsubmit() {
        const {
          data
        } = await axios.post("/v1/travelitems", {
          travelitems: this.checkeditems,
          travel: this.res_travel_show.data.id
        });
      },
      onChange(item) {
        const checkeditem = this.checkeditems.some(
          checkeditem => checkeditem === item
        ); //アロー関数
        if (checkeditem) {
          this.checkeditems = this.checkeditems.filter(n => n !== item);
          console.log(this.checkeditems);
        } else {
          this.checkeditems.push(item);
          console.log(this.checkeditems);
        }
      }
    },
    components: {
      Modal
    }
  };

</script>

<style lang="scss" scoped>
  .travelshow-card {
    margin-top: 80px;
  }

  .v-card {
    text-align: center;
  }

  .v-card-title {
    font-size: 60px;
  }

  .travelshow-title {
    color: #001858;
    font-size: 25px;
  }

  .ma-2 {
    // margin-top: 10px;
    box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.4);
  }

  .delete-btn {
    box-shadow: 2px 2px 2px 2px rgba(0, 0, 0, 0.4);
    margin-top: 20px;

    &:hover {
      transform: scale(1.04);
      transition-duration: 80ms;
    }
  }

  .v-btn {
    &:hover {
      transform: scale(1.04);
      transition-duration: 80ms;
    }
  }

  .remind-ms {
    color: #001858;
  }

  .list {
    background-color: #fef6e4;
  }

  .belonging-list {
    color: #001858;
  }

  .items {
    color: #001858;
  }

  .display {
    color: #001858;
    text-align: center;
    font-size: 30px;
  }
  .theme--dark.v-card > .v-card__text{
    color: #001858;
  }
  .info-img{
    text-align: center;

  }

</style>
