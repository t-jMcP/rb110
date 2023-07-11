# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(input_string)
  reversed = input_string.split.each_with_object([]) do |word, reversed|
    reversed.unshift(word)
  end

  reversed.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
