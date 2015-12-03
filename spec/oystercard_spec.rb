require 'oystercard'

describe Oystercard do

  subject(:card) {described_class.new}
  let(:station) { double :station }
  let(:entry_station) { double :station1 }
  let(:exit_station) { double :station2 }
  # let(:journey) {{double entry: entry_station, exit: exit_station }}

  it 'should have a balance of 0' do
    expect(card.balance).to eq 0
  end

  it 'should increase the existing balance by an amount' do
      expect{ card.top_up(1) }.to change {card.balance}.by 1
  end

  it 'should raise an error when user tries to touch in if balance is lower than 1' do
    expect {card.touch_in(station)}.to raise_error "Your balance is too low. Please top up!"
  end

  context 'while it has a working balance' do

    before do
      card.top_up(Oystercard::MAXIMUM_BALANCE)
    end


    describe '#top_up' do

    it 'should raise an error if the amount exceeds the limit' do
      amount = 5
      expect{ card.top_up(amount)}.to raise_error("card limit of #{Oystercard::MAXIMUM_BALANCE} exceeded")
    end

    end

    describe '#deduct' do

    it 'should return the updated balance when money is deducted' do
      amount = 5
      expect(card.deduct(amount)).to eq Oystercard::MAXIMUM_BALANCE - amount
    end

    end

    describe '#balance' do

    it 'should, on touch out, update the balance deducting the journey fare' do
      card.touch_in(station)
      card.touch_out(station)
      expect(card.balance).to eq Oystercard::MAXIMUM_BALANCE - Oystercard::MINIMUM_FARE
    end

    end

    describe '#journey' do

    it 'should, on touch out, reset the entry station to nil' do
      card.touch_in(station)
      card.touch_out(station)
      expect(card.journey.current_journey[:entry_station]).to eq nil
    end

    end

    describe '#history' do

    it 'should be empty by deafault' do
      expect(card.history).to be_empty
    end

    it 'stores a journey' do
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.history).to_not be_empty
    end

    it 'should return a history of journey1' do
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.history).to eq({:journey1=>{:entry_station=>entry_station, :exit_station=>exit_station}})
    end

    end

  end


end
