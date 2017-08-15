class Station
  attr_accessor :name, :trains

  def initialize(name)  # названия станции
    @trains = []
  end

  def add_train(train)  # принимает поезда
    @trains << train
    @trains.join(", ")
  end

  def by_type(type)
    @trains.group_by(&:type).each { |key, value| print "#{key}: #{value.count} " if key == type }
  end

  def depart(train)  # отправить поезд
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

  def initialize(opts = {})
    @carriages = opts[:carriages]
    @number    = opts[:number]
    @type      = opts[:type]
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
    @route = route
    @st_index = 0
  end

  def move_next
    @st_index += 1 if @route.stations[@st_index + 1]
  end

  def move_previous
    @st_index -= 1 if @st_index > 0
  end

  def current_station
    current = @route.stations[@st_index]
  end

  def next_station
    @next_st = @route.stations[@st_index + 1]
  end

  def previous_station
    @pr_st = @route.stations[@st_index - 1] if @st_index > 0
  end
end

stans= Station.new('Moscow')
one = Train.new(number: "91", type: "passenger", carriages: 15)
two = Train.new(number: "24", type: "passenger", carriages: 38)
three = Train.new(number: "16", type: "cargo", carriages: 21)
route1 = Route.new('Moscow', 'Dnepr')
route1.add_station('Tula')
route1.add_station('Belgorod')
route1.add_station('Harkov')
one.route_train(route1)
one.current_station
one.next_station
one.move_next
one.move_next
one.move_previous
one.current_station
one.next_station
one.previous_station
one.remove_carriage
one.remove_carriage
one.move_previous
one.current_station
stans.add_train(one)
stans.add_train(two)
stans.add_train(three)
stans.by_type('passenger')
stans.by_type('cargo')
stans.trains.size
