require 'oystercard'

describe Oystercard do
subject(:oyster) { described_class.new }


  it "Should have a default balance of zero" do
    expect(oyster.balance).to eq 0
  end

  it "should add the top up amount to the current balance" do
    oyster.top_up(30)
    expect(oyster.balance).to eq 30
  end


end
