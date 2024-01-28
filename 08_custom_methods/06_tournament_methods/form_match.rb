# teams = [ 'ding', 'dong', 'shmong', 'bong', 'clang', 'zubra' ]


# Select two teams for a match
def form_match( teams )
  match = []
  while match.size < 2
    random_index = teams.index( teams.sample )
    match << teams.delete_at( random_index )
  end
  return match
end

