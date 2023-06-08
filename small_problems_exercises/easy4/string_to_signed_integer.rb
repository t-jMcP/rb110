CHARACTERS = Array('0'..'9')

def string_to_integer(numeric_string)
  digits = numeric_string.chars.map { |char| CHARACTERS.index(char) }
  
  integer = 0
  digits.each { |digit| integer = 10 * integer + digit }
  integer
end

def string_to_signed_integer(numeric_string)

  if numeric_string.start_with?('+', '-') 
    unsigned_string = numeric_string[1, -1]
  else
    unsigned_string = numeric_string
  end

  integer = string_to_integer(unsigned_string)
  numeric_string.start_with?('-') ? -integer : integer
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
