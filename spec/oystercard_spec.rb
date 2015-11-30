require 'oystercard'

describe Oystercard do



  it "Should have a default balance of zero" do
    oyster = Oystercard.new
    expect(oyster.balance).to eq 0
  end


end
