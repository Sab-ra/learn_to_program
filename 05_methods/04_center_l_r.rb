# Poem will look prettier

puts ''

line_width = 50

puts ( "Old Mother Hubbard".center( line_width ))
puts ( "Sat in her cupboard".center( line_width ))
puts ( "Eating her curds and whey,".center( line_width ))
puts ( "When along came a spider".center( line_width ))
puts ( "Who sat down beside her".center( line_width ))
puts ( "And scared he poor shoe dog away.".center( line_width ))

puts ''

line_width = line_width - 10
str = "==> text <=="

puts( str.ljust( line_width ))
puts( str.center( line_width ))
puts( str.rjust( line_width ))
puts( str.ljust( line_width / 2 ) + str.rjust( line_width / 2 ))

puts ''