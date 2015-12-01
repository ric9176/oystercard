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

  describe '#deduct' do
    it 'should return the updated balance when money is deducted' do
      oyster = Oystercard.new
      oyster.top_up(20)
      expect(oyster.deduct(5)).to eq 15
    end

    it 'should raise error if the amount goes below 0' do
      oyster = Oystercard.new
      oyster.top_up(20)
      expect{oyster.deduct(25)}.to raise_error
    end
  end

end
