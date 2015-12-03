require 'journey'
describe Journey do
  subject(:journey) { described_class.new }

  it 'responds to entry station' do
    expect(journey).to respond_to(:entry_station)
  end

  it 'resonds to exit station' do
    expect(journey).to respond_to(:exit_station)
  end

context 'entry station is set to Brixton' do
  before do
    journey.entry_station = 'Brixton'
  end
  it 'returns correct entry station' do
    expect(journey.entry_station).to eq 'Brixton'
  end
end

end
