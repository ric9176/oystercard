describe 'User Stories' do

  let(:oystercard) { Oystercard.new }
  let(:station) { Station.new('Aldgate', 2) }
  let(:fare) { Oystercard::MIN_FARE}

  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'creates an oystercard that can have a balance' do
    expect { oystercard.balance }.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'allows to add money to the card' do
    expect { oystercard.top_up(20) }.to change { oystercard.balance }.by(20)
  end

  # In order to protect my money
  # As a customer
  # I don't want to put too much money on my card
  it 'has a maximum balance' do
    balance = Oystercard::MAX_BALANCE
    over_90 = "the balance cannot be over #{balance} pounds"
    oystercard.top_up(balance)
    expect { oystercard.top_up(1) }.to raise_error over_90
  end

  # In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card

  it 'deduts appropriate fare from the oystercard' do
      oystercard.top_up(fare)
      oystercard.touch_in(station)
      expect { oystercard.touch_out(station) }.to change { oystercard.balance }.by(-fare)
    end
  #
  # In order to get through the barriers
  # As a customer
  # I need to touch in and out
  describe '#touch_in, #touch_out' do
    it 'allows customers to touch in' do
      oystercard.top_up(fare)
      oystercard.touch_in('brixton')
      expect(oystercard.station).to eq 'brixton'
    end
    it 'allows customers to touch out' do
      oystercard.touch_out(station)
      expect(oystercard.station).to eq nil
    end
  end
  #
  # In order to pay for my journey
  # As a customer
  # I need to have the minimum amount for a single journey
    it 'fails if there is not a min balance on the card' do
      less_than_1 = "cannot touch in if balance is less #{fare} pound"
      expect { oystercard.touch_in(station) }.to raise_error less_than_1
    end
  # In order to pay for my journey
  # As a customer
  # I need to pay for my journey when it's complete
    it 'charges for the journey on touch out' do
      oystercard.top_up(fare)
      oystercard.touch_in(station)
      expect { oystercard.touch_out(station) }.to change { oystercard.balance }.by(-fare)
    end

  #
  # In order to pay for my journey
  # As a customer
  # I need to know where I've travelled from
    it 'tells the customer where they have travelled from' do
      oystercard.top_up(fare)
      oystercard.touch_in(station)
      expect(oystercard.station).to eq station
    end

  # In order to know where I have been
  # As a customer
  # I want to see to all my previous trips

    it 'shows the history of journeys' do
      oystercard.top_up(fare)
      oystercard.touch_in(station)
      oystercard.touch_out(station)
      expect(oystercard.history[:journey1].exit_station).to eq station
    end
  #
  # In order to know how far I have travelled
  # As a customer
  # I want to know what zone a station is in
    it 'each station has a zone' do
      expect(station.zone).to eq 2
    end

  # In order to be charged correctly
  # As a customer
  # I need a penalty charge deducted if I fail to touch in or out

    it 'applies a penalty_fare if card is not touchin or out' do
      expect { oystercard.touch_out('brixton') }.to change { oystercard.balance }.by(-6)
    end

      #
  # In order to be charged the correct amount
  # As a customer
  # I need to have the correct fare calculated
end
