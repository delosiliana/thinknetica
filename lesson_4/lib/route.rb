require_relative './train'
require_relative './station'

class Route
  attr_accessor :stations

  def initialize(first, last)   #создание маршрута начальная-конечная станция
    @stations = [first, last]
  end

  def add_station(station)    #добавление станции в маршрут
    @stations.insert(-2, station)
  end

  def delete_station(station)    #удаление станции из маршрута
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    end
  end
end
