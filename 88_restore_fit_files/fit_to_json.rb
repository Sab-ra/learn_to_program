# This program read a FIT file and put it's data into a JSON file.

require 'fit4ruby'
require 'json'

def read_fit_file( fit_path )
  activity_records = []
  begin
    a = Fit4Ruby.read( fit_path )
    a.each do | record |
      activity_record = {
        latitude: record[:position_lat],
        longitude: record[:position_long],
        timestamp: record[:timestamp],
        altitude: record[:altitude],
        distance: record[:distance],
        speed: record[:speed],
        temperature: record[:temperature]
      }
      activity_records << activity_record if activity_record.values.any?(&:itself)
    end
  rescue StandardError => e 
    puts "Error reading FIT file: #{ e.message }"
  end
end

def write_json_file( activity_records, output_path )
  File.open( output_path, 'w' ) do | file |
    file.write( activity_records.to_json )
  end
end

puts "Enter the path to the FIT file: "
fit_path = gets.chomp
activity_records = read_fit_file( fit_path )
write_json_file( activity_records, 'activity_records.json' )
puts "Activity records written to activity_records.json"

