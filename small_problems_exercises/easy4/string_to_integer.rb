CHARACTERS = Array('0'..'9')

def string_to_integer(numeric_string)
  digits = numeric_string.chars.map { |char| CHARACTERS.index(char) } 
  
  integer = 0
  digits.each { |digit| integer = 10 * integer + digit }
  integer
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
