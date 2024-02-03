# Old roman numbers use only addition:
# 6 = VI, 9 = VIIII - not IX
# I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000

# This method converts any number in old romans

def convert_to_old_roman( number )

  number = number.to_i

  roman_keys = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]
  roman_values = [ 1000, 500, 100, 50, 10, 5, 1 ]
  old_roman_array = []
  key_count = 0
  i = 0

  until number == 0
    if number >= roman_values[ i ]
      key_count = number / roman_values[ i ]
      old_roman_array << ( roman_keys[ i ] * key_count )
    end
    number = number - roman_values[ i ] * key_count
    i += 1
  end
  
  old_roman = old_roman_array.join
end

puts
print "Enter any number: "
user_number = gets.chomp
puts
puts "Old Roman numerical for your number is #{ convert_to_roman( user_number )}"
puts