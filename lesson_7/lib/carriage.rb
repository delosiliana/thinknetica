class Carriage
  include Manufacturer
  attr_reader :type, :number

  def initialize(number, type)
    @type = type
    @number = number
  end
end
