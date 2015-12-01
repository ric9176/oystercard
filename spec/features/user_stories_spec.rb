describe "user stories" do

 # In order to use public transport
 # As a customer
 # I want money on my card
 it "So that I can use public transport, I need money on card" do
   oyster = Oystercard.new
   expect {oyster.balance}.not_to raise_error
 end

 # In order to keep using public transport
 # As a customer
 # I want to add money to my card
 it "So that I can keep using public transport, I need to be able to top up" do
   oyster = Oystercard.new
   expect {oyster.top_up(10)}.not_to raise_error
 end

 # In order to protect my money from theft or loss
 # As a customer
 # I want a maximum limit (of £90) on my card

 it 'So that I don\'t exceed my spending limit, I want a maximum on my card' do
   oyster = Oystercard.new
   oyster.top_up(90)
   expect {oyster.top_up(1)}.to raise_error
 end

  #  In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card
  it 'So that user can pay for the journey, card needs to deduct fare from the card' do
    oyster = Oystercard.new
    oyster.top_up(20)
    expect {oyster.deduct(5)}.not_to raise_error
  end

  # In order to get through the barriers.
  # As a customer
  # I need to touch in and out.
  it 'should know if it is currently been used in a journey or not' do
    oyster = Oystercard.new
    expect {oyster.in_journey?}.not_to raise_error
  end
  #   In order to pay for my journey
  # As a customer
  # I need to have the minimum amount (£1) for a single journey.
  it 'So that user can pay for the journey, should prevent user to touch in when balance is low' do
    oyster = Oystercard.new
    expect {oyster.touch_in}.to raise_error
  end

  #   In order to pay for my journey
  # As a customer
  # When my journey is complete, I need the correct amount deducted from my card
  it 'So that user can pay for the journey, the correct amount should be deducted on touch out' do
    oyster = Oystercard.new
    oyster.top_up(5)
    expect {oyster.touch_out}.to_not raise_error
  end

end