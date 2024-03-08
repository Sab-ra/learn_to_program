
def valid_roman_numerical?( string )
  !!( string =~ /\A[MDCLXVI]+\Z/)
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

  total = 0
  previous_value = 0

  roman_numerical.reverse.each_char do | char |
    value = roman_map[ char ]
    if value < previous_value
      total -= value
    else
      total += value
    end
    previous_value = value
  end
  total
end

result = nil

puts "Enter roman numerical"
roman_numerical_candidate = gets.chomp.upcase
puts valid_roman_numerical?( roman_numerical_candidate )
if valid_roman_numerical?( roman_numerical_candidate )
  roman_numerical = roman_numerical_candidate
  result = roman_to_int( roman_numerical )
  puts result
else
  puts "You entered not valid roman numerical: #{ roman_numerical_candidate }"
end
