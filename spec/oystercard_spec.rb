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
  end

end
