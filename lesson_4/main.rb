require_relative './lib/route'
require_relative './lib/station'
require_relative './lib/train'
require_relative './lib/carriage'
require_relative './lib/cargo'
require_relative './lib/passenger'

puts "________________________________________________________________"
puts "|                                                              |"
puts "|    Вас приветствует служба управлением поездов и станций     |"
puts "|Введите пожалуйста номер действия которое вы хотите выполнить:|"
puts "| 1 - Создать станцию.                                         |"
puts "| 2 - Создать поезд                                            |"
puts "| 3 - Создать маршрут                                          |"
puts "| 4 - Добавить станцию в маршрут                               |"
puts "| 5 - Удалить станцию из маршрута                              |"
puts "| 6 - Назначить маршрут поезду                                 |"
puts "| 7 - Прицепить вагон к поезду                                 |"
puts "| 8 - Отцепить вагон от поезда                                 |"
puts "| 9 - Переместить поезд по маршруту вперед                     |"
puts "| 10 - Переместить поезд по маршруту назад                     |"
puts "| 11 - Просмотреть список станций                              |"
puts "| 12 - Просмотреть список поездов на станции                   |"
puts "|______________________________________________________________|"


one = Train.new(91, passenger,  15)
#one = passenger(91)
one.add_carriage
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
