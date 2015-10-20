require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'has a default of 0' do
      expect(subject.money).to eq(0)
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

  describe '#deduct' do
    it {is_expected.to respond_to(:deduct).with(1).argument }

    it 'deduct money' do
      expect{subject.deduct 1.00 }.to change{ subject.money }.by -1.00
    end
  end

  describe '#touch_in' do
    it {is_expected.to respond_to (:in_journey?) }
    it {is_expected.to respond_to (:touch_in)}
    it 'a new oystercard is not an journey' do
      expect(subject.in_journey?).to be false
    end

    it 'changes the in journey status to true when touched in' do
      subject.touch_in
      expect(subject.in_journey?).to be true
    end
  end
  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out)}

    it 'changes the in journey status to false when touched out' do
      subject.touch_out
      expect(subject.in_journey?).to be false
    end
  end
end
