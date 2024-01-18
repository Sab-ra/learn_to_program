# Let's start start simple:
system_asks_name = "Hello, what's your name? "

puts ''
print system_asks_name
name = gets.chomp
puts ''

puts "Hello, #{ name }"

if name == "Keira"
  puts "What a lovely name!"
end
puts ''

# Let's add the second option

puts "Imagine, you came to a fortune taller..."
puts ''
print system_asks_name
name = gets.chomp
puts ''
if name == "Keira" 
  puts "I see great things in your future."
else
  puts "Your future is .. oh my! Look at the time!"
  puts "I really have to go. Sorry!"
end
puts ''

# Well, branches from branches
puts "Hello, and welcome to seventh grade English."
puts ''
puts "My name is Mrs. Gabbard. And your name is...?"
puts ''
name = gets.chomp

if name == name.capitalize
  puts "Please, take a seat, #{ name }."
else
  puts "#{ name }? You mean #{ name.capitalize }, right?"
  puts "- Don't you even know how to spell your name??"
  puts ''
  print "- "
  reply = gets.chomp
  puts ''
  if reply.downcase == "yes"
    puts "Hmmph! Well, sit down!"
  else
    puts "GET OUT!!!"
  end
end
puts ''
