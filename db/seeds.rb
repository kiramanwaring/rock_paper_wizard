# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "rockpaperscissorswizard@gmail.com", password: "qwerty")
User.create(email: "jimmy@internet.com", password: "qwerty")
User.create(email: "Michael@Manwaring.com", password: "qwerty")


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
# Dark Wizards
Wizard.create(name: "Dark Rock Wizard", magic_type: 0, strategy_id: 1, user_id: 1)
Wizard.create(name: "Dark Paper Wizard", magic_type: 0, strategy_id: 2, user_id: 1)
Wizard.create(name: "Dark Scissors Wizard", magic_type: 0, strategy_id: 3, user_id: 1)
Wizard.create(name: "Dark Rock of Paper Wizard", magic_type: 0, strategy_id: 4, user_id: 1)
Wizard.create(name: "Dark Paper of Scissors Wizard", magic_type: 0, strategy_id: 5, user_id: 1)
Wizard.create(name: "Dark Rock of Scissors Wizard", magic_type: 0, strategy_id: 6, user_id: 1)
Wizard.create(name: "Dark Balanced Wizard", magic_type: 0, strategy_id: 7, user_id: 1)
Wizard.create(name: "Dark Mostly Rock Wizard", magic_type: 0, strategy_id: 8, user_id: 1)
# Light Wizards
Wizard.create(name: "Light Scissors Wizard", magic_type: 1, strategy_id: 3, user_id: 1)
Wizard.create(name: "Light Wizard balanced", magic_type: 1, strategy_id: 7, user_id: 1)
Wizard.create(name: "Jimmy's Wiz", magic_type: 1, strategy_id: 7, user_id: 2)




Wizard.create(name: "Merlin", magic_type: 1, strategy_id:12, user_id: 1, lives: )
Wizard.create(name: "Harry Potter", magic_type: 1, strategy_id:7, user_id: 1)
Wizard.create(name: "Ron Weasley", magic_type: 1, strategy_id:1, user_id: 1)
Wizard.create(name: "Hermione Granger", magic_type: 1, strategy_id:9, user_id: 1)
Wizard.create(name: "Gandalf", magic_type: 1, strategy_id:15, user_id: 1)
Wizard.create(name: "Ice King", magic_type: 1, strategy_id:16, user_id: 1)
Wizard.create(name: "Sabrina, the teenage witch", magic_type: 1, strategy_id:14, user_id: 1)
Wizard.create(name: "Glenda, the good witch", magic_type: 1, strategy_id:10, user_id: 1)
Wizard.create(name: "Glenda, the good witch", magic_type: 1, strategy_id:10, user_id: 1)



# battles to populate the list in wizard show
Battle.create(wizard_id: 1, opponent_wizard_id: 2, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 3, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 4, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 3, o_move: 0, status: 0)
Battle.create(wizard_id: 1, opponent_wizard_id: 4, o_move: 0, status: 0)





puts "COMPLETE SEED"

