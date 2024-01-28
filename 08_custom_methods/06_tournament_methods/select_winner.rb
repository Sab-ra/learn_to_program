def select_winner( this_match_array )
  puts
  puts "Who shall win here?"
  print "a. #{this_match_array[ 0 ]} or b. #{this_match_array[ 1 ]}: "
  puts
  while true
    answer = gets.chomp.downcase
    if( answer == 'a' || answer == 'b' )
      answer == 'a' ? match_winner = this_match_array[ 0 ] : match_winner = this_match_array[ 1 ]
      break
    else
      print "Please, answer A or B: "
    end
  end
  puts
  puts "And now #{ match_winner } goes to the next round!"
  puts
  return match_winner
end