require_relative 'station'

class Journey
  attr_reader :fare

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @record = {}
    @fare = PENALTY_FARE
  end

  def record
    @record.dup
  end

  def entry_station
    @record[:entry_station]
  end

  def exit_station
    @record[:exit_station]
  end

  def entry(entry_station)
    @record[:entry_station] = entry_station
  end

  def exit(exit_station)
    @record[:exit_station] = exit_station
    @fare = MIN_FARE if complete?
  end

  def in_journey?
     @record[:entry_station] != nil
  end

  def complete?
    (@record.has_key? :entry_station) && (@record.has_key? :exit_station) && (!@record.has_value?(nil))
  end
end
