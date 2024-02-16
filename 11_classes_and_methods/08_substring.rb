# [] method works to make substrings. Negative counts from the end.

prof = "We tore the universe a new space hole, alright!"
puts prof[ 12, 8 ]
puts prof[ 12..19 ] # 8 characters total
puts

def is_avi?( filename )
  filename.downcase[ -4..-1 ] == ".avi"
end

# Vicarious embarrassment.

puts is_avi?( "DANCEMONKEYBOY.AVI" )

# Hey, I wasn't even 2 years old at the time...
puts is_avi?( "toilet_paper_fiasco.jpg" )