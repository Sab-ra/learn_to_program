# Figure what the first five digits of the tax-id

def tax_id_dob( birth_year, birth_month, birth_day )
  tax_zero_time = Time.utc( 1899, 12, 31 )
  birthday = Time.utc( birth_year, birth_month, birth_day )
  tax_id_dob = ( birthday - tax_zero_time ) / ( 60*60*24 )
  tax_id_dob.to_i
end

print "What's your birthday year? "
byear = gets.chomp
puts
print "What's your birthday month? "
bmonth = gets.chomp
puts
print "What's your bithday day? "
bday = gets.chomp

tax_id_starts_with = tax_id_dob( byear, bmonth, bday )

puts
puts "Your Tax-ID shall start with: #{ tax_id_starts_with } 😊"
puts