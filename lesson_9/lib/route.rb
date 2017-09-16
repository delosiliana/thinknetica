class Route
  attr_accessor :stations

  include Validate

  def initialize(first, last) # create route first - last station
    @stations = [first, last]
    validate!
  end

  def add_station(station) # add route station
    @stations.insert(-2, station)
  end

  def delete_station(station) # delete route station
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
    end
  end

  protected

  def validate!
    raise 'Вы забыли выбрать станцию' if @stations.first.nil? && @stations.last.nil?
  end
end
