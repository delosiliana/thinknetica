class Route
  attr_accessor :stations

  include Validation

  def initialize (first, last)   #создание маршрута начальная-конечная станция
    @stations = [first, last]
    validate!
  end

  def add_station(station)    #добавление станции в маршрут
    @stations.insert(-2, station)
  end

  def delete_station(station)    #удаление станции из маршрута
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    end
  end

  protected

  def validate!
    raise "Станций не существует" if @stations[0].nil? || @stations[-1].nil?
    true
  end
end
