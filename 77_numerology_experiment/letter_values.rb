# This program finds any alphabet by language code
# Then it assigns numerical values from 1 to 9 to each letter in the alphabet
# using the Pythagorean method of numerology
# Also, the program defines which letters are vowels and consonants
# The program is written by Keira Moore

ENGLISH_ALPHABET = { "a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8, "i"=>9, "j"=>1, "k"=>2, "l"=>3, "m"=>4, "n"=>5, "o"=>6, "p"=>7, "q"=>8, "r"=>9, "s"=>1, "t"=>2, "u"=>3, "v"=>4, "w"=>5, "x"=>6, "y"=>7, "z"=>8 }
ENGLISH_VOWELS = ["a", "e", "i", "o", "u"]

UKRAINIAN_ALPHABET = { "а"=>1, "б"=>2, "в"=>3, "г"=>4, "ґ"=>5, "д"=>6, "е"=>7, "є"=>8, "ж"=>9, "з"=>1, "и"=>2, "і"=>3, "ї"=>4, "й"=>5, "к"=>6, "л"=>7, "м"=>8, "н"=>9, "о"=>1, "п"=>2, "р"=>3, "с"=>4, "т"=>5, "у"=>6, "ф"=>7, "х"=>8, "ц"=>9, "ч"=>1, "ш"=>2, "щ"=>3, "ь"=>4, "ю"=>5, "я"=>6 }
UKRAINIAN_VOWELS = ["а", "е", "є", "и", "і", "ї", "о", "у", "ю", "я"]

RUSSIAN_ALPHABET = { "а"=>1, "б"=>2, "в"=>3, "г"=>4, "д"=>5, "е"=>6, "ё"=>7, "ж"=>8, "з"=>9, "и"=>1, "й"=>2, "к"=>3, "л"=>4, "м"=>5, "н"=>6, "о"=>7, "п"=>8, "р"=>9, "с"=>1, "т"=>2, "у"=>3, "ф"=>4, "х"=>5, "ц"=>6, "ч"=>7, "ш"=>8, "щ"=>9, "ъ"=>1, "ы"=>2, "ь"=>3, "э"=>4, "ю"=>5, "я"=>6 }
RUSSIAN_VOWELS = ["а", "е", "ё", "и", "о", "у", "ы", "э", "ю", "я"]

HEBRU_ALPHABET = { "א"=>1, "ב"=>2, "ג"=>3, "ד"=>4, "ה"=>5, "ו"=>6, "ז"=>7, "ח"=>8, "ט"=>9, "י"=>1, "כ"=>2, "ל"=>3, "מ"=>4, "נ"=>5, "ס"=>6, "ע"=>7, "פ"=>8, "צ"=>9, "ק"=>1, "ר"=>2, "ש"=>3, "ת"=>4 }
HEBRU_VOWELS = ["א", "ה", "ו", "י", "ע"]

GERMAN_ALPHABET = { "a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8, "i"=>9, "j"=>1, "k"=>2, "l"=>3, "m"=>4, "n"=>5, "o"=>6, "p"=>7, "q"=>8, "r"=>9, "s"=>1, "t"=>2, "u"=>3, "v"=>4, "w"=>5, "x"=>6, "y"=>7, "z"=>8, "ä"=>9, "ö"=>1, "ü"=>2, "ß"=>3 }
GERMAN_VOWELS = ["a", "e", "i", "o", "u", "ä", "ö", "ü"]

def find_alphabet( language_code )
  case language_code
  when "en"
    return ENGLISH_ALPHABET
  when "ua"
    return UKRAINIAN_ALPHABET
  when "ru"
    return RUSSIAN_ALPHABET
  when "he"
    return HEBRU_ALPHABET
  when "de"
    return GERMAN_ALPHABET
  else
    return nil
  end
end

def find_vowels( language_code )
  case language_code
  when "en"
    return ENGLISH_VOWELS
  when "ua"
    return UKRAINIAN_VOWELS
  when "ru"
    return RUSSIAN_VOWELS
  when "he"
    return HEBRU_VOWELS
  when "de"
    return GERMAN_VOWELS
  else
    return nil
  end
end

def find_consonants( language_code )
  alphabet = find_alphabet( language_code )
  vowels = find_vowels( language_code )
  consonants = alphabet.keys - vowels
  return consonants
end

def find_letter_value( alphabet, letter )
  return alphabet[letter]
end

def find_letter_type( vowels, letter )
  if vowels.include?( letter )
    return "vowel"
  else
    return "consonant"
  end
end

def find_letter_info( language_code, letter )
  alphabet = find_alphabet( language_code )
  vowels = find_vowels( language_code )
  letter_value = find_letter_value( alphabet, letter )
  letter_type = find_letter_type( vowels, letter )
  return letter_value, letter_type
end

# Main program

puts "Enter the language code (en, ua, ru): "
language_code = gets.chomp.downcase

puts "Enter full name: "
full_name = gets.chomp.downcase

full_name.each_char do | letter |
  letter_value, letter_type = find_letter_info( language_code, letter )
  puts "#{letter} - #{letter_value} - #{letter_type}"
end

# End of the program
