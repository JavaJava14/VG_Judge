# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


action = Genre.create(name: "Action")
adventure = Genre.create(name: "Adventure")
puzzle = Genre.create(name: "Puzzle")
roleplay = Genre.create(name: "Role-play")
simulation = Genre.create(name: "Simulation")
sports = Genre.create(name: "Sports")
