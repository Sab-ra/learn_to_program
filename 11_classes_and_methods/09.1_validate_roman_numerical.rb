def validate_roman_chars( upcase_string )
  i = 0
  roman_numerical_array = []
  roman_char = false
  valid_chars = [ 'M', 'D', 'C', 'L', 'X', 'V', 'I' ]
  while i < upcase_string.length
    print '.'
    char = upcase_string[ i ]
    valid_chars.each do | check |
      if char == check
        roman_char = true
        roman_numerical_array << char
        break
      else
        roman_char = false
        # roman_numerical_array = []
      end
    end
    roman_char == true ? i += 1 : i = upcase_string.length
  end
  puts
  roman_numerical_array.to_s
end

candidate = 'XLLL'

puts roman_numerical = validate_roman_chars( candidate )

