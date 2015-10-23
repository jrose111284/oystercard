require 'journey'
require 'journey_log'

describe JourneyLog do

  let(:journey) { double :journey }
  let(:incomplete_journey) { {entry_station: entry_station} }
  let(:entry_station) { double :sation }
  let(:journey_klass) { double :journey_klass, new: journey }
  subject(:journey_log) { described_class.new(journey_klass: journey_klass) }

  context '#journeys' do
    it {is_expected.to respond_to(:journeys) }
  end

  context '#initialize' do
    it 'begins with an empty journey list' do
      expect(journey_log.journeys).to be_empty
    end
  end

  context '#start_journey' do
    it { is_expected.to respond_to(:start_journey).with(1).argument }

    it 'returns the entry station when starting a journey' do
      allow(journey).to receive(:entry_station).and_return(entry_station)
      expect(journey_log.start_journey(entry_station)).to eq entry_station
    end
  end

end
