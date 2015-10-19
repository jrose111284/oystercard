require 'oystercard'

describe Oystercard do
	describe '#initialize' do
		it 'has a default of 0' do
			expect(subject.money).to eq(0)
		end
	end
end
