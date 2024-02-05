require "json"      # Madam, I require the JSON.

def get_data_to_write
  data_to_write = []
  puts
  puts "Enter objects you want to record"
  puts "one-by-one, pressing Return."
  puts "When you press Return without entering"
  puts "any data, the writing will start"
  puts

  entry = nil
  while entry != ''
    print "Enter a data object: "
    entry = gets.chomp
    data_to_write << entry
  end
  data_to_write.pop
  data_to_write
end


def write_to( data, path_to_save, name_file )
  data_stringified = data.to_json
  filename = "#{ path_to_save }/#{ name_file }"
  File.open( filename, "w" ) do | f |
    f.write( data_stringified )
  end
end

def read_from( file )
  filename = file
  data_stringified = File.read( filename )
  read_data = JSON.parse( data_stringified )
end


test_array = [ "Give Quche A Chance",
            "Mutants Out!",
            "Chameleonic Life-Forms, No Thanks",
            [ 42, "42" ],
            { "Ruby": "language", "Ukrainian": "tongue", "English": "knowledge" }
           ]
puts
print "Enter/path/to/directory: "
path = gets.chomp
puts
print "Name file with .txt in the end: "
file = gets.chomp
puts
test_array = get_data_to_write

write_to( test_array, path, file )

puts read_from( path+'/'+file )