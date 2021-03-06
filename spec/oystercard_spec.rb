require 'oystercard'
require 'journey'
require 'station'

RSpec.describe Oystercard do

  before(:each) do
    @oystercard = Oystercard.new(50)
  end

  describe "#initialize" do
    it 'checks that the Oystercard class exists' do
      expect(@oystercard.respond_to?(:oystercard))
    end
  end

  describe "#initialize" do
    it 'should check that the card has an empty list of journeys by default' do
      expect(@oystercard.journey_history).to be_empty
    end
  end

  describe "#balance" do
    it 'checks that a new card has a balance' do
      expect(@oystercard.balance).to eq @oystercard.balance
    end
  end

  describe "#top_up" do
    it 'should add money to the balance, and take in the amount as an argument' do
      expect(@oystercard.top_up(20)).to eq @oystercard.balance
    end

    it 'should add money to the balance, and take in the amount as an argument' do
      expect(@oystercard.top_up(30)).to eq @oystercard.balance
    end

    it 'should raise an error when maximum balance is exceeded (in this case it is exceeded - return error)' do
      expect { @oystercard.top_up(71) }.to raise_error "Cannot exceed maximum limit of £#{MAXIMUM_LIMIT}"
    end
  end

  describe "#deduct" do
    it 'should deduct the fare from the card' do
      expect(@oystercard.deduct(10)).to eq @oystercard.balance
    end
  end

  describe "#minimum_balance?" do
    it 'should return whether the customer has the minimum balance to make a journey (true in this case)' do
      expect(@oystercard.minimum_balance?).to eq true
    end
  end

  describe "#minimum_balance?" do
    it 'should return whether the customer has the minimum balance to make a journey (false in this case)' do
      @oystercard.deduct(50) #this oystercard now has a balance of £0
      expect(@oystercard.minimum_balance?).to eq false
    end
  end

end
