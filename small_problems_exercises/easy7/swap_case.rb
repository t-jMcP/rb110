LOWER_CASE = Array('a'..'z')
UPPER_CASE = Array('A'..'Z')

def swapcase(input_string)
  input_string.chars.each_with_object("") do |char, swapped_string|
    if LOWER_CASE.include?(char)
      swapped_string << UPPER_CASE[LOWER_CASE.index(char)]
    elsif UPPER_CASE.include?(char)
      swapped_string << LOWER_CASE[UPPER_CASE.index(char)]
    else
      swapped_string << char
    end
  end
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
