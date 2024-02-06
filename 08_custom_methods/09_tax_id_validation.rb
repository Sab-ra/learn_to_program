# Code to validate a Ukrainian tax ID (Individual Tax Number, ITN)
# The tax ID is a 10-digit number, where the last digit is a checksum
# The checksum is calculated as follows:
# 1. Multiply the first 9 digits by the weights [ -1, 5, 7, 9, 4, 6, 10, 5, 7 ]
# 2. Sum the products
# 3. Calculate the remainder of the sum divided by 11
# 4. Calculate the remainder of the result divided by 10
# 5. The result should be equal to the last digit of the tax ID
# 
# Assembled by Keira Moore 
# from the following source:
# https://github.com/lozik4/UkrTaxIdGenerator/blob/main/tax_id_generator/tax_id_gen.py
#

class UkrainianTaxIdValidator
  def initialize( tax_id )
    @tax_id = tax_id
    @weights = [ -1, 5, 7, 9, 4, 6, 10, 5, 7 ]
  end

  def valid?
    return false unless valid_format?

    checksum == provided_checksum
  end

  private

  def valid_format?
    @tax_id.match?( /^\d{10}$/ )
  end

  def checksum
    sum = @tax_id.chars.first( 9 ).each_with_index.sum do | digit, index |
      digit.to_i * @weights[ index ]
    end
    sum % 11 % 10
  end

  def provided_checksum
    @tax_id[ -1 ].to_i
  end
end

# Example usage

puts
print "Enter the tax ID to validate: "

tax_id = gets.chomp
puts
validator = UkrainianTaxIdValidator.new( tax_id )
if validator.valid?
  puts "The Tax ID is valid."
else
  puts "The Tax ID is invalid."
end
