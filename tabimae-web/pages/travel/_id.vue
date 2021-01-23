<template>
  <div>
    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="12">
          <v-card color=#f3d2c1>
            <v-card-title primary-title class=“justify-center”>
              <v-icon large color=##001858>
                mdi-bag-checked
              </v-icon>
              <span class=“title”>旅行詳細</span>
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container>
      <v-row>
        <v-col cols="12" sm="11" md="11" lg="3">
          <v-card color=#001858>
            <v-card-title primary-title class=“justify-center”>
              <v-icon large color=##001858>
                mdi-bag-checked
              </v-icon>
              <span class=“title”></span>
            </v-card-title>
            <v-btn class="help_link__button" @click="openModal" style="background-color:#f3d2c1">
              忘れ物リスト
            </v-btn>
    {{ text }}
            <Modal v-if="modalFlag">
              <ul>
                <li v-for="item in items" :key="item">
                  <v-checkbox v-model="selected" :label="item" :value="item"></v-checkbox>
                </li>
              </ul>
              <button @click="closeModal">閉じる</button>
            </Modal>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    {{ `あと${daylimit}日で出発` }}
    {{ res_travel_show.data.name }}
    {{ res_travel_show.data.trains[0].departure_day }}
    {{ res_travel_show.data.trains[0].departure_place }}
    {{ res_travel_show.data.trains[0].arrival_place }}
    {{ res_travel_show.data.trains[0].departure_time }}
    {{ res_travel_show.data.trains[0].arrival_time }}
    <v-icon small @click="deleteItem({ res_travel_show })">削除</v-icon>

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  </div>
</template>

<script>
  import axios from "@/plugins/axios";
  import moment from "moment";
  import Vue from 'vue'
  import VModal from 'vue-js-modal'
  import Modal from '~/components/Modal.vue'


  Vue.use(VModal)

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
        items: ["運転免許証", "保険証", "クレジットカード", "切符類", "モバイルバッテリー", "マスク", "アルコール消毒液", "常備薬"],
        main: "main",
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
        // // debugger
        const daylimit = departure_day.diff(moment(), "days"); // 91
        let text;
        if (daylimit > 10) {
          text = "ゆっくりでOK";
        } else if (daylimit > 2 && daylimit < 10) {
          text = "そろそろ";
        } else if (daylimit == 1) {
          text = "寝坊しないように";
        } else if (daylimit == 0) {
          text = "当日";
        } else {
          text = "おわた";
        }
        // console.log(res_travel_show);
        return {
          res_travel_show,
          daylimit,
          text
        };
      } catch (err) {
        console.log("err", err);
      }
      // const daylimit =
    },
    components: {
      Modal,
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
        }
        // debugger
        if (deleteres.status == 200) {
          this.$router.push("/travel_list");
        }
      },
      openModal() {
        this.modalFlag = true
      },
      hide() {
        this.$modal.hide("modal-content");
      },
      openModal() {
        this.modalFlag = true
      },
      closeModal() {
        this.modalFlag = false

      }


    },
    components: {
      Modal
    },
  };

</script>

<style>
  ul {
    list-style: none;
  }
  .help_link__button{
    font-weight: bolder;
    border: solid 5px #f582ae;
    /*線*/
    border-radius: 10px;
    /*角の丸み*/
    text-decoration: none;
    display: flex;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
    box-shadow: 4px 4px #f582ae;
  }

</style>
