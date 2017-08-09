=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end
def alphabet
	letters = ('a'..'z').to_a
	letters_array = ['a', 'e', 'i', 'o', 'u', 'y']
	letters_hash ={}

	letters.each_with_index{ |v, i| letters_hash[v] = i+1 if letters_array.include? v}
	puts letters_hash
end

p alphabet
