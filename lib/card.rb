require_relative 'journey.rb'
require_relative 'journey_log.rb'

class Card
  DEFAULT = 5
  MIN_BALANCE = 0
  MAX_BALANCE = 90

  attr_reader :balance, :journey_history, :current_journey

  def initialize(balance = DEFAULT)
    @balance = balance
    @current_journey = Journey.new
    @journeylog = Journeylog.new(@current_journey) # creates a new instance of journeylog with an argument of c journey
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} exceeded!" if limit_reached?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    complete_journey if !current_journey.complete? || !current_journey.new?
    @current_journey.entry_station = entry_station
    raise 'There is not enough credit on your card!' if empty?
  end

  def touch_out(exit_station)
    @current_journey.exit_station = exit_station
    complete_journey
  end

  private

  def limit_reached?(amount)
    (@balance + amount) > MAX_BALANCE
  end

  def empty?
    balance <= MIN_BALANCE
  end

  def complete_journey
    deduct(@current_journey.fare)
    # @journey_history << @current_journey
    # @current_journey = Journey.new
  end

  def deduct(fare)
    @balance -= fare
  end
end
