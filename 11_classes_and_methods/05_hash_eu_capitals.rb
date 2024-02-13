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

puts # butch literal loading of array VS hash

greetings = [ "hello", "hey", "what's up!" ]
smoothes = { "mongo" => "yum", "garlic" => "yuck" }

puts greetings
puts smoothes
puts smoothes[ "mongo" ]
puts smoothes[ "yuck" ] # this puts just an empty string.

puts # You can any object as a hash key.

weird_hash = Hash.new

weird_hash[ 12 ] = "monkeys"
weird_hash[ [] ] = "void"
weird_hash[ Time.new + 5 ] = "no time like the present"

weird_hash.each do | key, value |
  puts "#{ key }: #{ value }"
end

puts # arrays for similar things, hashes for different

myself = { "name" => "Keira", "pairs_of_shoes" => 5 }
imelda = { "name" => "Imelda", "pairs_of_shoes" => 7242 }

people = [ myself, imelda ]

people.each do | reveal |
  reveal.each do | name, has |
    puts "#{ name } - #{ has }"
  end
end
