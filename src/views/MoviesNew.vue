<script>
import axios from "axios";

export default {
  data: function () {
    return {
      message: "Add New Movie",
      newMovie: {},
    };
  },
  created: function () {},
  methods: {
    createMovie() {
      console.log("Create Movie...");
      console.log(this.newMovie);
      axios
        .post("/movies/", this.newMovie)
        .then((response) => {
          console.log("Succes", response.data);
        })
        .catch((error) => console.log(error.response));
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
</template>

<style></style>
