=begin
	Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения
	(x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
	Если D > 0, то выводим дискриминант и 2 корня
	Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
	Если D < 0, то выводим дискриминант и сообщение "Корней нет"
	Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). Для вычисления квадратного корня, нужно использовать

	Math.sqrt

	Например,

	Math.sqrt(16)

	вернет 4, т.е. квадратный корень из 16.
=end


puts "Введите первый коэффициент:"
a= gets.to_f

puts "Введите второй коэффициент:"
b= gets.to_f

puts "Введите третий коэффициент:"
c= gets.to_f

D = b ** 2 - (4 * a * c)
sq = Math.sqrt(D)

if D > 0
	 x1 = ( ( -b + sq ) / 2 * a).round(3)
  	 x2 = ( ( b + sq ) / 2 * a).round(3)
puts "Дискриминант = #{D}. Корень x1 = #{x1.to_f}. Корень x2 = #{x2.to_f}"
  	elsif D = 0
   	x = (-b / 2 * a).to_f
puts "Дискриминант = #{D}. Корень x = #{x}"
 	else puts "Дискриминант = #{D}. Корней нет"
end
