# Convert roman numbers to integers

# accept user input
  # upcase
# verify that user input is a valid roman
  # all characters are valid
# convert to int




def validate_roman_chars( upcase_string )
  i = 0
  roman_sequence = []
  roman_char = false
  valid_chars = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]
  while i < upcase_string.length
    print '.'
    char = upcase_string[ i ]
    valid_chars.each do | check |
      if char == check
        roman_char = true
        roman_sequence << char
        break
      else
        roman_char = false
        roman_sequence = []
      end
    end
    roman_char == true ? i += 1 : i = upcase_string.length
  end
  return roman_sequence
end

def roman_to_int( array )
  roman_map = { 
    'M' => 1000,
    'D' => 500,
    'C' => 100,
    'L' => 50,
    'X' => 10,
    'V' => 5,
    'I' => 1
  }

  value = 0
  previous_value = 0

  array.reverse.each do | char |
    value = roman_map[ char ]
    if value < previous_value
      value -= value
    else
      value += value
    end
    previous_value = value
  end
end


roman_numerical = false

while roman_numerical != true 
  puts "Enter a Roman numerical"
  roman_numerical = gets.chomp.upcase
  roman_chars = validate_roman_chars( roman_numerical )
  if roman_chars == false
    puts "Invalid Roman numerical"
  else
    roman_to_int( roman_chars )
  end
end
puts "The Roman numerical #{ roman_numerical } is #{ roman_to_int }"