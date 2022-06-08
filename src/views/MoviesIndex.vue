<script>
import axios from "axios";

export default {
  data: function () {
    return {
      message: "Welcome to BB's Movies app",
      movies: [],
      id: "",
    };
  },
  created: function () {
    this.indexMovies();
  },
  methods: {
    indexMovies() {
      axios.get("http://localhost:3000/movies.json").then((response) => {
        this.movies = response.data;
        console.log(response.data);
      });
    },
    viewMovie: function (id) {
      this.$router.push("/movies/" + id);
    },
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
  </div>
  <div v-for="movie in movies" v-bind:key="movie.id">
    <h3>{{ movie.title }}</h3>
    <p>{{ movie.year }}</p>
    <p>{{ movie.plot }}</p>
    <button v-on:click="viewMovie(movie.id)">View/Edit</button>
  </div>
</template>

<style></style>
