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
#route1.stations[1].trains_by_type('passenger')
#route1.stations[1].trains_by_type('cargo')
