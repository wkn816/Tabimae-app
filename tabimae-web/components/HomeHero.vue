<template>
  <section class="home-hero">
    <v-container fluid fill-height class="home-hero__content">
      <v-row>
        <v-col cols="12" offset-sm="1" sm=11 offset-xs="1" xs="11" offset-md="1" md="11" offset-lg="1" lg="11" class="home-hero__content-text">
          <vue-typer text="タビマエ" :repeat="1"></vue-typer><br>
          <vue-typer :text="[
        '＊旅は行く前から始まっている',
        '＊旅が織りなす物語を',
        '＊[タビマエ]で管理して',
        '＊素敵な旅を創造しましょう',
        ]" erase-style="clear" :type-delay="100" :pre-type-delay="70" :erase-delay="300" :repeat="Infinity">
          </vue-typer>
        </v-col>

      </v-row>
    </v-container>
  </section>
</template>

<script>
  import {
    VueTyper
  } from 'vue-typer'


  export default {
    components: {
      VueTyper
    },
  }

</script>
<style lang="scss" scoped>
  .home-hero__content {
    background: url("../assets/img/top2.jpg");
    background-size: cover;
    object-fit: cover;
    width: 100%;
    height: 60vh;

    &-text {
      // text-align: center;
      // padding-left: 200px;
      font-size: 30px;
      font-weight: bold;
      font-family: 'ヒラギノ角ゴシック', 'Hiragino Sans',
        sans-serif;
    }
  }

  .test {
    font-size: 100px;
  }

</style>
<style>
  .vue-typer .custom.char {
    color: #001858;
  }

  .vue-typer .custom.caret {
    width: 5px;
    background-color: #001858;
  }

</style>
