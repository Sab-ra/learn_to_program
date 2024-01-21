# This program shows you leap years in any given intervall

leap_years = []

puts ''
puts "I'll give you all the leap years in an interval"
puts ''
print "Enter a year we start with: "
start_year = gets.chomp.to_i
puts ''
print "Enter a year we end with: "
final_year = gets.chomp.to_i

# Just in case user enters the filal year first
if start_year > final_year
  analyse_year = final_year
  final_year = start_year
else
  analyse_year = start_year
end


puts ''
puts "So, we are looking for interval #{ analyse_year } - #{ final_year }"
puts ''


while analyse_year <= final_year do 
  if analyse_year % 400 == 0 || ( analyse_year % 4 == 0 && analyse_year % 100 != 0 )
    leap_years << analyse_year
  end
  analyse_year += 1
end

puts "The leap years in the interval are:"
puts leap_years
puts ''