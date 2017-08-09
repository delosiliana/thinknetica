
p_name = []
p_one = []
number_of = []
p_price = []
name = nil


while name != "stop" do
  puts "enter please product name"
  name = gets.chomp
  p_name << name

  if name != "stop"
    puts "enter please price"
    price = gets.chomp.to_f
    p_one << price

   puts "enter please number of"
    number = gets.chomp.to_f
    number_of << number

    p_price << price * number
  end

  p_name.delete("stop")
end

sum = 0
p_price.each{|a| sum+=a}


stoimost = Hash[p_one.zip number_of]
full_purchase = Hash[p_name.zip stoimost]
full_p_price = Hash[p_name.zip p_price]


puts   full_purchase
puts "ИТОГО: #{sum}"


