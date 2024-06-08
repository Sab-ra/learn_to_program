# Moves photos from a source directory to a destination directory and renames them in the process.

# Steps:
# 1. Ask the user for the name of the source directory.
# 1.1 Check if the source directory exists.
# 1.2 If it doesn't exist, ask the user for the name of the source directory again.
# 1.3 Check if the access allowed to the source directory.
# 1.4 Await the user to grant access to the source directory.
# 2. Ask the user for the name of the destination directory in Pictures.
# 3. Ask the user in what format the photos shall be saved.
# 4. Create the destination directory if it doesn't exist.
# 5. Retrieve the photos metadata, and create a subdirectories in the destination directory for each date the photos were taken. If such destination directory and subdirectory exist, don't overwrite.
# 5.1 Handle the case when the photo has no date in metadata, by creating a subdirectory for the date when the photo was moved.
# 6. Ask the user for the name of the batch.
# 7. Move the photos to the destination directory subdirectories and rename them in the process as <batch_name>_<photo_number>.<format>.
# 8. Print the number of photos moved to each subdirectory of the destination directory.
# 9. Print the number of photos moved in total.
# 10. Print the number of photos that couldn't be moved.
# 11. Print the number of photos that were moved successfully.
# 12. Print the number of photos that were moved successfully and had a duplicate in the destination directory.
# 13. Print the number of photos that were moved successfully and had a duplicate in the destination directory, and were overwritten.

# Expected output: "Done, love! All photos are now in #{ destination }. Have a great day!"

require "mini_exiftool"
require "fileutils"

def extract_date( photo )
  date = photo.date_time_original
  if date.nil?
    date = Time.now.strftime( "%Y-%m-%d" )
  else
    date = date.strftime( "%Y-%m-%d" )
  end
end

def name_photo( pic_number, batch_name, format )
  if pic_number < 10
    "#{ batch_name }_0#{ pic_number }.#{ format }"
  else
    "#{ batch_name }_#{ pic_number }.#{ format }"
  end
end

puts
puts "Frow where would you like to move the photos?"
source = gets.chomp

if source == ""
  source = "/Users/sabra/Downloads/"
end

while !Dir.exist?( source )
  puts
  puts "Directory doesn't exist. Plese enter the name of the source directory again."
  source = gets.chomp
end

puts
puts "Source directory #{ source } exists."

puts
puts "What would you like to call the directory in Pictures where you want to move the photos?"
puts "If you want to save in Pictures, just press Enter."
destination = gets.chomp
destination = destination + "/"

path_to_pictures = "/Users/sabra/Pictures/"

Dir.chdir( path_to_pictures )

if destination == ""
  destination = path_to_pictures
end

if !Dir.exist?( destination )
  Dir.mkdir( destination )
  puts 
  puts "Directory #{ destination } created."
else
  puts 
  puts "Directory #{ destination } already exists."
end

Dir.chdir( source )

Dir.glob( "**/*.{ HEIC,heic,JPEG,jpeg,JPG,jpg,PNG,png }" )  do | name |
  photo = MiniExiftool.new( name )
  date = extract_date( photo )
  Dir.chdir( path_to_pictures + destination )
  if !Dir.exist?( date )
    Dir.mkdir( date )
    puts
    puts "Directory #{ date } created."
  else
    puts
    puts "Directory #{ date } already exists."
  end
  Dir.chdir( source )
end

puts
puts "What would you like to call this batch?"
puts "If you just hit Enter, the batch will be named after the current date."
batch_name = gets.chomp
if batch_name == ""
  batch_name = Time.now.strftime( "%Y-%m-%d" )
end

puts 
puts "What format would you like to save the photos in?"
puts "If you want to save in PNG, just press Enter."
format = gets.chomp.downcase
if format == ""
  format = "png"
end

Dir.chdir( source )

Dir.glob( "**/*.{ HEIC,heic,JPEG,jpeg,JPG,jpg,PNG,png }" )  do | name |
  photo = MiniExiftool.new( name )
  date = extract_date( photo )
  Dir.chdir( "#{ path_to_pictures }#{ destination }#{ date }" )
  pic_number = 1
  new_name = name_photo( pic_number, batch_name, format ) 
  while File.exist?( new_name )
    pic_number += 1
    new_name = name_photo( pic_number, batch_name, format )
  end
  FileUtils.cp( File.join( source, name ), new_name )
  puts "File #{ name } moved to #{ destination + date } as #{ new_name }."
  Dir.chdir( source )
end

puts
puts "Done, love! All photos are now in #{ destination }. Have a great day!"


