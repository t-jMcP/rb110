CHARACTERS = Array('0'..'9')

def integer_to_string(int)
  integer_string = ''

  loop do
    int, remainder = int.divmod(10)
    integer_string << CHARACTERS[remainder]
    break if int == 0
  end

integer_string.reverse!
end


def signed_integer_to_string(int)
  string = integer_to_string(int.abs)

  if int < 0
    string.prepend('-')
  elsif int > 0
    string.prepend('+')
  else
    string
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
