class Station
  attr_accessor :name, :trains

#метод класса
@@stations = []

  def self.all
    puts "Существуют на данный момент станции #{@@stations}"
  end

  def initialize(name)  # названия станции
    @name = name
    @trains = []
    @@stations << self
  end

  def add_train(train)  # принимает поезда
    @trains << train
  end

  def trains_by_type(type)
    @trains.group_by(&:type).each { |key, value| print "#{key}: #{value.count} " if key == type }
  end

  def depart_train(train)  # отправить поезд
    @trains.delete(train)
  end
end
