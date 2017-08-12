class Station
  attr_accessor :train, :name, :station

  def initialize(name) # названия станции
    @name = name
    @all_trains = []
  end

  def arrived(train) # принимает поезда
    all_trains << train
    puts "На станцию #{name} прибывает поезд #{train}"
  end

  def station_info # список поездов
    puts "Всего #{@all.trains.size} поездов на станции #{@name}"
  end

  def depart(train) # отправить поезд
    all_trains.delete(train)
    puts "Поезд #{train} уходит со станции #{name}"
  end

  def train_by_type
    puts "Грузовых поездов: #{(@all_trains.select {|train| all_train[ :type] == "cargo"}).size}"
    puts "Пассажирских поездов: #{(@all_trains.select {|train| all_train[ :type] == "passenger"}).size}"
  end
end

class Route
  def name_city

  end

  def add_intermediate

  end

  def delete_intermediate

  end

  def list_city_station

  end
end

class Train
  attr_reader :number, :type, :carriages

  def initialize(number, type, carriages) # создает номер, тип(пассажирский, грузовой),и количество вагонов
    @number = number
    @type = type.to_s
    @carriages = carriages.to_i
    stop
  end

  def increments_speed # может набирать скорость, возвращать текуюую, тормозить.
    @initial_speed += 10
  end

  def reset_speed
    stop
  end

  def carriage(option) # прицепить\отцепить(если поезд стоит)
    reset_speed
    @carriages += 1 if option == 'attach'
    @carriages -= 1 if option == 'unhook'
  end

  def list_the_car # показать количество вагонов
    puts "Количество вагонов в поезде: #{carriages}"
  end

  def route_train

  end

  def move_station

  end

  def list_train_station

  end

  private

  def stop
    @initial_speed = 0
  end
end

station1 = Station.new("Moscow")
train1 = Train.new(120, 'cargo', 10)
train2 = Train.new(21,'passenger', 20)
train2.list_the_car
train2.carriage('attach')
train2.list_the_car
