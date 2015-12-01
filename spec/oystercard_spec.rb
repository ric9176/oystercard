require 'oystercard'

describe Oystercard do

  subject(:card) {described_class.new}

  it 'should have a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'should increase the existing balance by an amount' do
        expect{ card.top_up(1) }.to change {card.balance}.by 1
    end

    it 'should raise an error if the amount exceeds the limit' do
      card.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{ card.top_up(1)}.to raise_error("card limit of #{Oystercard::MAXIMUM_BALANCE} exceeded")
    end
  end

end
