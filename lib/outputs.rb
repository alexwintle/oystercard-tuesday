require './oystercard'

class Outputs
  def outputs_2journeys

    journey1 = Journey.new
    journey2 = Journey.new
    oystercard = Oystercard.new(20)
    journey1.touch_in("Waterloo")
    journey1.touch_out("Bank", 10)

    puts "=============BALANCE==========="
    puts oystercard.balance
    puts "=============ENTRY STATION============"
    puts journey1.entry_station
    puts "=============EXIT STATION============"
    puts journey1.exit_station
    puts "=============FARE============"
    puts journey1.fare
    puts "=============CURRENT JOURNEY============"
    puts journey1.current_journey
    oystercard.add_journeys(journey1.current_journey)
    puts "=============ALL JOURNEYS============"
    puts oystercard.journey_history
    puts "=============BALANCE============"
    puts oystercard.balance

    puts "================NEW JOURNEY================="

    journey2.touch_in("Liverpool")
    journey2.touch_out("Euston", 10)
    puts "=============BALANCE==========="
    puts oystercard.balance
    puts "=============ENTRY STATION============"
    puts journey2.entry_station
    puts "=============EXIT STATION============"
    puts journey2.exit_station
    puts "=============FARE============"
    puts journey2.fare
    puts "=============CURRENT JOURNEY============"
    puts journey2.current_journey
    oystercard.add_journeys(journey2.current_journey)
    puts "=============ALL JOURNEYS============"
    puts oystercard.journey_history
    puts "=============BALANCE============"
    puts oystercard.balance
  end

  def outputs_touch_out
    journey = Journey.new
    oystercard = Oystercard.new(20)
    puts journey.touch_in("Waterloo")
    puts journey.touch_out("Bank", 10)
    puts journey.journey_formatter
    puts oystercard.add_journeys(journey.current_journey)
  end

end
