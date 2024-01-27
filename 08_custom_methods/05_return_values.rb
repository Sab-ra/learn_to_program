# Return Values: What Comes Out

def say_moo( number_of_moos )
  puts "mooooooooo..." * number_of_moos
  "yellow submarine"
end

x = say_moo( 3 )

puts x.capitalize + ", dude..."
puts x + "."

# Methods return the last expression EVALUATED


def favourite_food( name )            # use explicit returns if edge cases are exceptions
  if name == 'Lister'
    return 'vindaloo'
  end

  if name == 'Rimmer'
    return 'mashed potatos'
  end

  "hard to say... maybe fried plantain?"

end

def favourite_drink( name )           # don't use explicit returns when stay egalitarian
  if name == "Jean-Luc"
    "tea, Earl Grey, hot"

  elsif name == "Kathrin"
    "coffee, black"

  else
    "perhaps... horchata?"
  end

end

puts favourite_food( 'Rimmer' )
puts favourite_food( 'Lister' )
puts favourite_food( 'Cassandra' )
puts
puts favourite_drink( 'Kathrin' )
puts favourite_drink( 'Q' )
puts favourite_drink( 'Jean-Luc' )
