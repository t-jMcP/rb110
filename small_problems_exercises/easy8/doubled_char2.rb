CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(input_string)
  input_string.chars.each_with_object("") do |char, doubled_string|
    repetitions = CONSONANTS.include?(char.downcase) ? 2 : 1
    repetitions.times { doubled_string << char }
  end
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
