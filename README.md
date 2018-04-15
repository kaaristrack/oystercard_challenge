# Oystercard Challenge

### Synopsis

Welcome to my repo for the Makers Academy weekday challenge(2). My task was to create a program that satisfied the requirements below.

Welcome to my repo for the Makers Academy challenge 2:1!

<img align="right" src="https://image.ibb.co/hN1VDm/Oystercard.jpg" width="150" height="100"/>

My task was to create an emulation of the infamous "oystercard" top-up travelcard. The card starts with a default, pre-loaded balance - and the user is able to add customisable amount of money to their card, touch in, touch out, and see that the correct amount has been deducted from their balance if the journey is complete.

The original brief for this challenge can be found [HERE!](https://github.com/makersacademy/course/blob/master/oystercard/README.md)

### Key Focus

Object-Oriented Design (OOD).

### Stack

- Ruby.
- RSPEC.

### Implementation

1) Clone this repository, and change into the correct directory.
```
$ git clone https://github.com/kaaristrack/oystercard_challenge
$ cd oystercard_challenge
```
2) Open in IRB or PRY.
```
$ pry
  > require './file_collective.rb'
```
3) Create a new oystercard.
```
> oystercard = Card.new
```
4) Topup the card.
```
> oystercard.top_up(20)
```
5) Touch in at a station.
```
oystercard.touch_in(Bank)
```
6) Touch out at a station.
```
oystercard.touch_out(Victoria)
```
7) Marvel at your completed journey history, and correctly deducted fare!

### User Stories

__MINIMUM VIABLE PRODUCT__

- [x] As a user, so I can travel around London straight away, I want my oystercard to have a default balance pre-loaded.

- [x] As a user, so I can go on a journey, I want my fare to be calculated and deducted from the card balance.

- [x] As a user, so I can complete my journey, I want the balance to be deducted when the journey is COMPLETE (and not before!)

__FEATURES__

- [x] As a user, so I can top-up my card as needed, I want to be able to add a customisable amount of money to my card before a journey.

- [x] As a user, so I am not overcharged, I want to be able to touch in and touch out when necessary.

__EXTRAS__

- [x] As a user, so I can limit the amount that is loaded onto my card, I want the top-up limit to be capped.

- [x] As a user, so I am not freeloading, I want my card to deduct a minimum charge for a single journey.

### Expansion

In the future, I would like to expand this project to satisfy the following objectives:

- [ ] As a user, so I can see where I have travelled from, I want to be able to view my journey history.

- [ ] As a user, so I am not overcharged, I want to be able to find out the London "zone" of my desired destination.

- [ ] As a user, so I know to pay more attention next time, I want a penalty charge to be deducted if I fail to touch in/touch out correctly.
