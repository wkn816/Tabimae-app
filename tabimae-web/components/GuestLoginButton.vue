<template>
  <div class="button-default">
    <slot />
    <p>
      <slot name="label" />
    </p>
  </div>
</template>

<script>
export default {

};
</script>

<style lang="scss">
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

  > p {
    margin-top: 20px;
    font-family: "Noto Sans CJK JP";
    font-size: 20px;
    letter-spacing: 0.1em;
  }
}
</style>
