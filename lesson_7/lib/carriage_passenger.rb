class CarriagePassenger < Carriage

  def initialize(number_seats)
    @number_seats = number_seats.to_i
    @busy_place = @number_seats
    super(:passenger)
  end

  def free_seat
    raise "Все места заняты" if @busy_place.zero?
    @busy_place -= 1
  end

  def taken_places
    @number_seats - @busy_place
  end

end
