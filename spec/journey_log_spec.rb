require 'journey'
require 'journey_log'

describe JourneyLog do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { double :journey }
  let(:incomplete_journey) {{ entry_station: entry_station }}
  let(:journey_klass) { double :journey_klass, new: journey }
  let(:complete_journey) {{ entry_station: entry_station, exit_station: exit_station }}
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
      allow(journey).to receive(:entry).and_return(entry_station)
      allow(journey).to receive(:record).and_return(incomplete_journey)
      expect(journey_log.start_journey(entry_station)).to eq entry_station
    end

    it 'records a start of a journey in log after starting a journey' do
      journey_log.start_journey(entry_station)
      expect(journey_log.journeys).to include incomplete_journey
    end
  end

  context '#exit_journey' do
    it {is_expected.to respond_to(:exit_journey)}

    it 'returns the exit station when exiting a journey' do
      allow(journey).to receive(:exit).and_return(exit_station)
      expect(journey_log.exit_journey(exit_station)).to eq exit_station
    end
  end

  context '#outstanding_charges' do
    it {is_expected.to respond_to(:outstanding_charges)}

    it 'returns a fare when a journey is incomplete' do
      allow(journey).to receive(:entry).and_return(entry_station)
      journey_log.start_journey(entry_station)
      expect(journey_log.outstanding_charges).to eq Journey::PENALTY_FARE
    end
  end
end