class Journey
  MIN_FARE = 3
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

  def new?
    @entry_station.nil? && @exit_station.nil?
  end
end
