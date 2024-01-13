var1 = 2
var2 = '5'

# puts var1 + var2

# Above wouldn't work, cause we don't know if it's 7 or '25' to be

puts var1 + var2.to_i # => 7

puts var1.to_s + var2 # => '25'

# More conversions:
puts "15".to_f
puts "9.9999".to_f
puts "9.9999".to_i
puts ''
puts "5 is my favourite number!".to_i
puts "Who asked you about 5 or whatever?".to_i
puts "Your mama did.".to_f
puts ''
puts "stringy".to_s
puts 3.to_i

#!!!! puts - stands for put_string, so it converts to string
