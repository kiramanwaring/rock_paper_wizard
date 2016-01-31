class Strategy < ActiveRecord::Base
	has_many :wizards
	# this method will allow the NPC's to make random plays based on their percentages of each move
	def move
		@move = rand(6)
		puts "NPC played:"
		if self.rock > 0 && @move < self.rock
			puts "ROCK"
			return 0
		elsif self.paper > 0 && @move < (self.rock + self.paper)
			puts "PAPER"
			return 1
		else
			puts "SCISSORS"
			return 2
		end
	end 
end
