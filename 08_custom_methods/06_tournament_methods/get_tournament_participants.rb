# Initiate tournament participants
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
