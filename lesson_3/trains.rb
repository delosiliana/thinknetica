Class Station

  def name_station            #названия станции

  end

  def taking_traind               #принимает поезда

  end

  def list_trains                      #список поездов

  end

  def send_train                     #отправить поезд

  end

end

Class Route

  def name_city                       #Имена городов отправления и прибытия

  end

  def add_intermediate     #Промежуточные станции

  end

  def  delete_intermediate     #удалить промежуточную станцию

  end

  def list_city_station            #список всех станций

  end

end

Class Train

  def create_number_type           #создает номер, тип(пассажирский, грузовой),и количество вагонов

  end

  def speed                                   # может набирать скорость, возвращать текуюую, тормозить.

  end

  def list_the_car                          #показать количество вагонов, прицепить\отцепить(если поезд стоит)

  end

  def route_train                             #может принимать маршрут следования, при назначении автоматически находится на начальной станции

  end

  def move_station                               #перемещение между станциями, вперед-назад но только на 1 станцию

  end

  def list_train_station                         #показать, текущую, предыдущую и следущую станцию

  end

end
