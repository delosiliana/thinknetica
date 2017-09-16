class Carriage
  include Manufacturer
  attr_reader :type, :num

  def initialize(num, type)
    @type = type
    @num = num
  end
end
