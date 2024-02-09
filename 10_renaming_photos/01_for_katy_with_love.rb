# For Katy with love

# This is where she stores her photos.
# Just for my own convenience, I'll go there now.

Dir.chdir( "/Users/keiramoore/Pictures/ruby_sorted" )

# First we find all of the downloaded photos to be moved.

pic_names = Dir[ "/Users/keiramoore/Downloads/**/*.{ jpeg,JPG,JPEG,HEIC,gpg,heic }" ]

puts "What would you like to call this batch?"
batch_name = gets.chomp

puts
print "Downloading #{ pic_names.length } files: "

# This will be our counter. We'll start at 1 today,
# though normally I like to count from 0.

pic_number = 1

pic_names.each do | name |

  print "." # This is our progress bar

  new_name = if pic_number < 10
    "#{ batch_name }_0#{ pic_number }.jpg"
  else
    "#{ batch_name }_#{ pic_number }.jpg"
  end

  # This renames the phote, but since 'name'
  # has a big long path on it, and 'new_name'
  # doesn't, it also moves the file to the
  # current working directory, which is now
  # Pictures folder.
  # Since it's a *move*, this effectively
  # downloads and deletes the originals.

  # And since it's a memory card, not a 
  # hard drive, each of these takes a second
  # or so; hence, the little dots let her
  # know that the program isn't hanging.
  File.rename( name, new_name )
  pic_number += 1
end

puts
puts "Done, cutie!"