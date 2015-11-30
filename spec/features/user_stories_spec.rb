
describe "user stories" do

# In order to use public transport
# As a customer
# I want money on my card

  it "So that I can use public transport, I need money on card" do
    oyster = Oystercard.new
    expect {oyster.balance}.not_to raise_error
  end

end
