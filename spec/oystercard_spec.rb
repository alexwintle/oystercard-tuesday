require 'oystercard'

RSpec.describe Oystercard do

  before(:each) do
    @my_oystercard_a = Oystercard.new(10)
    @my_oystercard_b = Oystercard.new(20)
  end

  describe "#initialize" do
    it 'checks that the Oystercard class exists' do
      expect(@my_oystercard_a.respond_to?(:oystercard))
    end
  end

  describe "#balance" do
    it 'checks that a new card has a balance' do
      expect(@my_oystercard_a.balance).to eq 10
    end
  end

  describe "#top_up" do
    it 'should add money to the balance, and take in the amount as an argument' do
      expect(@my_oystercard_a.top_up(20)).to eq 30
    end

    it 'should add money to the balance, and take in the amount as an argument' do
      expect(@my_oystercard_b.top_up(30)).to eq 50
    end

    it 'should raise an error when maximum balance is exceeded (in this case it is exceeded - return error)' do
      expect(@my_oystercard_b.top_up(71)).to eq "Cannot exceed maximum limit of £90"
    end
  end

  describe "#deduct" do
    it 'should deduct the fare from the card' do
      @my_oystercard_a.touch_in("Waterloo")
      expect(@my_oystercard_b.deduct(10)).to eq 10
    end
  end

  describe "#touch_in" do
    it 'should touch in to get through the barriers and set and call on_journey' do
      expect(@my_oystercard_a.touch_in("Waterloo")).to eq true
    end
  end

  describe "#touch_in" do
    it 'should touch in to get through the barriers and set @on_journey to true' do
      @my_oystercard_a.touch_in("Waterloo")
      expect(@my_oystercard_a.entry_station).to eq "Waterloo"
    end
  end

  # describe "#touch_in" do
  #   it 'should forget the station by inputting nil' do
  #     @my_oystercard_a.touch_in("Waterloo")
  #     @my_oystercard_a.touch_in("")
  #     expect(@my_oystercard_a.entry_station).to eq ""
  #   end
  # end

  describe "#touch_out" do
    it 'should touch out to get through the barriers and set @on_journey to false' do
      expect(@my_oystercard_a.touch_out(10, "Bank")).to eq false
    end
  end

  describe "#touch_out" do
    it 'should touch out to get through the barriers and set @on_journey to false and deduct the fare from the balance' do
      @my_oystercard_a.touch_out(10, "Bank")
      expect(@my_oystercard_a.balance).to eq 0
    end
  end

  describe "#on_journey?" do
    it 'should return whether the customer is on a journey after touching-out' do
      @my_oystercard_a.touch_out(10, "Bank")
      expect(@my_oystercard_a.on_journey?).to eq false
    end
  end

  describe "#on_journey?" do
    it 'should return whether the customer is on a journey after touching-in' do
      @my_oystercard_a.touch_in("Waterloo")
      expect(@my_oystercard_a.on_journey?).to eq true
    end
  end

  describe "#on_journey?" do
    it 'should return whether the customer is on a journey when Oystercard class is initialized (should always return false)' do
      expect(@my_oystercard_a.on_journey?).to eq false
    end
  end

  describe "#minimum_balance?" do
    it 'should return whether the customer has the minimum balance to make a journey (true in this case)' do
      expect(@my_oystercard_a.minimum_balance?).to eq true
    end
  end

  describe "#minimum_balance?" do
    it 'should return whether the customer has the minimum balance to make a journey (false in this case)' do
      @my_oystercard_b.deduct(20) #this oystercard now has a balance of £0
      expect(@my_oystercard_b.minimum_balance?).to eq false
    end
  end

  describe "#initialize" do
    it 'should check that the card has an empty list of journeys by default' do
      expect(@my_oystercard_a.journeys).to eq []
    end
  end

  describe "#touch_in and #touch_out" do
    it 'should check that touching in and out creates one journey' do
      @my_oystercard_a.touch_in("Waterloo")
      @my_oystercard_a.touch_out(10, "Bank")
      expect(@my_oystercard_a.journeys).to eq [{"Entry Station: "=>"Waterloo", "Exit Station: "=>"Bank", "Fare: "=>10}]
    end
  end

  describe "#touch_in and #touch_out" do
    it 'should check that touching in and out creates one journey (using .length, instead of checking for a complete hash)' do
      @my_oystercard_a.touch_in("Waterloo")
      @my_oystercard_a.touch_out(10, "Bank")
      expect(@my_oystercard_a.journeys.length).to eq 1
    end
  end

end
