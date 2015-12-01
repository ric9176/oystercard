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

end
