<script>
import axios from "axios";

export default {
  data: function () {
    return {
      message: "Welcome to BB's Movies app",
      movies: [],
      newMovie: {},
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
    createMovie() {
      console.log("Create Movie...");
      var params = this.newMovie;
      axios
        .post("http://localhost:3000/movies.json", params)
        .then((response) => {
          console.log("Succes", response.data);
          this.movies.push(response.data);
        })
        .catch((error) => console.log(error.response));
      this.newMovie = "";
    },
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
  </div>
  <div>
    <h3>Add a movie to the database:</h3>
    <p>
      Title:
      <input type="text" v-model="newMovie.title" />
    </p>
    <p>
      Year:
      <input type="text" v-model="newMovie.year" />
    </p>
    <p>
      Plot:
      <input type="text" v-model="newMovie.plot" />
    </p>
    <p><button v-on:click="createMovie()">Add Movie</button></p>
  </div>
  <div v-for="movie in movies" v-bind:key="movie.id">
    <h3>{{ movie.title }}</h3>
    <p>{{ movie.year }}</p>
    <p>{{ movie.plot }}</p>
  </div>
</template>

<style></style>
