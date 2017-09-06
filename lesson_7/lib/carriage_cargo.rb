class CarriageCargo < Carriage

  def initialize(capacity)
    @capacity = capacity.to_f
    @free_capacity = @capacity
  end

  def load(capacity)
    raise "Объем вагона не может быть меньше 0" if @free_capacity - capacity < 0
    @free_capacity -= capacity
  end

  def occupied_capacity
    @capacity - @free_capacity
  end

  def info_puts
    "Тип - #{self.class}, занятый объём - #{occupied_capacity}, cвободный объем - #{free_capacity}"
  end

protected

  def validate!
    raise "Объем вагона не может быть 0 " if @capacity.zero?
  end
end
