require_relative './lib/route'
require_relative './lib/station'
require_relative './lib/train'
require_relative './lib/passenger'
require_relative './lib/cargo'
require_relative './lib/carriage'

class Main
  attr_reader :station, :trains, :route

    def initilize
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
        when 2
        when 3
        when 4
        when 5
        when 6
        when 7
        when 8
        when 9
        when 10
        when 11
        when 12
        when 00
        else
          puts "Вы ввели неправильное значение команды"
        menu
      end
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
