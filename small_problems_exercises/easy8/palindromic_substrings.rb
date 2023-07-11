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


def palindromes(input_string)
  substrings_list = substrings(input_string)
  substrings_list.select do |substring|
    substring == substring.reverse && substring.length != 1
  end
end


puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
