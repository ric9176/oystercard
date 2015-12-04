describe "user stories" do

  let(:oyster) { Oystercard.new }
  let(:station) { Station.new('Brixton', 2) }
  let(:max_balance) {Oystercard::MAXIMUM_BALANCE}
  let(:minimum_fare) {Oystercard::MINIMUM_FARE}


 it 'So that I can keep using public transport, I need to be able to top up' do
   expect {oyster.top_up(10)}.to change{oyster.balance}.by(10)
 end

 # In order to protect my money from theft or loss
 # As a customer
 # I want a maximum limit (of £90) on my card

 it 'So that I don\'t exceed my spending limit, I want a maximum on my card' do
   oyster.top_up(max_balance)
   expect {oyster.top_up(1)}.to raise_error
 end

  #  In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card
  it 'So that user can pay for the journey, card needs to deduct fare from the card' do
    oyster.top_up(20)
    expect {oyster.deduct(5)}.to change{oyster.balance}.by(-5)
  end

  # In order to get through the barriers.
  # As a customer
  # I need to touch in and out.

  #   In order to pay for my journey
  # As a customer
  # I need to have the minimum amount (£1) for a single journey.
  it 'raises an error when touching in and balance is too low' do
    expect {oyster.touch_in(station)}.to raise_error 'Your balance is too low. Please top up!'
  end

  #   In order to pay for my journey
  # As a customer
  # When my journey is complete, I need the correct amount deducted from my card
  it 'So that user can pay for the journey, the fare should be deducted on touch out' do
    oyster.top_up(5)
    expect {oyster.touch_out(station)}.to change{oyster.balance}.by(-minimum_fare)
  end

  # In order to pay for my journey
  # As a customer
  # I need to know where I've travelled from
  it 'so that I can pay the right fare, the card should record where I travelled from' do
    oyster.top_up(5)
    expect {oyster.touch_in(station)}.to_not raise_error
  end

  #   In order to know where I have been
  # As a customer
  # I want to see to all my previous trips
  it 'so that user can know where he has been, the card should store all previous trips' do

    expect {oyster.history}.not_to raise_error
  end
#   In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in
  it 'should display the zone' do
    expect(station.zone).to eq 2
  end

  context 'history' do
    it 'returns the history of all journeys taken' do
      oyster.top_up(10)
      oyster.touch_in('Brixton')
      oyster.touch_out('Aldgate')
      expect(oyster.history).to eq({:journey1=>{:entry_station=>"Brixton", :exit_station=>"Aldgate"}})
    end
    it 'returns the entry station' do
    oyster.top_up(10)
    oyster.touch_in('Brixton')
    expect(oyster.journey.current_journey[:entry_station]).to eq 'Brixton'
  end
  end
  # In order to be charged correctly
  # As a customer
  # I need a penalty charge deducted if I fail to touch in or out

end
