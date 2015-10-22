require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:history_with_1_complete) {[{ entry_station: entry_station, exit_station: exit_station }]}
  let(:incomplete_journey) {{ entry_station: entry_station }}
  let(:journey) {{ entry_station: entry_station, exit_station: exit_station }}

  describe '#initialize' do
    it 'has a default of 0' do
      expect(subject.money).to eq(0)
    end
  end

  describe '#history' do
    it 'has a history' do
      expect(subject.history).to be_empty
    end
  end

  describe '#top_up' do
    it {is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1.00 }.to change{ subject.money }.by 1.00
    end

    it 'limit is 90' do
      subject.top_up(described_class::LIMIT)
      expect{subject.top_up(1.00)}.to raise_error("The limit is 90")
    end
  end

  describe '#touch_in' do

    it {is_expected.to respond_to(:touch_in).with(1).argument}

    it 'raises an error when touching in with a balance lower than minimum' do
      subject.top_up(0.99)
      expect { subject.touch_in(entry_station) }.to raise_error "Below Minimum Balance!"
    end

    it 'charges a penalty fare when touch in twice' do
      subject.top_up(10.00)
      subject.touch_in(entry_station)
      expect {subject.touch_in(entry_station)}.to change{subject.money}.by -(Journey::PENALTY_FARE)
    end

    it 'records the start of a journey in a history after touching in' do |variable|
      subject.top_up(10.00)
      subject.touch_in(entry_station)
      expect(subject.history).to include incomplete_journey
    end

  end
  describe '#touch_out' do
    before(:each) do
      subject.top_up(1.00)
      subject.touch_in(entry_station)
    end

    it { is_expected.to respond_to(:touch_out).with(1).argument}

    it 'update touch_out method to reduce the balance by minimum fare' do
      expect {subject.touch_out(exit_station)}.to change{subject.money}.by -(Journey::MIN_FARE)
    end

    it 'charges a penalty fare when touch out twice' do
      subject.touch_out(exit_station)
      expect {subject.touch_out(exit_station)}.to change{subject.money}.by -(Journey::PENALTY_FARE)
    end

    it 'records a complete journey' do
      subject.touch_out(exit_station)
      expect(subject.history).to include journey
    end

    it 'only has the comlete journey in the history' do
      subject.touch_out(exit_station)
      expect(subject.history.count).to eq 1
    end

    it 'records a complete journey' do
      subject.touch_out(exit_station)
      expect(subject.history).to eq history_with_1_complete
    end

    it 'records an incomplete and complete journey in the history when user forget to touch out' do
      subject.top_up(10.00)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.history.count).to eq 2
    end
  end
end