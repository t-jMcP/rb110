=begin
1. Initialise a new variable `odd_elements` to reference an empty array
2. For each element in `input_array`
   1. If the element’s index is even, add it to `odd_elements`
3. Return `odd_elements`
=end

def oddities(input_array)
  odd_elements = []
  
  input_array.each_with_index do |element, index|
    odd_elements << element if index.even?
  end

  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
puts oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
