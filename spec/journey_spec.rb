require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  it 'responds to entry' do
    expect(journey).to respond_to(:entry_station)
  end

  it 'responds to exit' do
    expect(journey).to respond_to(:exit_station)
  end

  it 'returns the entry station' do
    expect(journey.entry_station).to eq nil
  end

  it 'returns the exit station' do
    expect(journey.exit_station).to eq nil
  end

  context 'entry station has been set to brixton' do
    before do
      journey.entry_station = 'brixton'
    end

    it 'set entry station' do
      expect(journey.entry_station).to eq 'brixton'
    end
  end



  

end
