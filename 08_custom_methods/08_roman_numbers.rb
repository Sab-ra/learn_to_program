# Roman numbers use addition of keys, but for 4 and 9:
# 6 = VI, 9 = IX, not VIIII, 4 = IV, not IIII
# I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000

# This method converts any number in roman numerical

def convert_to_roman( number )

  number = number.to_i

  roman_keys = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]
  roman_values = [ 1000, 500, 100, 50, 10, 5, 1 ]
  roman_array = []
  key_count = 0
  i = 0

  until number == 0
    if number >= roman_values[ i ]
      key_count = number / roman_values[ i ]
      if number == 9
        roman_array << ( roman_keys[ 6 ] + roman_keys[ 4 ])
        break
      elsif number == 4
        roman_array << ( roman_keys[ 6 ] + roman_keys[ 5 ])
      else
        roman_array << ( roman_keys[ i ] * key_count )
      end
    end
    number = number - roman_values[ i ] * key_count
    i += 1
  end
  
  roman = roman_array.join
end

puts
print "Enter any number: "
user_number = gets.chomp
puts
puts "Roman numerical for your number is #{ convert_to_roman( user_number )}"
puts