# METHODS

def get_tournament_participants
  tournament_participants = []
  puts
  puts "Enter tournament participants (teams)"
  puts "one-by-one, pressing Return."
  puts "When you press Return without entering"
  puts "any name, the tournament list will form"
  puts

  entry = nil
  while entry != ''
    print "Enter a team name: "
    entry = gets.chomp.downcase.capitalize
    tournament_participants << entry
  end
  tournament_teams = tournament_participants.sort
  tournament_teams.shift
  tournament_teams
end

def form_match( teams )
  match = []
  while match.size < 2
    random_index = teams.index( teams.sample )
    match << teams.delete_at( random_index )
  end
  return match
end

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


teams = get_tournament_participants

puts "The teams are:"
puts teams

round = []
until teams.length <= 1
  round << form_match( teams )
end
puts
print round
puts 
print teams
puts
puts
round.each do | match |
  match_winner = select_winner( match )
  teams << match_winner
end
puts 
print teams
puts
puts