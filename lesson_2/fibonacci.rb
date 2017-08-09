=begin
Заполнить массив числами фибоначчи до 100
=end

def fibonacci
  fib = [0, 1]
  until (arr = fib[-1] + fib[-2]) >100 do
    fib << arr
  end
puts fib
end
p fibonacci

