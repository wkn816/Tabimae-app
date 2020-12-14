<template>
  <div v-if="user">
    <p>{{user.name}}</p> 
    <AddTodo @submit="addTodo" />
    <TodoList :todos="todos" />
  </div>
</template>

<script>
// import AddTodo from "@/components/AddTodo";
// import TodoList from "@/components/TodoList";

export default {
  components: {
    AddTodo,
    TodoList
  },
  computed: {  //<- 追加
    user() {
      return this.$store.state.auth.currentUser;
    }
  },
  data() {
    return {
      todos: []
    };
  },
  methods: {
    addTodo(title) {
      this.todos.push({
        title
      });
    }
  }
};
</script>

<style>
</style>