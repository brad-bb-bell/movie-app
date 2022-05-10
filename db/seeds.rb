# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
actor = Actor.new({ first_name: "Benedict", last_name: "Cumberbatch", known_for: "Sherlock" })
actor.save
Movie.create(title: "Top Gun", year: 1992, plot: "Maverick and Goose fly American fighter planes and (*spoiler alert*) Goose dies")

# {
#   "id": 1,
#   "title": "Avengers: Endgame",
#   "year": 2019,
#   "plot": "Thanos tries to get all the infinity stones so he can snap his fingers",
#   "created_at": "2022-05-06T14:33:39.684Z",
#   "updated_at": "2022-05-06T14:33:39.684Z"
# },
# {
#   "id": 2,
#   "title": "Encanto",
#   "year": 2021,
#   "plot": "We don't talk about Bruno no no",
#   "created_at": "2022-05-06T14:34:33.180Z",
#   "updated_at": "2022-05-06T14:34:33.180Z"
# },
# {
#   "id": 3,
#   "title": "The Dawn Wall",
#   "year": 2018,
#   "plot": "Tommy Caldwell climbs the impossible Dawn Wall on El Cap in Yosemite National Park",
#   "created_at": "2022-05-06T14:35:37.173Z",
#   "updated_at": "2022-05-06T14:35:37.173Z"
# },
