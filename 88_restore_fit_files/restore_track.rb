# This program will restore the track files from the fit files
# It requires the original track as a GPX or GPX.XML file placed in the directory ./original_route
# It requires the fit file to be restored placed in the directory ./put_uncompleted_fit_here
# It will create a new fit file in the directory ./restored_fit_files
# The script requires the gem 'rubyfit' to work with the FIT files
# The script requires the gem 'nokogiri' to work with the GPX files

require 'rubyfit'
require 'nokogiri'
require 'time'

# Read the GPX file and extract the track points
def read_gpx_file( gpx_path )
  track = []
  begin
    doc = Nokogiri::XML( File.open( gpx_path ))
    doc.xpath( '//xmlns:trkpt' ).each do | trkpt |
      track << [ trkpt[ 'lat' ].to_f, trkpt[ 'lon' ].to_f]
    end
  rescue StandardError => e
    puts "Error reading GPX file: #{ e.message }"
  end
  track
end

# Method to read the FIT file and extract the actual track data
def read_fit_file( fit_path )
  activity_records = []
  begin
    fit_file = RubyFit::File.new( fit_path )
    fit_file.records.each do | record |
      activity_records << [ record.lattitude, record.longitude, record.timestamp, record.altitude, record.distance, record.speed, record.temperature ]
    end
  rescue StandardError => e 
    puts "Error reading FIT file: #{ e.message }"
  end
  activity_records
end

# Method to capture user finish time in FIT format
def capture_finish_time
  puts "Enter your finish time in FIT format (YYYY-MM-DD HH:MM:SS): "
  finish_time = gets.chomp
  finish_time
end

# Method to restore the track data from the GPX file to the FIT file
# Point by point: 
# 1. Read the track data from the GPX file (long, lat)
# 2. Read the activity records from the FIT file (long, lat, time, alt, dist, speed, temp)
# 3. If track long, lat is doesn't match the activity long, lat, +- 10 meters, insert the track data into the activity records
# Use average of the previous and the next track point to fill in the missing data
# Use the finish time to determine the end of the activity
# 4. Write the restored activity records to a new FIT file
def restore_track( track, activity_records, finish_time, output_path )
  restored_records = []
  track_index = 0
  finish_time = Time.parse( finish_time )
  activity_records.each do | record |
    if track_index < track.length
      track_point = track[ track_index ]
      if ( record[ 0 ] - track_point[ 0 ] ).abs > 0.0001 || ( record[ 1 ] - track_point[ 1 ] ).abs > 0.0001
        # Insert the track data into the activity records
        restored_records << [ track_point[ 0 ], track_point[ 1 ], record[ 2 ], record[ 3 ], record[ 4 ], record[ 5 ], record[ 6 ]]
      else
        restored_records << record
        track_index += 1
      end
    else
      restored_records << record
    end
  end

  # Write the restored records to a new FIT file
  begin
    restored_fitfile = RubyFit::File.new
    restored_records.each do | record |
      restored_fitfile << record
    end
    File.open( output_path, 'wb' ) do | f |
      f.write( restored_fitfile.to_bin )
    end
    puts "Restored file saved to #{ output_path }"
  rescue StandardError => e
    puts "Error writing FIT file: #{ e.message }"
  end
end

# Method to make sure that the input path is valid and handle change file name
def valid_path?( path )
  File.exist?( path )
  if !File.exist?( path )
    puts "Invalid path: #{ path }"
    puts "Please enter a valid path: "
  end
  path
end

# Method to make sure that the output path is valid and handle change file name
def valid_output_path?( output_path )
  if File.exist?( output_path )
    puts "Output file already exists. Do you want to overwrite it? (y/n)"
    answer = gets.chomp
    if answer.downcase != 'y'
      puts "Please enter a new output path: "
      output_path = gets.chomp
      valid_output_path?( output_path )
    end
  end
  output_path
end

# Main program
path_to_gpx = '/Users/sabra/repos/learn_to_program/88_restore_fit_files/original_route/101.gpx'
path_to_fit = '/Users/sabra/repos/learn_to_program/88_restore_fit_files/put_uncomplited_fit_here/activity_uncompleted.fit'
output_path = '/Users/sabra/repos/learn_to_program/88_restore_fit_files/restored_fit_files/activity_restored.fit'

path_to_gpx = valid_path?( path_to_gpx )
path_to_fit = valid_path?( path_to_fit )
output_path = valid_output_path?( output_path )

track = read_gpx_file( path_to_gpx )
activity_records = read_fit_file( path_to_fit )
finish_time = capture_finish_time

restore_track( track, activity_records, finish_time, output_path )

puts "You are the champion!"



