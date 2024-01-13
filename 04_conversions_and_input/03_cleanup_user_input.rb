puts "Hello there, and what's your name?"
puts ''
name = gets
puts ''
puts "Your name is #{name}? What a lovely name!"
puts ''
puts "Pleased to meet you, #{name}. :)"
puts ''

# The gets takes `return` so, it brings a new line after name

# Use chomp to clear up the back of the entry

puts "Hello there, and what's your name?"
puts ''
name = gets.chomp
puts ''
puts "Your name is #{name}? What a lovely name!"
puts ''
puts "Pleased to meet you, #{name}. :)"
puts ''
