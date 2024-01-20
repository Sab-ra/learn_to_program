# Echo input till Goodbye
puts ''

input = ""

while input.downcase != "goodbye"
  puts input.upcase  
  print "What you have for me? "
  input = gets.chomp
end

puts ''
puts "Come again soon!"