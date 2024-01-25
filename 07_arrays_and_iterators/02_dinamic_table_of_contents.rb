# Ask user for chapter titles and pages
# When user hits enter without entering chapter name,
# create table of contents based on pages order

line_of_table_of_contents = []
raw_contents = []
table_of_contents = []

parargaph_name = nil


puts
puts "I'll order your chapters by pages"
puts "Just keep answering questions"
puts "When you press return without answering, result comes!"
puts

while parargaph_name != '' do
  if parargaph_name == ''
    break
  else
    print "Put the name of the paragraph: "
    parargaph_name = gets.chomp
    line_of_table_of_contents << parargaph_name
    if parargaph_name == ''
      break
    else
      print "What's the page number?: "
      page = gets.chomp.to_i
      line_of_table_of_contents.unshift( page )
    end
    raw_contents.push( line_of_table_of_contents )
    line_of_table_of_contents = []
  end
  
end
puts
puts raw_contents.inspect

table_of_contents = raw_contents.sort_by{ | line | line[ 0 ] }

puts table_of_contents.inspect

puts
puts 
line_width = 60

puts( "Table of Contents".center( line_width ))
puts

table_of_contents.each_with_index do | paragraph_data, chapter |
  puts
  puts "CHAPTER #{ chapter + 1 }: #{ paragraph_data[ 1 ]}".ljust( line_width / 4*3 ) + "page #{ paragraph_data[ 0 ]}".rjust( line_width / 4 )
end
puts