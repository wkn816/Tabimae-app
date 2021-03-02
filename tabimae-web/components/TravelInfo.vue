<template>
<div>
<v-card color="#f3d2c1" class="travel-info">
          <v-card-title primary-title class="justify-center">
            <v-icon x-large color=#e53170>
              mdi-chevron-double-right
            </v-icon>
            <v-text class="travelinfo-title">出発前に知っておきたいこと</v-text>
            <v-icon x-large color=#e53170>
              mdi-chevron-double-left </v-icon>
          </v-card-title>
          <v-card-text color="#001858">
            <p>画像をクリックすると知っておきたい情報をチェックできます</p>
          </v-card-text>
          <v-row>
            <v-col class="info-img" cols="12" offset-sm="3" sm="4" offset-md="3" md="3" offset-lg="2" lg="2">
              <Train />
            </v-col>
            <v-col class="info-img" cols="12" offset-sm="3" sm="4" offset-md="3" md="3" offset-lg="2" lg="2">
              <Air />
            </v-col>
            <v-col class="info-img" cols="12" offset-sm="3" sm="4" offset-md="3" md="3" offset-lg="2" lg="3">
              <TravelEtiquette />
            </v-col>
            <v-col class="info-img" cols="12" offset-sm="3" sm="4" offset-md="3" md="3" offset-lg="1" lg="1">
              <HowTo />
            </v-col>
          </v-row>
        </v-card>
</div>
</template>

<script>
  import Home from "~/components/Home.vue";
  import Train from "~/components/Train.vue";
  import Air from "~/components/Air.vue";
  import TravelEtiquette from "~/components/TravelEtiquette.vue";
  import HowTo from "~/components/HowTo.vue";
  import About from "~/components/About.vue";
  import ButtonDefault from "~/components/ButtonDefault.vue";

  export default {
    components: {
      Home,
      ButtonDefault
    },

      openModal() {
        this.modalFlag = true;
      },

      closeModal() {
        this.modalFlag = false;
      }
    };

</script>


<style lang="scss">
$tab: 680px; // タブレット
$sp: 480px;  // スマホ
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

  p {
    color: #001858;
    text-align: center;
    font-family: 'TabimaeFont';
  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
    font-family: 'TabimaeFont';
  }

  .travelinfo-title {
    color: #001858;
    text-align: center;
    font-size: 35px;
    font-family: 'TabimaeFont';
    @include tab {
          font-size: 27px;
          }
    @include sp {
          font-size:18px;
          }
  }
  .info-img{
    text-align: center;
  }
  .travel-info{
    padding: 40px 0 60px 0;
  }

</style>
