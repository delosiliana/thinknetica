require_relative './route'
require_relative './train'

class Station
  attr_accessor :name, :trains

  def initialize(name)  # названия станции
    @name = name
    @trains = []
  end

  def add_train(train)  # принимает поезда
    @trains << train(number)
  end

  def trains_by_type(type)
    @trains.group_by(&:type).each { |key, value| print "#{key}: #{value.count} " if key == type }
  end

  def depart_train(train)  # отправить поезд
    @trains.delete(train)
  end
end
