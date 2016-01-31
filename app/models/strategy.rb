class Strategy < ActiveRecord::Base
	# this method will allow the NPC's to make random plays based on their percentages of each move
	def move
		@move = rand(6)
		puts @move
		if self.rock > 0 && @move < self.rock
			puts "ROCK"
			return 1
		elsif self.paper > 0 && @move < (self.rock + self.paper)
			puts "PAPER"
			return 2
		else
			puts "SCISSORS"
			return 3
		end
	end 
end
