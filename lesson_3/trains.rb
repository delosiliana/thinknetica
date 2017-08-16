class Station
  attr_accessor :name, :trains

  def initialize(name)  # названия станции
    @name = name
    @trains = []
  end

  def add_train(train)  # принимает поезда
    @trains << train
  end

  def by_type(type)
    @trains.group_by(&:type).each { |key, value| print "#{key}: #{value.count} " if key == type }
  end

  def depart_train(train)  # отправить поезд
    trains.delete(train)
  end
end

class Route
  attr_reader :stations

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

one = Train.new(91, 'passenger',  '15')
two = Train.new(24,'passenger',  '38')
three = Train.new(16,  'cargo',  '21')
route1 = Route.new(Station.new('Moscow'), Station.new('Dnepr'))
route1.add_station(Station.new('Tula'))
route1.add_station(Station.new('Belgorod'))
route1.add_station(Station.new('Harkov'))
one.route_train(route1)
one.current_station
one.move_next
two.route_train(route1)
two.move_next
route1.stations[1].trains.size
one.move_next
route1.stations[2].trains.size
one.move_previous
route1.stations[1].trains.size
#one.next_station
#one.remove_carriage
#one.remove_carriage
#one.move_previous
#one.current_station
#route1.stations[1].by_type('passenger')
#route1.stations[1].by_type('cargo')
