<template>
  <div>
    <NewTravel />
    <TravelList />
  </div>
</template>

<script>
import NewTravel from "@/components/NewTravel";
import TravelList from "@/components/TravelList";

export default {
  components: {
    NewTravel,
    TravelList,
  },
  data() {
    return {
      todos: [],
    };
  },
};
</script>

<style>
</style>