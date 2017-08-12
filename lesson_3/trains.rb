class Station
attr_accessor :train, :name, :station

  def initialize(name)            #названия станции
    @name = name
    @all_trains = []
  end

  def taking_trained               #принимает поезда

  end

  def list_trains                      #список поездов

  end

  def send_train                     #отправить поезд

  end
end

class Route

  def name_city                       #Имена городов отправления и прибытия

  end

  def add_intermediate     #Промежуточные станции

  end

  def  delete_intermediate     #удалить промежуточную станцию

  end

  def list_city_station            #список всех станций

  end
end

class Train
  attr_reader :number, :type, :carriages

  def initialize(opt ={})                                        #создает номер, тип(пассажирский, грузовой),и количество вагонов
    @number = opts[:number]
    @type = opts[:type]
    @carriages = opts[:carriages].to_i
    stop
  end

  def increments_speed                                   # может набирать скорость, возвращать текуюую, тормозить.
    @initial_speed +=10
  end

  def reset_speed
    stop
  end

  def carriage(option)                #прицепить\отцепить(если поезд стоит)
    reset_speed
    @carriages +=1 if option == 'attach'
    @carriages -=1 if option == 'unhook'
  end

  def list_the_car                          #показать количество вагонов
    puts "Количество вагонов в поезде: #{carriages}"
  end

  def route_train                             #может принимать маршрут следования, при назначении автоматически находится на начальной станции

  end

  def move_station                               #перемещение между станциями, вперед-назад но только на 1 станцию

  end

  def list_train_station                         #показать, текущую, предыдущую и следущую станцию

  end

  private

  def stop
    @initial_speed = 0
  end
end
