require_relative './route'
require_relative './station'
require_relative './carriage'

class Train
  attr_accessor :route, :number, :carriages, :type

  def initialize(number, type, carriages=[] )
    @number    = number
    @type      = type
    @carriages = carriages
  end

  def accelerate  # может набирать скорость, возвращать текуюую, тормозить.
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def add_carriage   # прицепить(если поезд стоит)
    stop
    @carriages  << Carriage.new(self.class)
  end

  def remove_carriage  #отцепить(если поезд стоит)
    stop
    @carriages.pop || "No more carriages"
  end

  def route_train(route)
    @station_index = 0
    @route = route
  end

  def move_next
    return if last_station?
    current_station.depart_train(self)
    @station_index += 1
    current_station.add_train(self)
  end

  def move_previous
    return if first_station?
    current_station.depart_train(self)
    @station_index -= 1 if @station_index > 0
    current_station.add_train(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1]
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index > 0
  end

  private

  def first_station?
    current_station == @route.stations.first
  end

  def last_station?
    current_station == @route.stations.last
  end
end
