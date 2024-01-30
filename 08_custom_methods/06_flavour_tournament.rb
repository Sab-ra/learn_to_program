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
  puts "#{ match_winner } wins the match!"
  puts
  return match_winner
end

round = 1
teams = get_tournament_participants
line_width = 70

puts "The teams are:"
puts teams


puts
puts "ROUND #{ round }!"
puts

matches_in_round = []

until teams.length <= 1
  matches_in_round << form_match( teams )
end

puts
matches_in_round.each do | match |
  puts( match.join( " -- " ).center(line_width))
end
puts 
print teams
puts
puts
matches_in_round.each do | match |
  match_winner = select_winner( match )
  teams << match_winner
end
puts 

if teams.length == 1
  puts "The WINNER of the tournament"
  puts "Ladies and Gents, e-e-e-i-s..."
  puts teams.join.upcase + ' ! ! !'
elsif teams.length == 2
  puts "The final will be played between"
  puts teams
elsif teams.length <= 4
  puts "The teams in semi-final are"
  puts teams
else 
  puts "Teams that go to the next round:"
  puts teams
end
puts
