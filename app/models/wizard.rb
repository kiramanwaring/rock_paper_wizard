class Wizard < ActiveRecord::Base
	belongs_to :user
	belongs_to :strategy

	after_initialize :default_values
	def default_values
	  # self.user_id = current_user.id
	  self.level = 1
	  self.exp = 0
	  self.lives = 3
	  self.hp = 6
	  self.attack = 1 + rand(2)
	  self.defense = 3 - self.attack
	end
	def battle(opponent, player_move)
		opponent_move = Strategy.find(opponent.strategy_id).move()
		if player_move > opponent_move || player_move == (opponent_move-2)
			puts "You won!"
			self.exp_increment(opponent)
		elsif player_move == opponent_move
			puts "Draw!"
		else
			puts "You lost!"
			self.hp_decriment(opponent)
		end
		# stuff to make type differences work
		# matchup = self.magic_type - opponent.magic_type
		# if matchup = 0
		# elsif matchup == -1
		# 	player_move = 2 - player_move
		# elsif matchup == 1 
		# end
		self.save()
	end
	# a function that will be called during the battle which decreases the hp of the user
	def hp_decriment(opponent)
		self.hp -= (1+opponent.attack/self.defense)
		if self.hp <=0 
			puts "You died!"
			self.lives_decriment()
			self.save()
		end
	end
	# a function that will be called by hp_decriment which decreases the lives count of the user and destroys the wizard upon game over
	def lives_decriment
		self.lives -= 1 
		if self.lives <=0 
			puts "Game Over!"
			self.destroy()
		end
	end
	# this function will be called after winning a battle to increment experience points and then level
	def exp_increment(opponent)
		self.exp += (1+opponent.level/self.level)
		self.level_increment()
		self.save()
	end
	def level_increment
		if self.exp >= self.level
			self.exp -= self.level
			self.level += 1
			self.level_increment()
			self.save()
		end
	end
end
