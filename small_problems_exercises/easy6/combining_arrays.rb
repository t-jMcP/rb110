def merge(input1, input2)
  (input1 + input2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
