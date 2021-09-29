
class Journey
  def initialize
    @entry_station = ""
    @exit_station = ""
    @fare = 0
  end

  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :fare

  def touch_in(station_name)
    @entry_station << station_name.to_s
    on_journey?
  end

  def touch_out(exit_station, fare)
    oystercard = Oystercard.new(0)
    oystercard.top_up(20)
    @exit_station << exit_station.to_s
    oystercard.deduct(fare)
    on_journey?
  end

  def journey_complete?
    if on_journey? == false
      false
    else
      true
    end
  end

  def on_journey?
    if @entry_station.size > 0
      true
    else
      false
    end
  end

  def update_journeys(entry_station, exit_station, fare)
    oystercard = Oystercard.new(10)
    oystercard.journeys.push(journey_formatter(entry_station, exit_station, fare))
  end

  def journey_formatter(entry_station, exit_station, fare)
    {
      "Entry Station: " => entry_station,
      "Exit Station: " => exit_station,
      "Fare: " => fare
    }
  end

end
