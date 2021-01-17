<template>
  <section class="home-hero">
    <v-container fluid fill-height class="home-hero__content">
      <v-row>
        <v-col class="home-hero__content-text">
          <vue-typer text="タビマエ"></vue-typer>
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
  // background: url("../assets/img/ppf.jpg");
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 100vh;

  &-text {
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
  }
}

</style>