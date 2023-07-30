=begin
1. Initialise a variable `sequence` to reference an empty array
2. Initialise a variable `multiple` to reference the starting number
3. For `count` many times
   1. Add `multiple` to `sequence`
   2. Increment `multiple` by `starting_number`
4. Return `sequence`
=end

def sequence(count, starting_number)
  (1..count).map { |value| starting_number * value}
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
