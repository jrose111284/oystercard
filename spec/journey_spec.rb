require 'journey'

describe Journey do
  #station = Station.new("waterloo",2)
  let(:station) {double :station}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey) {{entry_station: entry_station, exit_station: exit_station}}


  describe '#entry_station' do
    it {is_expected.to respond_to(:entry)}

     it 'a new card has no station' do
      expect(subject.entry_station).to be nil
    end

    it 'stores the station when touching in' do
      subject.entry(station)
      expect(subject.entry_station).to eq station
    end

  end

  describe '#exit_station' do

    it {is_expected.to respond_to(:exit)}


    it 'resets the station info after touching out' do
      expect(subject.entry_station).to be nil
    end

    it 'stores the exit station when touching out' do
      subject.exit(exit_station)
      expect(subject.exit_station).to be exit_station
    end
  end

  it 'a new oystercard is not an journey' do
      expect(subject.state?).to be false
    end

  it {is_expected.to respond_to(:state?) }



  describe 'history' do
    it {is_expected.to respond_to(:history)}

    it 'a new oystercard has an empty journey log' do
      expect(subject.history).to be_empty
    end
    it 'records a journey after touching in and touching out' do
      subject.entry(entry_station)
      subject.exit(exit_station)
      expect(subject.history).to include journey
    end
  end
end