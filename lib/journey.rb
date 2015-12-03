require_relative 'oystercard'

class Journey
  attr_accessor :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def update_entry(station)
    @entry_station = station
  end

  def update_exit(station)
    @exit_station = station
  end

end
