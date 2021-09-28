class Oystercard
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(starting_balance)
    @balance = starting_balance
    @on_journey = false

  end

  attr_reader :balance

  def top_up(amount)
    new_balance = (@balance += amount)

    if new_balance <= MAXIMUM_LIMIT
      @balance = new_balance

    elsif new_balance > MAXIMUM_LIMIT
      return "Cannot exceed maximum limit of £#{MAXIMUM_LIMIT}"
    end

  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @on_journey = true
  end

  def touch_out
    @on_journey = false
  end

  def on_journey?
    @on_journey
  end

  def minimum_balance?
    if @balance < MINIMUM_BALANCE
      false
    else
      true
    end
  end

end
