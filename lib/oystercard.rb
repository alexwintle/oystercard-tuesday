require './journey'

class Oystercard
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(starting_balance)
    @balance = starting_balance
    @journey_history = []
  end

  attr_reader :balance, :journey_history

  def add_journeys(journey)
    @journey_history.push(journey)
  end

  def top_up(amount)
    new_balance = (@balance += amount)

    if new_balance <= MAXIMUM_LIMIT
      @balance = new_balance

    elsif new_balance > MAXIMUM_LIMIT
      "Cannot exceed maximum limit of £#{MAXIMUM_LIMIT}"
    end

  end

  def deduct(fare)
    @balance -= fare.to_i
  end

  def minimum_balance?
    if @balance < MINIMUM_BALANCE
      false
    else
      true
    end
  end

end