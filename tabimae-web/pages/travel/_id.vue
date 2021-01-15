<template>
  <v-card>
    <h1>詳細画面</h1>
    {{ `あと${daylimit}日で出発` }}
    {{ text }}
    {{ res_travel_show.data.name }}
    {{ res_travel_show.data.trains[0].departure_day }}
    {{ res_travel_show.data.trains[0].departure_place }}
    {{ res_travel_show.data.trains[0].arrival_place }}
    {{ res_travel_show.data.trains[0].departure_time }}
    {{ res_travel_show.data.trains[0].arrival_time }}
    <v-icon small @click="deleteItem({ res_travel_show })">削除</v-icon>

    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

      <div >
    <button class="help_link__button" @click="openModal">
      モーダルを開く
    </button>
    <Modal v-if="modalFlag">
      <div>モーダルの内容</div>
      <div>モーダルの内容</div>
      <div>モーダルの内容</div>
      <div>モーダルの内容</div>
      <div>モーダルの内容</div>
      <button @click="closeModal">閉じる</button>
    </Modal>
  </div>
  </v-card>

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
        modalFlag: false

      };
    },
    // console.log(array1[0]);
    // async asyncData({ params }) {
    //   // console.log(this.$store.state.auth.currentUser.id);
    //   // const user = this.$store.state.auth.currentUser;
    //   // debugger
    //   if (user) {
    //     //this.travelData = await axios.get("/v1/travels/${ travel.id }");
    //     // console.log(travel.id);
    //     this.travelData = await axios.get(
    //       `${process.env.BASE_URL}/travels/${params.id}`
    //     );
    //     console.log(this.travelData);
    //     //filterで作り直された配列がtravelNameに入る
    //     console.log(this.travelData);
    //   }
    // },
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
        }
        // debugger
        if (deleteres.status == 200) {
          this.$router.push("/travel_list");
        }
      },
      show() {
        this.$modal.show("modal-content");
      },
      hide() {
        this.$modal.hide("modal-content");
      }

    }
  };
</script>

<style>
  .ttt {
    color: black;
    background-color: blue;
  }
  .test{
    color: blue;
  }
</style>
