class Oystercard
  attr_reader :money, :entry_station, :exit_station, :journeys
  LIMIT = 90.00
  MINIMUM_FARE = 1.00

  def initialize
    @money = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = Array.new
  end

  def top_up(amount)
    fail "The limit is 90" if money + amount > LIMIT
    @money += amount
  end

  def touch_in(station)
    fail "Below Minimum Balance!" if money < MINIMUM_FARE
    @entry_station = station

  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = exit_station
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @money -= amount
  end

end
