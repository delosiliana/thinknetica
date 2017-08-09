=begin
Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом).
Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за
единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end
def basket
	full_n = []
	full_p = []
	number_of = []
	full_price = []
	name = nil

	while name != "stop" do
		puts "Enter product name or stop"
		name = gets.chomp
		full_n << name

		if name != "stop"
		puts "Enter price product?"
		price = gets.chomp.to_f
		full_p << price

		puts "how much  a product you have purchased?"
		number = gets.chomp.to_f
		number_of << number

		full_price << price * number
	end
		full_n.delete("stop")
	end

	sum = 0
	full_price.each{|a| sum +=a}

	the_cost = Hash[full_p.zip number_of]
	full_purchase = Hash[full_n.zip the_cost]

	puts full_purchase
	puts "Total amount is: #{sum}"
end

p basket
