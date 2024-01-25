# to_s -- to string and join -- join the elements of an array into a string
# with a separator between each element
# The separator is the argument passed to the join method
puts
foods = [ "artichoke", "brioche", "caramel" ]

puts foods
puts
puts foods.to_s
puts
puts foods.join( " :) " ) + " 8)"

200.times do
  puts []     #the empty array holds nothing, so it puts nothing
end

200.times do
  puts [ [], [] ]
end
puts

# push -- end to the end
# pop -- take the last away, and tells what it was
# last -- just tells what the last element is

favourites = []

favourites.push( "raindrops and roses" )
favourites.push( "wiskey and kittens" )

puts favourites[ 0 ]
puts favourites.last
puts favourites.length

puts favourites.pop
puts favourites
puts favourites.length