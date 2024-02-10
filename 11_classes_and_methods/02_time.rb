time = Time.new # The moment this code was run

soon = Time.new + 60 # One minute later

puts time
puts soon

# Construct a specific time
puts Time.new( 2000, 1, 1 )

puts Time.new( 1979, 1, 25, 16, 25 ) # When I was born

# Avoid UTC time shift mark and use UTC time

puts Time.utc( 1979, 1, 25, 11, 25 ) #When I was born with UTC