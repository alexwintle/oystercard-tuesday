require 'oystercard'
require 'journey'
require 'station'

RSpec.describe Station do

  before(:each) do
    @station = Station.new("Waterloo", 1)
  end

  describe "#station_name" do
    it 'should return the name of the station' do
      expect(@station.station_name).to eq "Waterloo"
    end
  end

  describe "#zone" do
    it 'should return the zone the station is in' do
      expect(@station.zone).to eq 1
    end
  end

end
