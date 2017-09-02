class Route
  attr_accessor :stations

  include Validate

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
    raise "Вы забыли выбрать станцию" if @stations.first.nil? && @stations.last.nil?
  end
end
