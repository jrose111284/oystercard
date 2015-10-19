class Oystercard
	attr_reader :money
	LIMIT = 91

	def initialize
		@money = 0
	end

	def top_up(amount)
		fail "The limit is 90" if money + amount > 90
		@money += amount
	end
end