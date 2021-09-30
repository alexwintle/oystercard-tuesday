require 'oystercard'
require 'journey'
require 'station'


RSpec.describe Journey do

  before(:each) do
    @journey = Journey.new
    @oystercard = Oystercard.new(20)
    @waterloo_station = Station.new("Waterloo", 1)
  end

  describe "#complete?" do
    it 'should return true if the journey if the card has been touched in and touched out' do
      @journey.enter("Waterloo")
      @journey.exit("Bank", 10)
      expect(@journey.complete?).to eq true
    end
  end

  describe "#enter" do
    it 'should touch in to get through the barriers and set and set @complete to false' do
      expect(@journey.enter("Waterloo")).to eq false
    end
  end

  describe "#enter & #entry_station" do
    it 'should touch in to get through the barriers and set @on_journey to true' do
      @journey.enter("Waterloo")
      expect(@journey.entry_station).to eq "Waterloo"
    end
  end

  describe "#enter" do
    it 'should touch out to get through the barriers and set @on_journey to false' do
      expect(@journey.enter( "Bank")).to eq false
    end
  end

  describe "#exit" do
    it 'should touch out to get through the barriers and set @on_journey to false and deduct the fare from the balance' do
      @journey.enter("Africa")
      expect(@oystercard.balance).to eq 20
    end
  end

  describe "#complete" do
    it 'should return whether the customer is on a journey after exiting' do
      @journey.exit("Bank", 10)
      expect(@journey.complete?).to eq true
    end

    it 'should return whether the customer is on a journey after entering' do
      @journey.enter("Waterloo")
      expect(@journey.complete?).to eq false
    end

    it 'should return whether the customer is on a journey when Oystercard class is initialized (should always return false)' do
      expect(@journey).to eq @journey
    end
  end

  describe "#enter & #exit" do
    it 'should check that touching in and out creates one journey' do
      @journey.enter("Waterloo")
      @journey.exit("Bank", 10)
      @oystercard.add_journeys(@journey.current_journey)
      expect(@oystercard.journey_history).to eq [{ "Entry Station: "=>"Waterloo", "Exit Station: "=>"Bank", "Fare: "=>10}]
    end
  end

  describe "#enter & #exit" do
    it 'should check that touching in and out creates one journey (using .length, instead of checking for a complete hash)' do
      @journey.enter("Waterloo")
      @journey.exit("Bank")
      @journey.journey_formatter
      @oystercard.add_journeys(@journey.current_journey)
      expect(@oystercard.journey_history.length).to eq 1
    end
  end

  describe "#enter & #exit" do
    it 'should check that touching in and out creates one journey' do
      @journey.enter("Waterloo")
      @journey.exit("Bank", 10)
      @oystercard.add_journeys(@journey.current_journey)
      @journey.enter("Liverpool")
      @journey.exit("Euston", 10)
      @oystercard.add_journeys(@journey.current_journey)
      expect(@oystercard.journey_history).to eq [{"Entry Station: "=>"Waterloo", "Exit Station: "=>"Bank", "Fare: "=>10}, {"Entry Station: "=>"Liverpool", "Exit Station: "=>"Euston", "Fare: "=>10}]
    end
  end

end
