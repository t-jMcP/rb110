def reverse!(array)
  reversed = array.each_with_object([]) do |element, new_array|
    new_array.unshift(element)
  end

  array.each_with_index { |_, index| array[index] = reversed[index] }
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true
