# This program reads txt file and writes to json file
# It also reads json file and writes to txt file
# It converts different date formats to a standard format
# It reads in names and birthdates from a txt file
# It should then ask you for a name and return the birthdate of that person
# It should also ask you for a birthdate and return the name of the person with that birthdate
# The test input file is ./dob_input.txt
# The test output file is ./dob_db.json
# The test output has data already in it
# Write in test output only records that you want to add to the file

require 'json'
require 'date'

# Define the method to read the file and create a ['name', 'birthdate'] hash from each line
# Each line is in format: 'firstname lastname, month day, year'

def read_birthday_input( file )
  people = []
  file = File.open( file, 'r' )
  file.each_line do |line|
    line = line.split( ',' )
    name = line[ 0 ]
    date = line[ 1 ].split( ' ' )
    month = date[ 0 ]
    day = date[ 1 ]
    year = line[ 2 ]
    # Convert the date to a standard format YYYY-MM-DD
    birthdate = Date.parce( "#{year}, #{month}, #{ day }" ).strftime( '%Y-%m-%d' )
    # Create a hash with the name and birthdate
    person = { name: name, birthdate: birthdate }
    # Add the hash to the array
    people << person
  end
end

# Define the method to write the hash to a json file

# Read each line from ./dob_input.txt and convert it to a hash



# Convirt the date to a standard format
# Ask user for a name and return the birthdate and how old the person is