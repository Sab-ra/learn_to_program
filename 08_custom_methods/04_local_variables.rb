# Local Variables: What's inside

def double_this( num ) # num is parameter which is a local variable
  num_times_2 = num * 2 # num_times_2 is a local variable
  puts
  puts "#{ num } doubled is #{ num_times_2 }"
end

double_this( 44 )
double_this( 'Sabra' )

# local variables doesn't work outside the method
# puts num

# Local variabals are SAFE from outside, e.g.,

tough_var = "- You can't even touch my variable!"

def little_pest( what_to_destroy )
  what_to_destroy = nil
  puts "- HAHAHA! I ruined your variable!"
end

little_pest( tough_var )

puts tough_var