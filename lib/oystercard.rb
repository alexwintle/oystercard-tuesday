require 'journey'

class Oystercard
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(starting_balance)
    @balance = 0
    @balance = starting_balance
    @journeys = []
  end

  attr_reader :balance
  attr_reader :journeys

  def top_up(amount)
    new_balance = (@balance += amount)

    if new_balance <= MAXIMUM_LIMIT
      @balance = new_balance

    elsif new_balance > MAXIMUM_LIMIT
      return "Cannot exceed maximum limit of £#{MAXIMUM_LIMIT}"
    end

  end

  def deduct(fare = 0)
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
