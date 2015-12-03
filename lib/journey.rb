require_relative 'oystercard'

class Journey
  attr_accessor :current_journey

  def initialize
    @current_journey = {}
  end

  def update_entry(station)
    @current_journey[:entry_station] = station
  end

  def update_exit(station)
    @current_journey[:exit_station] = station
  end

end
