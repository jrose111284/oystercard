class Oystercard
	attr_reader :money

	DEFAULT_BALANCE = 0
	
	def initialize(money=DEFAULT_BALANCE)
		@money = money
	end
end