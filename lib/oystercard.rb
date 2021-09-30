require 'journey'

MAXIMUM_LIMIT = 90
MINIMUM_BALANCE = 1

class Oystercard

  def initialize(starting_balance)
    @balance = starting_balance
    @journey_history = []
  end

  attr_reader :balance, :journey_history

  def add_journeys(journey)
    @journey_history.push(journey)
  end

  def top_up(amount)
    raise "Cannot exceed maximum limit of £#{MAXIMUM_LIMIT}" if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance = fare.to_i - @balance
  end

  def minimum_balance?
    if @balance < MINIMUM_BALANCE
      false
    else
      true
    end
  end

end