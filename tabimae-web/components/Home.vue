<template>
  <section class="home">
    <HomeHero/>
  </section>
</template>
<script>
import HomeHero from './HomeHero.vue'

export default {
  components: {
    HomeHero
  }
}
</script>
<style lang="scss" scoped>
.home {
  padding-bottom: 50px;
}
</style>