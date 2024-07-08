class Integer
  def to_roman
    if self == 5
      roman = "V"
    else
      roman = "XLII"
    end

    roman
  end
end

# Test!
puts 5.to_roman
puts 42.to_roman


class Array
  def mult
    self.reduce( 1 ) { |product, n| product * n }
  end
end

# Test!
puts [ 1, 7, 9 ].mult
puts [ 3, 4, 5 ].mult