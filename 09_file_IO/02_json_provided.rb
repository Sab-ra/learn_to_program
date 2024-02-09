# Here's the eample from the book.

require "json"

# First, define those fancy methods )))

def json_save( object, filename )
  File.open( filename, "w" ) do | f |
    f.write( object.to_json )
  end
end

def json_load( filename )
  json_string = File.read( filename )
  JSON.parse( json_string )
end

test_array = [ "Give Quche A Chance",
            "Mutants Out!",
            "Chameleonic Life-Forms, No Thanks",
            [ 42, "42" ]
           ]

filename = "DataGadgets.txt"

json_save( test_array, filename )

read_array = json_load( filename )

puts( read_array == test_array )