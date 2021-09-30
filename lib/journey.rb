class Journey

  PENALTY_FARE = 6

  def initialize
    @entry_station = ""
    @exit_station = ""
    @fare = 0
    @current_journey = {}

  end

  attr_reader :entry_station, :exit_station, :fare, :current_journey

  def touch_in(entry_station)
    @entry_station = entry_station.to_s
    on_journey?
  end

  def touch_out(exit_station, fare) # deduct not working, ask for help
    @fare = fare
    @exit_station = exit_station.to_s
    on_journey?
  end

  def journey_complete?
    if on_journey? == false
      true
    else
      true
    end

  end

  def on_journey?
    if @entry_station.size > 0
      "On a journey?: #{true}"
    else
      "On a journey?: #{false}"
    end

  end

  def fare
    if @entry_station.size < 0 or @exit_station.size < 0
      @balance -= PENALTY_FARE
    else
      deduct(fare)
    end
  end

  def journey_formatter
    @current_journey = {
      "Entry Station: " => @entry_station,
      "Exit Station: " => @exit_station,
      "Fare: " => @fare
    }

  end

end