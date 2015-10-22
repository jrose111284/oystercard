class JourneyLog
  def initialize(journey_klass: journey_klass)
    @journey_klass = journey_klass
    @journeys = []
    @incomplete_journey
  end
  def exit_journey(exit_station)
    current_journey.exit(exit_station)
  end
  def start_journey(entry_station)
    current_journey.entry(entry_station)
  end
  def journeys
    @journeys.dup
  end
  private
  def current_journey
    @incomplete_journey || @journey_klass.new
  end
end
