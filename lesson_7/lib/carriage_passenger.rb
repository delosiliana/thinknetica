class CarriagePassenger < Carriage

  def initialize(seats)
    @seats = seats.to_i
    validate!
    @occupied_place = @seats
  end

  def occupied_seat
    raise "Все места заняты" if @occupied_place.zero?
    @occupied_place -= 1
  end

  def free_places
    @seats - @occupied_place
  end

  def puts_info
    "тип #{self.class}, занято  мест - #{occupied_place}, свободных мест -#{free_places}"
  end

  protected

  def validate!
    raise "Количество мест не должно быть 0" if @seats < 1
  end
end
