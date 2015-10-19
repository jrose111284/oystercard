class Oystercard
	attr_reader :money
	
	def initialize
		@money = 0
	end

	def top_up(amount)
		@money += amount
	end
end