<template>
  <section class="home-hero">
    <v-container fluid fill-height class="home-hero__content">
      <v-row>
        <v-col class="home-hero__content-text">
          <vue-typer text="タビマエ" :repeat="1"></vue-typer></br>

<vue-typer style="font-family: dot; text-align:center;" :text="[
        '＊出発前に抜かりのない準備と',
        '＊お役立ち情報をGETして',
        '＊いつもよりワンランク上の',
        '旅行をたのしみましょう！',
        ]" erase-style="clear" :type-delay="150" :pre-type-delay="90"	:erase-delay="300" :repeat="Infinity"></vue-typer>
      </v-col>
      </v-row>
    </v-container>
  </section>
</template>

<script>
import { VueTyper } from 'vue-typer'


export default {
components: {
    VueTyper
  },
}
</script>
<style  lang="scss" scoped>
.home-hero__content {
  background: url("../assets/img/top2.jpg");
  background-size: cover;
  background-position: center center;
  object-fit: cover;
  width: 100%;
  height: 60vh;

  &-text {
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
  }
}

</style>