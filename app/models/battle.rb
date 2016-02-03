class Battle < ActiveRecord::Base
	has_many :wizards
	
	# def initialize(wizard, opponent_wizard)
	# 	puts "initialize battle"
	# 	@wizard_id=wizard.id
	# 	@opponent_wizard_id=opponent_wizard.id
	# 	if opponent_wizard.user_id == 0
	# 		o_move = Strategy.find(opponent.strategy_id).move()
	# 	end
	# end
	before_create :default_values
	def default_values
	  puts "battle status set"
	  self.status = 0
	end
	def fight
		if w_move && o_move
			@winner = Wizard.find(@wizard_id).battle(Wizard.find(@opponent_wizard_id), w_move, o_move)
			@status = 1
		elsif w_move
			puts "Waiting on opponent..."
		elsif o_move
			puts "Make your move!"
		else 
			puts "No moves have been selected!"
		end
	end

end
