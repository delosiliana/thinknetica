=begin
Заполнить массив числами фибоначчи до 100
=end
def fibonacci
	fib = []
	fib[1] , fib[0] = 1 , 0

	n = 1
	while n < 100 do
		n+=1
		i = fib[n-2] + fib[n-1]
		fib << i
	end
	fib.delete_if {|i| i > 100}
end

p fibonacci

