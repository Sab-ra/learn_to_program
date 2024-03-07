# Convert roman numbers to integers

# accept user input
  # upcase
# verify that user input is a valid roman
  # all characters are valid
# convert to int




def validate_roman_chars( upcase_string )
  i = 0
  roman_numerical = ''
  roman_char = false
  valid_chars = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]
  while i < upcase_string.length
    print '.'
    char = upcase_string[ i ]
    valid_chars.each do | check |
      if char == check
        roman_char = true
        roman_numerical = "#{ roman_numerical }#{ char }"
        break
      else
        roman_char = false
        roman_numerical = nil
      end
    end
    roman_char == true ? i += 1 : i = upcase_string.length
  end
  roman_numerical
end

def roman_to_int( roman_numerical )
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

  roman_numerical.reverse.each_char do | char |
    value = roman_map[ char ]
    if value < previous_value
      value -= value
    else
      value += value
    end
    previous_value = value
  end
end


result = nil

while result != true 
  puts "Enter a Roman numerical"
  potential_roman_numerical = gets.chomp.upcase
  roman_numerical = validate_roman_chars( potential_roman_numerical )
  if roman_numerical == false
    puts "Invalid Roman numerical"
  else
    result = roman_to_int( roman_numerical )
  end
end
puts "The Roman numerical #{ roman_numerical } is #{ result }"