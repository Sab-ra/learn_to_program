# Break out of an infinite loop
puts ''

while "Spike" > "Angel"
  print "Say a magic word to get out! "
  user_input = gets.chomp
  puts ''
  puts user_input
  if user_input.downcase == "fuck off"
    break 
  end
end

puts "Come again soon!"