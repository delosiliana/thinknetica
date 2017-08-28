require_relative './lib/route'
require_relative './lib/station'
require_relative './lib/train'
require_relative './lib/passenger'
require_relative './lib/cargo'
require_relative './lib/carriage'
require_relative './lib/carriage_cargo'
require_relative './lib/carriage_passenger'

class Main
attr_accessor :station, :trains, :train, :route, :stations,
              :number, :name, :carriage

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    puts "________________________________________________________________"
    puts "|                                                              |"
    puts "|    Вас приветствует служба управлением поездов и станций     |"
    puts "|Введите пожалуйста номер действия которое вы хотите выполнить:|"
    puts "|  1 - Создать станцию.                                        |"
    puts "|  2 - Просмотреть список станций                              |"
    puts "|  3 - Просмотреть список поездов на станции                   |"
    puts "|  4 - Создать поезд                                           |"
    puts "|  5 - Прицепить вагон к поезду                                |"
    puts "|  6 - Отцепить вагон от поезда                                |"
    puts "|  7 - Создать маршрут                                         |"
    puts "|  8 - Добавить станцию в маршрут                              |"
    puts "|  9 - Удалить станцию из маршрута                             |"
    puts "| 10 - Назначить маршрут поезду                                |"
    puts "| 11 - Переместить поезд по маршруту вперед                    |"
    puts "| 12 - Переместить поезд по маршруту назад                     |"
    puts "| 00 - Выход из меню                                           |"
    puts "|______________________________________________________________|"
    puts"Вы выбираете:"
    input = gets.chomp.to_i

    case input
      when 1
        create_station
      when 2
        station_list
      when 3
        trains_list
      when 4
        create_train
      when 5
        to_attach_carriage
      when 6
        to_unhook_сarriage
      when 7
        create_route
      when 8
        add_station_route
      when 9
        delete_station_route
      when 10
        to_appoint_route
      when 11
        move_forward
      when 12
        move_back
      when 00
        abort
      else puts "Вы ввели неправильное значение команды, ознакомьтесь еще раз со списком комманд"
      menu
    end
  end

  private

  def create_station
    puts "Введите название станции: "
    name = gets.chomp.capitalize
    @station = Station.new(name)
    @stations << station
    puts "Станция #{name}  создана"
    menu
  end

  def station_list
    stations.each { |station| puts station.name } || "Станций пока не существует"
  end

  def trains_list
    station_list
    puts "Выберите станцию на которой хотите посмотреть поезда:"
    input = gets.chomp.capitalize
    index = @stations.find_index { |station|  station.name == input }
    current_station = @stations[index]
    puts "На станции #{current_station.name} сейчас находится #{current_station.trains.size} поездов"
    menu
  end

  def create_train
    puts "Выберите какой поезд вы хотите создать?"
    puts "1 - пассажирский"
    puts "2 - грузовой"
    puts "0 - выход в меню"
    input = gets.chomp.to_i

    case input
    when 1
      puts "Для создания пассажирского поезда, введите номер поезда "
      number = gets.chomp.to_i
      @train = Passenger.new(number)
      @trains << train
      puts "Поезд номер #{number} создан"
      menu
    when 2
      puts "Для создания грузового поезда, введите номер поезда"
      number = gets.chomp.to_i
      @train = Cargo.new(number)
      @trains << train
      puts "Поезд номер #{number} создан"
      menu
    when 0
      menu
    else puts "Вы ввели неправильные данные"
    menu
    end
  end

  def invalid_number
    puts "Некорректный номер"
  end

  def selected_train
    number = gets.chomp.to_i
    index = @trains.find_index { |train| train.number == number }
    index.nil? ? invalid_number && menu : @train = @trains[index]
  end

  def invalid_name
    puts "Неккоретное имя"
  end

  def to_attach_carriage
    menu_carriage
    puts "Выберите поезд(по номеру) к которому хотите прицепить вагон:"
    selected_train.add_carriage(carriage)
    puts "К поезду #{@train.number} успешно прицеплен вагон типа #{@carriage.type}"
    puts "У поезда #{@train.number} теперь кол-во вагонов составляет - #{@train.carriages.size}"
    menu
  end

  def menu_carriage
    puts "Введите 1 если хотите добавить пассажирский вагон"
    puts "Введите 2 если хотите добавить грузовой вагон"
    input = gets.chomp.to_i

    case input
    when 1
      @carriage = CarriagePassenger.new
    when 2
      @carriage = CarriageCargo.new
    else puts "Вы ввели неправильный тип вагона"
    menu
    end
  end

  def to_unhook_сarriage
    puts "Выберите поезд(по номеру) от которого хотите отцепить вагон:"
    selected_train.remove_carriage
    puts "От поезда #{@train.number} успешно отцеплен вагон типа #{@carriage.type}"
    puts "У поезда #{@train.number} теперь кол-во вагонов составляет - #{@train.carriages.size} "
    menu
  end

  def create_route
    station_list
    puts "Выберете начальную станцию маршрута из списка:"
    input = gets.chomp.capitalize
    index = @stations.find_index { |station|  station.name == input }
    first = @stations[index]
    puts "Выберите конечную станцию маршрута из списка:"
    input = gets.chomp.capitalize
    index = @stations.find_index { |station|  station.name == input }
    last = @stations[index]
    @route = Route.new(first, last)
    puts "Маршрут #{route.stations} создан"
    @routes << @route
    menu
  end

  def add_station_route
    station_list
    puts "Выберите название станции, которую хотите добавить"
    input = gets.chomp.capitalize
    index = @stations.find_index { |station|  station.name == input }
    station = @stations[index]
    @route.add_station(station)
    puts "Станция #{station} в маршрут #{route.stations} добавлена "
    menu
  end

  def delete_station_route
    station_list
    puts "Введите название станции, которую хотите удалить"
    input = gets.chomp.capitalize
    index = @stations.find_index { |station|  station.name == input }
    station = @stations[index]
    @route.delete_station(station)
    puts "Станция #{@station} удалена из маршрута #{route.stations}"
    menu
  end

  def to_appoint_route
    puts "Введите номер поезда, к которому хотите присвоить маршрут"
    selected_train.route_train(route)
    puts "У поезда #{train.number} сейчас маршрут #{route.stations}"
    menu
  end

  def move_forward
    puts "Введите номер поезда, который хотите отправить вперед"
    selected_train.move_next
    puts "Поезд #{train.number} прибыл на станцию #{@train.current_station.name}"
    menu
  end

  def move_back
    puts "Введите номер поезда, который хотите отправить назад"
    selected_train.move_previous
    puts "Поезд #{train.number} прибыл на станцию #{@train.current_station.name}"
    menu
  end
end
