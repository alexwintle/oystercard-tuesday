# Oystercard Documentation

This week's challenge will start with going back over the basics we covered last week in Boris Bikes, giving you the chance to reinforce what you learned last week. You'll then be challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design.

##Oystercard User Stories

```
//initialize in Oystercard class
In order to use public transport
As a customer
I want money on my card

//top_up(amount)
In order to keep using public transport
As a customer
I want to add money to my card

//top_up(amount)
In order to protect my money
As a customer
I don't want to put too much money on my card

//deduct
In order to pay for my journey
As a customer
I need my fare deducted from my card

//touch_in + touch_out + on_journey?
In order to get through the barriers
As a customer
I need to touch in and out

//minimum_balance?
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

//touch_out refactor -> touch_out(fare)
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

//entry_station + touch_in(station_name)
In order to pay for my journey
As a customer
I need to know where I've travelled from

//journeys
In order to know where I have been
As a customer
I want to see to all my previous trips


In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated

```

| Object | Messages | Verbs | Purpose
| --- | --- | --- | --- |
| Oystercard | initialize | I want money on my card | So i can use public transport 
| | top_up(amount) | I want to add money on my card | So i can use public transport
| | top_up(amount) | I want a maximum limit (of £90) on my card | In order to protect my money from theft or loss
| | deduct(fare) | I need my fare deducted from my card | In order to pay for my journey
| | touch_in | I need to touch in | In order to get through the barriers
| | touch_in(station_name) | I need to know where I've travelled from | In order to pay for my journey
| | touch_out | I need to touch out | In order to get through the barriers
| | touch_out(fare) | I need to pay for my journey when it's complete | In order to pay for my journey
| | touch_out(fare, exit_station) | When my journey is complete, I need the correct amount deducted from my card | In order to pay for my journey
| | on_journey? | I need to check if the customer is on a journey/if the card is in use | To track the state of the card (in use or not)
| | | I need to check if the customer is on a journey/if the card is in use | I want to remove the @on_journey instance variable, i'll check whether the @entry_station has been added
| | minimum_balance? | I need to have the minimum amount (£1) for a single journey | So that i can go on a journey
| | entry_station | I need to know where i have travelled from | In order to pay for my journey
| | exit_station | I need to know where i have travelled to | In order to pay for my journey
| | balance | I need to know what the balance on the oystercard is | In order to be able to check whether the customer can pay for a journey etc.
| | journeys | I want to see to all my previous trips | I want to see to all my previous trips
| | journey_formatter | I want to format the hashes that i will be storing in the @journeys array | So that it is clear and human readable
| Station | initialize | I want to know what zone a station is in and what its name is | In order to know how far I have travelled
| | station_name | I want to know what the stations name is | In order to know how far I have travelled 
| | zone | I want to know what zone a station is in | In order to know how far I have travelled
| Journey | initialize |  it should be responsible for starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.| 
| | #fare | I need a penalty charge deducted if I fail to touch in or out | In order to be charged correctly
