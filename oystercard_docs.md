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
| | top_up | I want to add money on my card | So i can use public transport
| | top_up | I dont want to put too much money on my card | To protect my money
| | deduct | I need my fare deducted from my card | In order to pay for my journey
| | touch_in | I need to touch in | In order to get through the barriers 
| | touch_out | I need to touch out | In order to get through the barriers
| | on_journey? | I need to check if the customer is on a journey/if the card is in use | So that they dont have to go through barriers yet
| | minimum_balance? | I need to have the minimum amount (£1) for a single journey | So that i can go on a journey
| | entry_station | I need to know where i have travelled from | In order to pay for my journey
| | 