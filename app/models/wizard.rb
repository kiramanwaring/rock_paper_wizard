class Wizard < ActiveRecord::Base
	belongs_to :user
	belongs_to :strategy

	before_create :default_values
	def default_values
	  puts "Setting up new wizard"
	  self.level = 1
	  self.exp = 0
	  self.lives = 3
	  self.hp = 6
	  self.attack = 1 + rand(2)
	  self.defense = 3 - self.attack
	end
	def battle(opponent, player_move)
		# determine the oponents move
		opponent_move = Strategy.find(opponent.strategy_id).move()
		# determine the battle type
		matchup = self.magic_type - opponent.magic_type

		# stuff to make type differences work
		if matchup == 1
			puts "light attacking"
			if player_move == 0
				player_move = 2
			elsif player_move == 2
				player_move = 0
			end	
		elsif matchup == -1
			puts "dark attacking"
			 if opponent_move == 0
				opponent_move = 2
			elsif opponent_move == 2
				opponent_move = 0
			end
		else
			puts "same types"	
		end
		if player_move > opponent_move || player_move == (opponent_move-2)
			outcome = "You won!"
			self.exp_increment(opponent)
			opponent.hp_decriment(self)
		elsif player_move == opponent_move
			outcome = "Draw!"
		else
			outcome = "You lost!"
			self.hp_decriment(opponent)
		end
		# self.save!	
		puts outcome
		return outcome
	end
	# a function that will be called during the battle which decreases the hp of the user
	def hp_decriment(opponent)
		hp_will_change!
		puts "damage taken!"
		self.hp -= 1 
		# self.hp -= (1 + opponent.attack/self.defense)
		if self.hp <=0 
			puts "You died!"
			self.lives_decriment()
		end
		self.save!
	end
	# a function that will be called by hp_decriment which decreases the lives count of the user and destroys the wizard upon game over
	def lives_decriment
		lives_will_change!
		self.lives -= 1 
		self.hp = self.level+5
		self.save!
		if self.lives <=0 
			puts "Game Over!"
			self.destroy()
		end
	end
	# this function will be called after winning a battle to increment experience points and then level
	def exp_increment(opponent)
		exp_will_change!
		self.exp += (1+opponent.level/self.level)
		self.level_increment()
		self.save!
	end
	def level_increment
		lives_will_change!
		if self.exp >= self.level
			self.exp -= self.level
			self.level += 1
			self.hp += (self.level+5)/2
			self.level_increment()
			self.save!
		end
	end
end
