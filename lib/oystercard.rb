require 'station'

class Oystercard
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(starting_balance)
    @balance = starting_balance
    @entry_station = ""
    @exit_station = ""
    @journeys = []
  end

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys

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

  def touch_in(station_name)
    @entry_station << station_name.to_s
    on_journey?
  end

  def touch_out(fare, exit_station)
    @entry_station = entry_station
    @journeys.push(journey_formatter(entry_station, exit_station, fare))
    deduct(fare)
    on_journey?
  end

  def journey_formatter(entry_station, exit_station, fare)
    {
      "Entry Station: " => entry_station,
      "Exit Station: " => exit_station,
      "Fare: " => fare
    }
  end

  def on_journey?
    if @entry_station.size > 0
      true
    else
      false
    end
  end

  def minimum_balance?
    if @balance < MINIMUM_BALANCE
      false
    else
      true
    end
  end

end

# oystercard_a = Oystercard.new(20)
# oystercard_a.touch_in("Waterloo")
# oystercard_a.touch_out(10, "Bank")
# puts oystercard_a.journeys
