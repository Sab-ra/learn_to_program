# What's your favourite number, by Sabra

puts ''
puts "Hi, what's your favourite number?"
puts ''
print "Etner number and hit return: "
user_input_number = gets.chomp.to_i
system_favourite_number = user_input_number + 1
puts ''
puts "You were so close!"
puts "Your favourite number is #{ user_input_number }."
puts "And mine is #{ system_favourite_number }."
puts ''
puts "The greater - the better"
puts ''
