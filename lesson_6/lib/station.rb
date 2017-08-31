class Station
  attr_accessor :name, :trains

  include Validation

#метод класса
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)  # названия станции
    @name = name
    validate!
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

  protected

  def validate!
    raise "Такая станция уже существует!" if self.class.all.find{|s| s.name == name}
    raise "Название должно быть больше 3 символов" if name.length < 3
    raise "Отсутствует название станции!" if name.to_s.empty?
  true
  end
end
