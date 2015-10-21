require_relative 'station'

class Journey
  attr_reader :entry_station, :exit_station, :history

  def initialize
    @entry_station = nil
    @exit_station = nil
    @history= []
  end

  def entry(station)
    @entry_station = station

  end

  def exit(exit_station)
    @exit_station = exit_station
    @history << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  def state?
    @entry_station != nil
  end
end