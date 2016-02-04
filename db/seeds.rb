# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "dungeonmaster@RPSW.com", password: "qwerty")


# these are the only strategies possible in RPSW, here they are sorted by style
# these strategies rely on using the same move every turn
Strategy.create(rock: 6, paper: 0, scissors: 0)
Strategy.create(rock: 0, paper: 6, scissors: 0)
Strategy.create(rock: 0, paper: 0, scissors: 6)
# these strategies split their moves between two options
Strategy.create(rock: 3, paper: 3, scissors: 0)
Strategy.create(rock: 0, paper: 3, scissors: 3)
Strategy.create(rock: 3, paper: 0, scissors: 3)
# this strategy uses all 3 moves equally
Strategy.create(rock: 2, paper: 2, scissors: 2)
# these strategies use all 3 moves, with a strong preference toward one
Strategy.create(rock: 4, paper: 1, scissors: 1)
Strategy.create(rock: 1, paper: 4, scissors: 1)
Strategy.create(rock: 1, paper: 1, scissors: 4)
# these strategies have a blend of three that is less biased
Strategy.create(rock: 1, paper: 2, scissors: 3)
Strategy.create(rock: 2, paper: 1, scissors: 3)
Strategy.create(rock: 3, paper: 1, scissors: 2)
Strategy.create(rock: 1, paper: 3, scissors: 2)
Strategy.create(rock: 2, paper: 3, scissors: 1)
Strategy.create(rock: 3, paper: 2, scissors: 1)


# these are example wizards for testing, they will eventually be the NPC library
Wizard.create(name: "Dark Rock Wizard", magic_type: 0, strategy_id: 1, user_id: 1)
Wizard.create(name: "Light Scissors Wizard", magic_type: 1, strategy_id: 2, user_id: 1)
Wizard.create(name: "Dark Wizard balanced", magic_type: 0, strategy_id: 7, user_id: 1)
Wizard.create(name: "Light Wizard balanced", magic_type: 1, strategy_id: 7, user_id: 1)

# battles to populate the list in wizard show
Battle.create(wizard_id: 1, opponent_wizard_id: 2, o_move: 0, status: 0)
Battle.create(wizard_id: 3, opponent_wizard_id: 2, o_move: 0, status: 0)
Battle.create(wizard_id: 2, opponent_wizard_id: 4, o_move: 0, status: 0)
Battle.create(wizard_id: 4, opponent_wizard_id: 3, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 3, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 4, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 3, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 4, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 2, o_move: 0, status: 0)





puts "COMPLETE SEED"

