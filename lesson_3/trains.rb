class Station
  attr_accessor :name

  def initialize(name)  # названия станции
    @trains = []
  end

  def add_train(train)  # принимает поезда
    @trains << train
    puts "На станцию #{name} прибывает поезд #{train}"
  end

  def trains   #список поездов
    puts "Всего #{@trains.size} поездов на станции #{@name}"
  end

  def depart(train)  # отправить поезд
    trains.delete(train)
    puts " Поезд #{train} уходит со станции #{name} "
  end
 end

class Route
  attr_reader :stations

  def initialize(first, last)   #создание маршрута начальная-конечная станция
    @stations = [first, last]
  end

  def add_station(station)    #добавление станции в маршрут
    @stations.insert(-2, station)
    puts "Станция (#{station}) добавлена в маршрут #{@number}."
  end

  def delete_station(station)    #удаление станции из маршрута
    if station != @stations.first && station != @stations.last
      @stations.delete(station)
      puts "Станция (#{station}) удалена из маршрута #{@number}."
    end
  end
end

class Train
  attr_reader :number, :type, :carriages
  attr_accessor :route

  def initialize(number, type, carriages)   # создает номер, тип(пассажирский, грузовой),и количество вагонов
    @number = number
    @type = type.to_sym
    @carriages = carriages.to_i
    stop
    puts "Создан поезд №#{number} состав: #{type}, c #{carriages} вагонами"
  end

  def accelerate  # может набирать скорость, возвращать текуюую, тормозить.
    @initial_speed += 10
  end

  def stop
    @initial_speed = 0
  end

  def add_carriage   # прицепить(если поезд стоит)
    stop
    @carriages += 1
    puts "Прицеплен вагон, на данный момент кол-во вагонов составляет #{carriages}"
  end

  def remove_carriage  #отцепить(если поезд стоит)
    stop
    unless @carriages <= 1
      puts "Отцеплен вагон, на данный момент кол-во вагонов составляет #{@carriages -= 1}"
    else puts "У вас всего 1 вагон, вам нечего отцеплять"
    end
  end

  def route_train(route)
    @route = route
    @st_index = 0
  end

  def move_next
    @st_index += 1 if @route.stations[@st_index + 1]
    puts "Вы прибыли на станцию #{@route.stations[@st_index]}"
  end

  def move_previous
    @st_index -= 1 if @st_index > 0
    puts "Вы прибыли на станцию #{@route.stations[@st_index]}"
  end

  def current_station
    current = @route.stations[@st_index]
    puts "Сейчас вы находитесь на станции #{current}"
  end

  def next_station
    @next_st = @route.stations[@st_index + 1]
    puts "Следующая станция по вашему маршруту #{@next_st}"
  end

  def previous_station
    @pr_st = @route.stations[@st_index - 1] if @st_index > 0
    puts "Предыдущая станция по вашему маршруту: #{@pr_st}"
  end
end

st1= Station.new('Moscow')
t1 = Train.new('91', 'passenger', '16')
route1 = Route.new('Moscow', 'Dnepr')
route1.add_station('Tula')
route1.add_station('Belgorod')
route1.add_station('Harkov')
t1.route_train(route1)
t1.current_station
t1.next_station
t1.move_next
t1.move_next
t1.move_previous
t1.current_station
t1.next_station
t1.previous_station
t1.remove_carriage
t1.remove_carriage
t1.move_previous
t1.current_station
st1.add_train('t1')
st1.trains
