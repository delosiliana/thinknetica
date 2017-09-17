class Station
  attr_accessor :name, :trains

  include Validation

  # metod class
  @@stations = []

  validate :name, :presence

  def initialize(name)  # name station
    @name = name.to_s
    @trains = []
    validate!
    @@stations << self
  end

  def self.all
    @@stations
  end

  def find
    self.class.all.find { |s| s.name == name }
  end

  def add_train(train)  # arrival train station
    @trains << train
  end

  def trains_by_type(type)
    @trains.group_by(&:type).each { |key, value| print "#{key}: #{value.count} " if key == type }
  end

  def depart_train(train) # depart train station
    @trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield train }
  end

  protected

  # def validate!
  #  raise 'Название должно быть больше 3 символов' if name.length < 3
  #  raise 'Такая станция уже существует!' if find
  # end
end
