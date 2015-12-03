require 'station'

describe Station do

  subject(:station) { described_class.new('Brixton', 2) }

  it 'should have a name' do
    expect(station.name).to eq 'Brixton'
  end
  it 'should have a zone' do
    expect(station.zone).to eq 2
  end

end
