# Convert roman numbers to integers

# accept user input
  # upcase
# verify that user input is a valid roman
  # all characters
  # sequence check

# convert to int
  # check last two char for 9 and 4
  # summ backwards



def validate_roman_chars( upcase_string )
  i = upcase_string.length - 1
  roman_char = false
  valid_chars = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]
  while i > -1 
    print '.'
    char = upcase_string[ i ]
    valid_chars.each do | check |
      if char == check
        roman_char = true
        break
      else
        roman_char = false
      end
    end
    roman_char == true ? i -= 1 : i = -1
  end
  return roman_char
end

def validate_roman_sequence( roman_chars_string )
  sequence_valid = false
  length = roman_chars_string.length
  control_left = 'M'
  control_right = nil
  roman_keys = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]

  if length == 1
    sequence_valid = true
  end

  if roman_chars_string[ -2, 2 ] == 'IX'
    length = length - 2
    control_right = 'IX'
  elsif roman_chars_string[ -2, 2 ] == 'IV'
    length = length - 2
    control_right = 'IV'
  end
  if length == 0
    sequence_valid = true
  end

  i = 0 
  while i < length
    roman_keys.each do | key |
      if roman_chars_string[ i ] == key
        sequence_valid = true
        control_left = key
        if control_left == 'D'
          roman_keys = [ 'D', 'C', 'L', 'X', 'V', 'I' ]
        elsif control_left == 'C'
          roman_keys = [ 'C', 'L', 'X', 'V', 'I' ]
        elsif control_left == 'L'
          roman_keys = [ 'L', 'X', 'V', 'I' ]
        elsif control_left == 'X'
          roman_keys = [ 'X', 'V', 'I' ]
        else
          roman_keys = [ 'I' ]
        end
      
      end
    end
    i += 1
  end

  sequence_valid
end

puts
puts "Enter a Roman numerical"
roman_numerical = gets.chomp.upcase
puts
roman_chars = validate_roman_chars( roman_numerical )
puts
puts "Input uses Roman chars? #{ roman_chars }"
puts
roman_sequence = validate_roman_sequence( roman_numerical )
puts "Sequence #{ roman_sequence }"