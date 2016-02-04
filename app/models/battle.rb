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
		if Wizard.find(self.opponent_wizard_id).strategy_id
			self.o_move=Strategy.find(Wizard.find(self.opponent_wizard_id).strategy_id).move()
		end
		if w_move && o_move
			self.status = 1
			self.winner = Wizard.find(self.wizard_id).battle(Wizard.find(self.opponent_wizard_id), self.w_move.to_i, self.o_move.to_i)
		elsif w_move
			puts "Waiting on opponent..."
		elsif o_move
			puts "Make your move!"
		else 
			puts "No moves have been selected!"
		end
	end

end
