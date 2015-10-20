class Oystercard
	attr_reader :money, :in_journey
	LIMIT = 91

	def initialize
		@money = 0
	end

	def top_up(amount)
		fail "The limit is 90" if money + amount >= LIMIT
		@money += amount
	end

	def deduct(amount)
		@money -= amount
	end

	def touch_in
		@in_journey = false
	end
end