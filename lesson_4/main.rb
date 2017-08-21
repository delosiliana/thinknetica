require_relative './lib/route'
require_relative './lib/station'
require_relative './lib/train'
require_relative './lib/passenger'
require_relative './lib/cargo'
require_relative './lib/carriage'

class Main
  attr_reader :stations, :trains

    def initialize
      @stations = []
      @trains = []
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
      print "Вы выбираете:"
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

    attr_writer  :stations, :trains

    def create_station
      print "Введите название станции: "
      name = gets.chomp.to_s
      station = Station.new name
      stations << station
      puts "Станция #{name}  создана"
      menu
    end

    def station_list
      stations.each { |station| puts station.name } || "Станций пока не существует"
      menu
    end

    def trains_list
    end

    def create_train
      puts "Выберите какой поезд вы хотите создать?"
      puts "1 - пассажирский"
      puts "2 - грузовой"
      puts "0 - выход в меню"
      input = gets.chomp.to_i

      case input
      when 1
        print "Для создания пассажирского поезда, введите номер поезда "
      when 2
        print "Для создания грузового поезда, введите номер поезда"
      when 0
        menu
      else
        puts "Вы ввели неправильные данные"
       end
       menu
    end

    def to_attach_carriage
      menu
    end

    def to_unhook_сarriage
      menu
    end

    def create_route
      menu
    end

    def add_station_route
      menu
    end

    def delete_station_route
      menu
    end

    def to_appoint_route
      menu
    end

    def move_forward
      menu
    end

    def move_back
      menu
    end




 #one = Train.new(91, 'passenger')
#one = passenger(91)
# one.add_carriage
#two = Train.new(24,'passenger',  '38')
#three = Train.new(16,  'cargo',  '21')
# route1 = Route.new(Station.new('Moscow'), Station.new('Dnepr'))
# route1.add_station(Station.new('Tula'))
# route1.add_station(Station.new('Belgorod'))
# route1.add_station(Station.new('Harkov'))
# one.route_train(route1)
#one.current_station
#one.move_next
#two.route_train(route1)
#two.move_next
#route1.stations[1].trains.size
#one.move_next
#one.move_previous
#route1.stations[1].trains.size
#one.next_station
#one.remove_carriage
#one.remove_carriage
#one.move_previous
#one.current_station
#route1.stations[1].trains_by_type('passenger')
#route1.stations[1].trains_by_type('cargo')
end
