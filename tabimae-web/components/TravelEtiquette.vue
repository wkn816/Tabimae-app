<template>
  <div>
    <v-dialog v-model="dialog" scrollable max-width="500px" max-height="900">
      <template v-slot:activator="{ on, attrs }">
        <img :src="image_src" v-bind="attrs" v-on="on" class="new_travel_info-img">
      </template>
      <v-badge>
        <v-card>
          <v-divider></v-divider>

          <img src="../assets/img/new_travel_style.png" height="670" width="500" alt="サンプル画像" class="test">
          <v-divider></v-divider>

          <v-btn color="blue darken-1" text @click="dialog = false">
            <v-icon>
              mdi-close-circle-outline
            </v-icon>
          </v-btn>
        </v-card>
      </v-badge>
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
        image_src: require("../assets/img/travel_e.JPG"),
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
  $tab: 680px; // タブレット
  $sp: 480px; // スマホ

  @mixin tab {
    @media (max-width: ($tab)) {
      @content;
    }
  }

  @mixin sp {
    @media (max-width: ($sp)) {
      @content;
    }
  }

  .new_travel_info-img {
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

  }

  .v-card {
    text-align: center;
  }

  .test {
    @include sp {
      width: 250px;
      height: 400px;
    }

    @include tab {
      width: 300px;
      height: 500px;
    }
  }

</style>
