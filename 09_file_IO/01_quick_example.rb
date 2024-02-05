#
# The filename doesn't have to end with ".txt",
# but since it's valid text, why not?

filename = "09_file_IO/01_ListerQuote.txt"

test_string = "I promice that I swear absolutely that " +
              "I'll never mention gaspacho soup again."

# The 'w' here is for write-access to the file,
# since we are trying to write to it.

File.open( filename, "w" ) do | f |
  f.write( test_string )
end

read_string = File.read( filename )

puts( read_string == test_string )