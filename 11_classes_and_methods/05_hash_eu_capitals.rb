# Using array VS hash

capitals_array = []
captials_hash = {}

capitals_array[ 0 ] = "Oslo"
capitals_array[ 1 ] = "Paris"
capitals_array[ 2 ] = "Madrid"
capitals_array[ 3 ] = "Rome"

captials_hash[ "Norway" ] = "Oslo"
captials_hash[ "France" ] = "Paris"
captials_hash[ "Spain" ] = "Madrid"
captials_hash[ "Italy" ] = "Rome"

capitals_array.each do | capital |
  puts capital
end

captials_hash.each do | country, capital |
  puts "#{ country } - #{ capital }"
end