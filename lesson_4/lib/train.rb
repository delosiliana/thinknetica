require_relative './route'
require_relative './station'

class Train
  attr_reader :number, :type, :carriages
  attr_accessor :route

  def initialize(number, type, carriages)
    @number    = number
    @type      = type
    @carriages = carriages.to_i
  end

  def accelerate  # может набирать скорость, возвращать текуюую, тормозить.
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def add_carriage   # прицепить(если поезд стоит)
    stop
    @carriages += 1
  end

  def remove_carriage  #отцепить(если поезд стоит)
    stop
    @carriages -= 1 if @carriages > 0
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
