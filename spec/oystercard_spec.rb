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
			expect{ subject.top_up 1 }.to change{ subject.money }.by 1
		end	
	end
end
