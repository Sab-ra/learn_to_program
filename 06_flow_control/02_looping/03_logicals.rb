i_am_keira = true
i_am_green = false
i_like_beer = true
i_eat_rocks = false

puts ''
puts i_am_keira && i_like_beer
puts i_like_beer && i_eat_rocks
puts i_am_green && i_like_beer
puts i_am_green && i_eat_rocks
puts ''
puts i_am_keira || i_like_beer
puts i_like_beer || i_eat_rocks
puts i_am_green || i_like_beer
puts i_am_green || i_eat_rocks
puts ''
puts !i_am_keira
puts !i_am_green
puts ''
puts i_am_keira || i_like_beer # one or another or both

