<template>
  <section class="home-hero">
    <v-container fluid fill-height class="home-hero__content">
      <v-row>
        <v-col class="home-hero__content-text">
          <p>Welcome to my website.</p>
          <p>I'm a enginner.</p>
        </v-col>
      </v-row>
    </v-container>
  </section>
</template>
<style  lang="scss" scoped>
.home-hero__content {
  // background: url("../assets/img/ppf.jpg");
  // background-size: cover;
  // background-position: center center;
  // width: 100%;
  // height: 50vh;

  &-text {
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
  }
}
.home-hero{
  background: url("../assets/img/ppf.jpg");
  background-size: cover;
  background-position: center center;
  width: 100%;
  height: 50vh;
}
</style>