<template>
  <nuxt-link v-bind="$attrs" class="button-default">
    <slot />
    <p>
      <slot name="label" />
    </p>
  </nuxt-link>
</template>

<script>
  export default {}

</script>

<style lang="scss" scoped>
  .button-default {
    cursor: pointer;
    display: block;
    text-align: center;
    // height: 150px;
    border-radius: 8px;
    border: 1px solid #dddddd;

    &:hover {
      transform: scale(1.04);
      transition-duration: 40ms;
    }

    >p {
      margin-top: 20px;
      font-family: 'Noto Sans CJK JP';
      font-size: 20px;
      letter-spacing: 0.1em;
    }
  }

</style>
