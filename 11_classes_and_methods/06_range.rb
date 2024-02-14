# You can range everything,
# but Chris does range only integers :)

numbers = 1..5

puts( [ 1,2,3,4,5 ] == numbers.to_a )
puts numbers

puts # Iterate over a range of strings:

( "a".."z" ).each do | letter |
  print letter
end
puts 

# You can even range emojies!

# Range for a subset of emojis (e.g., 0x1F600 to 0x1F64F for emoticons)
( 0x1F600..0x1F64F ).each do | emoji |
  print [ emoji ].pack( 'U*' ) + ' '
end
puts

puts

god_bless_the_90s = 1990..1999

puts god_bless_the_90s.min
puts god_bless_the_90s.max
puts god_bless_the_90s # .avg won't work

puts( god_bless_the_90s.include?( 1999 ))
puts( god_bless_the_90s.include?( 2000 ))
puts( god_bless_the_90s.include?( 1994.5 ))