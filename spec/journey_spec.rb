require 'oystercard'
require 'journey'
require 'station'


RSpec.describe Journey do

  before(:each) do
    @journey = Journey.new
    @oystercard = Oystercard.new(20)
    @waterloo_station = Station.new("Waterloo", 1)
  end

  describe "#journey_complete?" do
    it 'should return true if the journey if the card has been touched in and touched out' do
      @journey.touch_in("Waterloo")
      @journey.touch_out("Bank", 10)
      expect(@journey.journey_complete?).to eq true
    end
  end

  # describe "#fare" do
  #   it 'should give a penalty if the user does not touch_out or touch_in' do
  #
  #   end
  # end

  describe "#touch_in" do
    it 'should touch in to get through the barriers and set and call on_journey' do
      expect(@journey.touch_in("Waterloo")).to eq "On a journey?: true"
    end
  end

  describe "#touch_in & entry_station" do
    it 'should touch in to get through the barriers and set @on_journey to true' do
      @journey.touch_in("Waterloo")
      expect(@journey.entry_station).to eq "Waterloo"
    end
  end

  describe "#touch_out" do
    it 'should touch out to get through the barriers and set @on_journey to false' do
      expect(@journey.touch_out(10, "Bank")).to eq "On a journey?: false"
    end
  end

  describe "#touch_out" do
    it 'should touch out to get through the barriers and set @on_journey to false and deduct the fare from the balance' do
      @journey.touch_out(10, "Bank")
      expect(@oystercard.balance).to eq 20
    end
  end

  describe "#on_journey?" do
    it 'should return whether the customer is on a journey after touching-out' do
      @journey.touch_out(10, "Bank")
      expect(@journey.on_journey?).to eq "On a journey?: false"
    end
  end

  describe "#on_journey?" do
    it 'should return whether the customer is on a journey after touching-in' do
      @journey.touch_in("Waterloo")
      expect(@journey.on_journey?).to eq "On a journey?: true"
    end
  end

  describe "#on_journey? & initialize" do
    it 'should return whether the customer is on a journey when Oystercard class is initialized (should always return false)' do
      expect(@journey.on_journey?).to eq "On a journey?: false"
    end
  end

  describe "#touch_in and #touch_out" do
    it 'should check that touching in and out creates one journey' do
      @journey.touch_in("Waterloo")
      @journey.touch_out("Bank", 10)
      @oystercard.add_journeys(@journey.current_journey)
      expect(@oystercard.journey_history).to eq [{ "Entry Station: "=>"Waterloo", "Exit Station: "=>"Bank", "Fare: "=>10}]
    end
  end

  describe "#touch_in and #touch_out" do
    it 'should check that touching in and out creates one journey (using .length, instead of checking for a complete hash)' do
      @journey.touch_in("Waterloo")
      @journey.touch_out("Bank", 10)
      @journey.journey_formatter
      @oystercard.add_journeys(@journey.current_journey)
      expect(@oystercard.journey_history.length).to eq 1
    end
  end

  describe "#touch_in and #touch_out" do
    it 'should check that touching in and out creates one journey' do
      @journey.touch_in("Waterloo")
      @journey.touch_out("Bank", 10)
      @oystercard.add_journeys(@journey.current_journey)
      @journey.touch_in("Liverpool")
      @journey.touch_out("Euston", 10)
      @oystercard.add_journeys(@journey.current_journey)
      expect(@oystercard.journey_history).to eq [{"Entry Station: "=>"Waterloo", "Exit Station: "=>"Bank", "Fare: "=>10}, {"Entry Station: "=>"Liverpool", "Exit Station: "=>"Euston", "Fare: "=>10}]
    end
  end

end
