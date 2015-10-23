class JourneyLog
  NO_CHARGES = 0

  def initialize(journey_klass: journey_klass)
    @journey_klass = journey_klass
    @journeys = []
    @incomplete_journey = nil
  end

  def exit_journey(exit_station)
    current_journey.exit(exit_station)
    @journeys.reject! { |journey| journey.object_id == @incomplete_journey.object_id }
    @journeys << current_journey.record
    @incomplete_journey = nil
  end

  def start_journey(entry_station)
    current_journey.entry(entry_station)
    record = current_journey.record
    @journeys << record
    @incomplete_journey = record
  end

  def journeys
    @journeys.dup
  end

  def outstanding_charges
    if @incomplete_journey then
      @incomplete_journey.exit.fare
    else
      NO_CHARGES
    end
  end

  private
  def current_journey
    @incomplete_journey || @journey_klass.new
  end
end
