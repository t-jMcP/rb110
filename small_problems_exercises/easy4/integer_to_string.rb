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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
