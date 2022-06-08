<script>
import axios from "axios";

export default {
  data: function () {
    return {
      message: "Edit Movie",
      editMovie: {},
    };
  },
  created: function () {
    axios.get("/movies/" + this.$route.params.id + ".json").then((response) => {
      this.editMovie = response.data;
      console.log(response.data);
    });
  },
  methods: {
    updateMovie() {
      console.log("Update Movie...");
      console.log(this.editMovie);
      axios
        .patch("/movies/" + this.$route.params.id + ".json", this.editMovie)
        .then((response) => {
          console.log("Succes", response.data);
        })
        .catch((error) => console.log(error.response));
    },
    destroyMovie: function () {
      console.log("Destroying movie...");
      axios.delete("/movies/" + this.editMovie.id + ".json").then((response) => {
        console.log("Success", response.data);
        this.$router.push("/movies");
      });
    },
  },
};
</script>

<template>
  <div class="home">
    <h1>{{ message }}</h1>
  </div>
  <div>
    Title:
    <input type="text" v-model="editMovie.title" />
    <p>
      Year:
      <input type="text" v-model="editMovie.year" />
    </p>
    <p>
      Plot:
      <input type="text" v-model="editMovie.plot" />
    </p>
    <p><button v-on:click="updateMovie()">Update</button></p>
    <p><button v-on:click="destroyMovie()">Delete</button></p>
  </div>
</template>

<style></style>
