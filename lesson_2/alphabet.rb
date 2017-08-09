=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end
def alphabet
  letters = ('a'..'z').to_a
  letters_hash ={}

  letters.each_with_index{ |v, i| letters_hash[v] = i+1 if %w( a e i o u y).include? v}
  puts letters_hash
end

p alphabet


