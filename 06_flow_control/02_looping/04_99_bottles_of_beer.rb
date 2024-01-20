# 99 bottles of beer on the wall
# print the song lyrics
bottles_on_the_wall = 99
puts ''

until bottles_on_the_wall == 0 do
  puts "#{ bottles_on_the_wall } bottles of beer on the wall, #{ bottles_on_the_wall } of beer."
  puts "Take one down and pass it around. #{ bottles_on_the_wall-1 } bottles of beer on the wall."
  puts ''

  bottles_on_the_wall -= 1
end

puts "Sang by Sabra"