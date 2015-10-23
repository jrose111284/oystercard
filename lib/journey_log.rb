class JourneyLog

  def initialize(journey_klass: journey_klass)
     @journey_klass = journey_klass
     @journeys = []
     @incomplete_journey = nil
  end

  def journeys
    @journeys.dup
  end

  def start_journey(entry_station)
    @incomplete_journey = current_journey(entry_station)
    @current_journey(entry_station)
  end

  private

  def current_journey(entry_station)
    @incomplete_journey || @journey_klass.new
  end
end
