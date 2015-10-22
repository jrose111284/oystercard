require_relative 'journey'

class Oystercard
  attr_reader :money
  LIMIT = 90.00
  MINIMUM_BALANCE = 1

  def initialize(money=0)
    @money = money
    @journey = nil
    @history = []
    @incomplete_journey = nil
  end

  def history
    @history.dup
  end

  def top_up(amount)
    fail "The limit is 90" if money + amount > LIMIT
    @money += amount
  end

  def touch_in(station)
    fail "Below Minimum Balance!" if money < MINIMUM_BALANCE
    deduct if !(@journey.nil?)
    @journey ||= Journey.new
    @journey.entry(station)
    record = @journey.record
    @history << record
    @incomplete_journey = record
  end

  def touch_out(exit_station)
    @journey ||= Journey.new
    @journey.exit(exit_station)
    @history.reject! { |journey| journey.object_id == @incomplete_journey.object_id }
    @history << @journey.record
    deduct
    @journey = nil
    @incomplete_journey = nil
  end

  private

  def deduct
    @money -= @journey.fare
  end

end