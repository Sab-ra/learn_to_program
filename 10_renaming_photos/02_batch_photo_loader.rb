# Moves photos from Downloads to the destination directory
# and renames them in the process.

puts "How would you name directory in Pictures where you want to move the photos?"
puts "If you want to save in Pictures, just press Enter."
destination = gets.chomp

path = "/Users/sabra/Pictures/"

Dir.chdir( path )

if !Dir.exist?( destination )
  Dir.mkdir( destination )
end

Dir.chdir( destination )

puts "What would you like to call this batch?"
batch_name = gets.chomp

pic_to_move = Dir[ "/Users/sabra/Downloads/**/*.{ HEIC,heic,JPEG,jpeg,JPG,jpg,PNG,png }" ]

puts
print "Moving #{ pic_to_move.length } files: "

pic_number = 1

pic_to_move.each do | name |
  print "."

  new_name = if pic_number < 10
    "#{ batch_name }_0#{ pic_number }.png"
  else
    "#{ batch_name }_#{ pic_number }.png"
  end

  if File.exist?( new_name )
    puts "File already exists. Exiting."
    exit 
  else
    File.rename( name, new_name )
  end

  pic_number += 1
end

puts
puts "Done, love! All photos are now in #{ destination }. Have a great day!"
