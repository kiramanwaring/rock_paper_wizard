class Wizard < ActiveRecord::Base
	belongs_to :user
	belongs_to :strategy
	has_many :battles
	has_many :opponent_wizards, through: :battles
	# state machine for results
	OUTCOME=["Battle Not Fought", "You won!", "Draw!", "You lost!"]

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
	def battle(opponent, w_move, o_move)
		# determine the battle type
		matchup = self.magic_type - opponent.magic_type

		# stuff to make type differences work
		if matchup == 1
			puts "light attacking"
			if w_move == 0
				w_move = 2
			elsif w_move == 2
				w_move = 0
			end	
		elsif matchup == -1
			puts "dark attacking"
			 if o_move == 0
				o_move = 2
			elsif o_move == 2
				o_move = 0
			end
		else
			puts "same types"	
		end
		# acual battle decision mechanism
		if w_move == o_move + 1 || w_move == (o_move-2)
			outcome = 1
			self.exp_increment(opponent)
			opponent.hp_decriment(self)
		elsif w_move == o_move
			outcome = 2
		else
			outcome = 3
			self.hp_decriment(opponent)
			opponent.exp_increment(self)
		end
		# self.save!	
		puts OUTCOME[outcome]
		return outcome
	end
	# a function that will be called during the battle which decreases the hp of the user
	def hp_decriment(opponent)
		hp_will_change!
		puts "damage taken!"
		# self.hp -= 1 
		self.hp -= (1 + opponent.attack/self.defense)
		if self.hp <=0 
			puts "Fatality!"
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
			# restarts NPC's renders user-wizards unusable
			if self.user_id == 1
				self.default_values()
			else
				puts "Game Over for #{self.name}!"
				self.level = 0
			end
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
		level_will_change!
		if self.exp >= self.level
			self.exp -= self.level
			self.level += 1
			self.hp += (self.level+5-self.hp)/2
			self.attack += rand(1..2)
			self.defense += rand(1..2)
			self.level += rand(2)
			self.level_increment()
			self.save!
		end
	end
	def dark_or_light
		if magic_type == 0
			return "Dark Wizard"
		elsif magic_type == 1
			return "Light Wizard"
		else
			return "Invalid Wizard"
		end
	end		
end
