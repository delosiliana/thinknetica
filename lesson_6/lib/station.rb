class Station
  attr_accessor :name, :trains

  include Validate

#метод класса
  @@stations = []

  def initialize(name)  # названия станции
    @name = name.to_s
    @trains = []
    validate!
    @@stations << self
  end

  def self.all
    @@stations
  end

  def find
    self.class.all.find{|s| s.name == name}
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
    raise "Название должно быть больше 3 символов" if name.length < 3
    raise "Такая станция уже существует!" if find
  end
end
