=begin
Заполнить массив числами фибоначчи до 100
=end
def fibonacci
  fib = [0, 1]
  until fib[-1] + fib[-2] > 100 do
    fib<< fib[-1] + fib[-2]
  end
    p fib
end


p fibonacci

