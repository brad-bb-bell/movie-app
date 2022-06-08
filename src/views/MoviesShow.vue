<script>
import axios from "axios";

export default {
  data: function () {
    return {
      movie: {},
    };
  },
  created: function () {
    axios.get("/movies/" + this.$route.params.id + ".json").then((response) => {
      this.movie = response.data;
      console.log(response.data);
    });
  },
  methods: {
    editMovie: function (id) {
      this.$router.push("/movies/" + id + "/edit");
    },
  },
};
</script>

<template>
  <div>
    <h1>{{ movie.title }}</h1>
    <p>{{ movie.year }}</p>
    <p>{{ movie.plot }}</p>
    <button v-on:click="editMovie(movie.id)">Edit/Delete</button>
  </div>
</template>

<style></style>
