=begin
1. Initialise a variable `rotated_array` to reference an empty array
2. For each element in `input_array`
   1. If element’s index is 0, skip to the next element
   2. Add element to `rotated_array`
3. Add the first element from `input_array` to the end of `rotated_array`
4. Return `rotated_array`
=end

def rotate_array(input_array)
  rotated_array = []

  input_array.each_with_index do |element, index|
    next if index == 0
    rotated_array.push(element)
  end
  
  rotated_array.push(input_array[0])
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true
