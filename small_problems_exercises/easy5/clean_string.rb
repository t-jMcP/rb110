ALPHABETIC_CHARACTERS = Array('a'..'z')

def cleanup(string)
  cleaned_string = ''
  character_index = 0

  while character_index < string.length
    if ALPHABETIC_CHARACTERS.include?(string[character_index])
      cleaned_string << string[character_index]
    elsif character_index == 0
      cleaned_string << ' '
    elsif ALPHABETIC_CHARACTERS.include?(string[character_index - 1])
      cleaned_string << ' '
    end
    
    character_index += 1
  end

  cleaned_string
end

puts cleanup("---what's my +*& line?") == ' what s my line '
