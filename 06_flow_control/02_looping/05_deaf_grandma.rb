
# Talk to your deaf grandma!

user_reply = ''
exit_user_reply = ''

puts ''
print "Set up the way you say goodbye to your grandma: "
exit_user_reply = gets.chomp

while user_reply != "#{exit_user_reply.upcase} #{exit_user_reply.upcase} #{exit_user_reply.upcase}" do
  puts ''
  puts "- ASK ME SOMETHING, CHILD! "
  puts ''
  print "- "
  user_reply = gets.chomp

  while user_reply != user_reply.upcase || 
        user_reply == exit_user_reply.upcase || 
        user_reply == exit_user_reply.upcase + ' ' + exit_user_reply.upcase  do 
    
      puts ''
      puts "- HUH?! SPEAK UP, SONNY!"
      puts ''
      print "- "
      user_reply = gets.chomp

  end
  puts ''
  puts "- NO, NOT SINCE #{ rand( 1939..2010 )}!"
  puts ''
end
puts ''
puts "- #{ user_reply } YOURSELF!"
puts ''