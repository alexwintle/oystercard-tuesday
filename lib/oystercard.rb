require 'journey'

MAXIMUM_LIMIT = 90
MINIMUM_BALANCE = 1

class Oystercard

  def initialize(starting_balance, journey: Journey.new)
    @journey = journey
    @balance = starting_balance
    @journey_history = []
  end

  attr_accessor :balance, :journey_history

  def add_journeys(journey)
    @journey_history.push(journey)
  end

  def touch_in(entry_station)
    @journey.enter(entry_station)
  end

  def touch_out(exit_station,fare)
    @journey.exit(exit_station)
    deduct(fare)
  end

  def top_up(amount)
    raise "Cannot exceed maximum limit of £#{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def minimum_balance?
    if @balance < MINIMUM_BALANCE
      false
    else
      true
    end
  end

end