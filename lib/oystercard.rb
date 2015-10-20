class Oystercard
  attr_reader :money, :in_journey
  LIMIT = 90.00
  MINIMUM = 1.00

  def initialize
    @money = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "The limit is 90" if money + amount > LIMIT
    @money += amount
  end

  def deduct(amount)
    @money -= amount
  end

  def touch_in
  	fail "Below Minimum Balance!" if money < MINIMUM
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
