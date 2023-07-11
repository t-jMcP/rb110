def leading_substrings(input_string)
  substrings = []
  input_string.chars.each_with_index do |_, index|
    substrings << input_string.slice(0, index + 1)
  end
  substrings
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
