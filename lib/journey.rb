class Journey
  def initialize
    @entry_station = ""
    @exit_station = ""
    @fare = 0
    @current_journey = {}
  end

  attr_reader :entry_station, :exit_station, :fare, :current_journey

  def touch_in(station_name)
    @entry_station = station_name.to_s
    on_journey?
  end

  def touch_out(exit_station, fare)
    @fare = fare
    oystercard = Oystercard.new(0)
    @exit_station = exit_station.to_s
    oystercard.deduct(fare)
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
      true
    else
      false
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