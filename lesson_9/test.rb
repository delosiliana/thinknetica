require_relative './lib/accessors'

class Test
  extend Accessors

  attr_accessor_with_history :one, :two, :three
  strong_attr_accessor :alphabet, Integer
end

test = Test.new

test.one = 11_111
test.one = [12, 24, 48]
test.one = 'string'

test.two = 1_111_111
test.two = 2_222_222

# puts test.inspect

print 'one history: ', test.one_history.inspect, "\n"
print 'two history: ', test.two_history.inspect, "\n"
print 'three history: ', test.three_history.inspect, "\n"

test.alphabet = 12
puts test.inspect
