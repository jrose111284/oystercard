require 'journey'

describe Journey do
  #station = Station.new("waterloo",2)
  let(:station) {double :station}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey) {{entry_station: entry_station, exit_station: exit_station}}


  describe '#entry_station' do
    it { is_expected.to respond_to(:entry_station) }

    it 'a new journey has entry station' do
      expect(subject.entry_station).to be nil
    end
  end

  describe '#exit_station' do
    it { is_expected.to respond_to(:exit_station) }

    it 'a new card has no exit station' do
      expect(subject.exit_station).to be nil
    end
  end

  describe '#entry' do
    it {is_expected.to respond_to(:entry)}

    it 'stores the station when touching in' do
      subject.entry(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#exit' do
    it {is_expected.to respond_to(:exit)}
    it 'resets the station info after touching out' do
      expect(subject.entry_station).to be nil
    end

    it 'stores the exit station when touching out' do
      subject.exit(exit_station)
      expect(subject.exit_station).to be exit_station
    end
  end

  describe '#in_journey?' do
    it {is_expected.to respond_to(:in_journey?) }
    it 'a new journey is not a journey' do
      expect(subject.in_journey?).to be false
    end
  end
end
