require_relative 'journey'
require_relative 'station'

class Oystercard
  attr_reader :money, :entry_station, :exit_station, :journey
  LIMIT = 90.00
  MINIMUM_FARE = 1.00

  def initialize(journey: Journey.new)
    @money = 0
    @entry_station = nil
    @exit_station = nil
    @journey = journey
  end

  def top_up(amount)
    fail "The limit is 90" if money + amount > LIMIT
    @money += amount
  end

  def touch_in(station)
    fail "Below Minimum Balance!" if money < MINIMUM_FARE
    journey.entry(station)

  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    journey.exit(exit_station)
  end



  private

  def deduct(amount)
    @money -= amount
  end

end
