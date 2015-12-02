require 'station'

describe Station do
  subject(:station) { described_class.new('brixton', 1) }
  it 'responds to name and returns station name' do
    expect(station.name).to eq 'brixton'
    end

  it 'responds to zone and returns station zone' do
    expect(station.zone).to eq 1
  end
end
