class Journey

  PENALTY_FARE = 6

  def initialize
    @current_journey = {}
    @fare = nil
    @complete = false
  end

  attr_accessor :entry_station, :exit_station, :fare, :current_journey

  def enter(entry_station = nil)
    @entry_station = entry_station
    @complete = false
  end

  def exit(exit_station = nil, fare)
    @fare = fare
    @exit_station = exit_station
    journey_formatter
    @complete = true
    self
  end

  def complete?
    @complete
  end

  def fare
    PENALTY_FARE if penalty?
  end

  def journey_formatter
      @current_journey = {
      "Entry Station: " => @entry_station,
      "Exit Station: " => @exit_station,
      "Fare: " => @fare
    }

  end

  def penalty?
    (!entry_station || !exit_station)
  end

end
