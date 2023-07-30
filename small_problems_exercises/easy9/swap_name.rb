=begin
1. Split the input string into an array of words, using the space as a delimiter
2. Reverse the array of words
3. Create a new string from joining the words together, with `, ` as the delimiter between them
4. Return the new string
=end

def swap_name(input_name)
  input_name.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
