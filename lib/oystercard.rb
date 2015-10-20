class Oystercard
  attr_reader :money, :in_journey
  LIMIT = 90.00
  MINIMUM_FARE = 1.00

  def initialize
    @money = 0
    @station = nil
  end

  def top_up(amount)
    fail "The limit is 90" if money + amount > LIMIT
    @money += amount
  end

  def touch_in(station)
    fail "Below Minimum Balance!" if money < MINIMUM_FARE
    @station = station
    @in_journey = true

  end

  def touch_out
    deduct(MINIMUM_FARE)
    @station = nil
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def station
    @station
  end


  private

  def deduct(amount)
    @money -= amount
  end

end
