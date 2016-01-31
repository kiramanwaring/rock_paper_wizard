# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Strategy.create(rock: 6, paper: 0, scissors: 0)
Strategy.create(rock: 0, paper: 6, scissors: 0)
Strategy.create(rock: 0, paper: 0, scissors: 6)

Strategy.create(rock: 3, paper: 3, scissors: 0)
Strategy.create(rock: 0, paper: 3, scissors: 3)
Strategy.create(rock: 3, paper: 0, scissors: 3)

Strategy.create(rock: 4, paper: 1, scissors: 1)
Strategy.create(rock: 1, paper: 4, scissors: 1)
Strategy.create(rock: 1, paper: 1, scissors: 4)

Strategy.create(rock: 2, paper: 2, scissors: 2)

Strategy.create(rock: 1, paper: 2, scissors: 3)
Strategy.create(rock: 2, paper: 1, scissors: 3)
Strategy.create(rock: 3, paper: 1, scissors: 2)
Strategy.create(rock: 1, paper: 3, scissors: 2)
Strategy.create(rock: 2, paper: 3, scissors: 1)
Strategy.create(rock: 3, paper: 2, scissors: 1)


