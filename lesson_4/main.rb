require_relative './lib/route'
require_relative './lib/station'
require_relative './lib/train'
require_relative './lib/passenger'
require_relative './lib/cargo'
require_relative './lib/carriage'

class Main
  attr_accessor :station, :trains, :train, :route, :stations, :number, :name

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
        else
          puts "Вы ввели неправильное значение команды, ознакомьтесь еще раз со списком комманд"
        menu
      end
    end

    private

    def create_station
      puts "Введите название станции: "
      name = gets.chomp
      @station = Station.new(name)
      @stations << station
      puts "Станция #{name}  создана"
      menu
    end

    def station_list
      stations.each { |station| puts station.name } || "Станций пока не существует"
    end

    def trains_list
      @trains.each do |train|
      @stations.each do |station|
        if station.name == train.current_station
          puts "На станции: #{station.name} поезда: #{train.number}"
        end
      end
    end
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
      else
        puts "Вы ввели неправильные данные"
       menu
      end
    end

    def invalid_number
      puts "Некорректный номер"
    end

    def selected_train
      number = gets.chomp.to_i
      @train = self.trains.select{ |train| @train.number == number }
      return invalid_number  unless @trains.include? @train
      @trains.find { |train| train == @train }
    end

    def invalid_name
      puts "Неккоретное имя"
    end

    def to_attach_carriage
      puts "Выберите поезд(по номеру) к которому хотите прицепить вагон:"
      selected_train.add_carriage
      puts "К поезду #{@train.number} успешно прицеплен вагон"
      puts "У поезда #{@train.number} теперь кол-во вагонов составляет - #{@train.carriages.size} "
      menu
    end

    def to_unhook_сarriage
      puts "Выберите поезд(по номеру) от которого хотите отцепить вагон:"
      selected_train.remove_carriage
      puts "От поезда #{@train.number} успешно отцеплен вагон"
      puts "У поезда #{@train.number} теперь кол-во вагонов составляет - #{@train.carriages.size} "
      menu
    end

    #  def selected_station
    #    station = gets.chomp.to_s
    #    @stations = self.stations.select { |station| station == station }
    #    return invalid_name unless @stations.include? @station
    #    @stations.find { |station| station == @station }
    #  end

    def create_route
      station_list
      puts "Выберете начальную станцию маршрута из списка:"
      station = gets.chomp
      @stations = stations.select { |station| station == station }
      #@stations.find_index { |station| first == @station }
      @stations.find{ |station| @stations == station}
      first = station
      puts "Выберите конечную станцию маршрута из списка:"
      station = gets.chomp
      @stations = stations.select { |station| station == station }
      @stations.find{ |station| @stations == station}
      last = station
      #@stations.find { |station| last == @station }
      @route = Route.new(first, last)
      puts "Маршрут #{route.stations} создан"
      menu
    end

    def add_station_route
      station_list
      puts "Выберите название станции, которую хотите добавить"
      station = gets.chomp
      @stations = stations.select { |station| station == station }
      @stations.find{ |station|  @station == station}
      @route.add_station(self)
      puts "Станция #{station} в маршрут #{route.stations} добавлена "
      menu
    end

    def delete_station_route
      station_list
      puts "Введите название станции, которую хотите удалить"
      station = gets.chomp
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
      puts "Поезд #{train.number} прибыл на станцию #{@train.current_station}"
      menu
    end

    def move_back
      puts "Введите номер поезда, который хотите отправить назад"
      selected_train.move_previous
      puts "Поезд #{train.number} прибыл на станцию #{@train.current_station}"
      menu
    end
end
