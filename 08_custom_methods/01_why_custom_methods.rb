# Let's observe a tournament situation

match_1 = [ 'vanila', 'chocolate' ]
match_2 = [ 'rhubarb', 'pistachio' ]
match_3 = [] # this array will hold the semifinal winners
match_winner = nil
final_winner = nil

puts
puts "Welcome to ULTIMATE FLAVOUR SEMIFINAL!"
puts
puts "MATCH 1: Which flavour is best?"
print "a. #{ match_1[ 0 ]} or b. #{ match_1[ 1 ]}: "
puts

while true 
  answer = gets.chomp.downcase
  if( answer == 'a' || answer == 'b' )
    answer == 'a' ? match_winner = 0 : match_winner = 1
    match_3 << match_1[ match_winner ]
    break
  else
    print "Please, answer a or b: "
  end
end

puts 
puts "And now #{ match_1[ match_winner ].upcase } goes to the final round!"
puts

puts "MATCH 2: Which flavour is best?"
print "a. #{ match_2[ 0 ]} or b. #{ match_2[ 1 ]}: "
puts

while true
  answer = gets.chomp.downcase
  if( answer == 'a' || answer == 'b' )
    answer == 'a' ? match_winner = 0 : match_winner = 1
    match_3 << match_2[ match_winner ]
    break
  else
    print "Please, answer a or b: "
  end
end

puts
puts "And now #{ match_2[ match_winner ].upcase } goes to the final round!"
puts

puts "E-eee, FINAL ROUND!!! Which flavour is the best?"
print "a. #{ match_3[ 0 ]} or b. #{ match_3[ 1 ]} "
puts

while true
  answer = gets.chomp.downcase
  if( answer == 'a' || answer == 'b' )
    answer == 'a' ? match_winner = 0 : match_winner = 1
    final_winner = match_3[ match_winner ]
    break
  else
    print "Please, answer a or b: "
  end
end

puts
puts "And the Ultimate Flavour Champion e-e-e-e-is..."
puts
puts final_winner.upcase + ' ! ! !'
puts

# This code works nice. And it's UGLY code because it isn't DRY!