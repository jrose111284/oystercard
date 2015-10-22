require_relative 'station'

class Journey

  def initialize
    @record = {}
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
  end

  def in_journey?
     @record[:entry_station] != nil
  end
end
