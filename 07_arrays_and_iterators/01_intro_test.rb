# Let user enter any amount of entries
# Print their entries ordered alphabetically
# upon Return click on an empty entry

user_entries = []

puts ''
puts "I'll order alphabetically whatever you enter below."
puts "Just keep entering stuff you want to order, and"
puts "when you press Return without entering, result comes!"
puts ''

entry = nil
while entry != '' do
  if entry == ''
    break
  else
    print "Make your entry: "
    entry = gets.chomp
    user_entries << entry
  end
end

ordered_result = user_entries.sort
puts ''
puts "Here we go. The ordered list of your entries:"
puts ordered_result
puts ''