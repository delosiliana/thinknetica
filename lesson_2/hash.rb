=begin
 	Сделать хеш, содеращий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30
=end
def month
		month_day = { january: 31, february: 28, march: 31, april: 30,
						may: 31, june: 30, july: 31, august: 31,
						september: 30, october: 31, november: 30, december: 31}

		month_day.delete_if {|m, d| d < 30 || d > 30 }
		puts "#{month_day}"
end

p month



