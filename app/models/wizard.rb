class Wizard < ActiveRecord::Base
	after_initialize :default_values
	def default_values
	  self.level = 1
	  self.exp = 0
	  self.lives = 3
	  self.hp = 5
	  self.attack = 1 + rand(3)
	  self.defense = 3 - self.attack
	end
	def Battle
		
	end
	def hp_decriment
	end
	def lives_decriment
		
	end
	def exp_increment
		
	end
	def level_increment
		
	end

end
