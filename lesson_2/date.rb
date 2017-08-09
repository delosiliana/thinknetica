=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты,
начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого
вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru
=end

def day_date

  puts "Введите число месяца"
  day = gets.chomp.to_i

  puts "Введите месяц"
  month = gets.chomp.to_i

  puts "Введите год"
  year = gets.chomp.to_i

  month_arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  if year % 4 == 0 && year % 100 !=0 || year % 400 == 0
    month_arr[1] = 29
  end

  num = 0
  y = 0

  while y < month
    num += month_arr[y]
    y +=1
  end

  num+=day

  puts "Прошло с начала года #{day + num} дней"
end

p day_date
