<template>
<div>

  {{ data }}

  {{ transport }}
</div>
</template>

<script>
// import axios from "axios"

// const url = "test/api/path"

export default {
  data() {
    return {
      data: "",
      transport: ""
    }
  },
    async asyncData() {
      const result = await axios.get("/v1/travels", { travel });
      return {
        transport: this.transport
      }
    },
  methods: {
    fetch() {
      this.transport = createTravel()
    }
  }
}
</script>

<style>
</style>