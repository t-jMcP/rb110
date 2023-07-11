def substrings(input_string)
  substrings = []

  input_string.chars.each_with_index do |char, index|
    end_index = index

    until end_index == input_string.length
      substrings << input_string[index..end_index]
      end_index += 1
    end
  end
  
  substrings
end


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
