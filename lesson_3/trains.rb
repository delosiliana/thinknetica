class Station
  attr_accessor :train, :name, :station

  def initialize(name)  # названия станции
    @name = name
    @all_trains = []
  end

  def arrived(train)  # принимает поезда
    @all_trains << train
    puts "На станцию #{name} прибывает поезд #{train}"
  end

  def station_info   #список поездов
    puts "Всего #{@all_trains.size} поездов на станции #{@name}"
  end

  def depart(train)  # отправить поезд
    all_trains.delete(train)
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
    if station != @stations[0] && station != @stations[-1]
      @stations.delete(station)
      puts "Станция (#{station}) удалена из маршрута #{@number}."
    end
  end
end

class Train
  attr_reader :number, :type, :carriages
  attr_accessor :route, :station

  def initialize(number, type, carriages)   # создает номер, тип(пассажирский, грузовой),и количество вагонов
    @number = number
    @type = type.to_s
    @carriages = carriages.to_i
    reset_speed
    puts "Создан поезд №#{number} состав: #{type}, c #{carriages} вагонами"
  end

  def increments_speed  # может набирать скорость, возвращать текуюую, тормозить.
    @initial_speed += 10
  end

  def reset_speed
    @initial_speed = 0
  end

  def carriage(option)   # прицепить\отцепить(если поезд стоит)
    reset_speed
    @carriages += 1 if option == 'attach'
    puts "Прицепить вагон" if option == 'attach'
    @carriages -= 1 if option == 'unhook'
    puts "Отцепить вагон" if option == 'unhook'
  end

  def list_the_car   # показать количество вагонов
    puts "Количество вагонов в поезде: #{carriages}"
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
    @st_index-= 1 if @st_index > 0
    puts "Вы прибыли на станцию #{@route.stations[@st_index]}"
  end

  def current_station
    current= @route.stations[@st_index]
    puts "Сейчас вы находитесь на станции #{current}"
  end

  def next_station
    @next_st=@route.stations[@st_index + 1]
    puts "Следующая станция по вашему маршруту #{@next_st}"
  end

  def previous_station
    @pr_st=@route.stations[@st_index - 1] if @st_index > 0
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
t1.list_the_car
t1.carriage('attach')
t1.list_the_car
t1.move_previous
t1.current_station
st1.arrived('t1')
st1.station_info
