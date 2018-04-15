require_relative 'card.rb'

class Journeylog

  attr_reader :current_journey, :journey_history

  def initialize(journey_class:)
    @journey_class = journey_class
    @journey_history = []
  end

  def start(entry_station)
    @current_journey.set_entry(entry_station) # setter method
  end

  def finish(exit_station)
    @current_journey.set_exit(exit_station) # setter method
  end

  def save_journey
    @journey_history << @current_journey
    @current_journey = Journey.new
  end
end
