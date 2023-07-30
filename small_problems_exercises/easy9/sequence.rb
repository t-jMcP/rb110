=begin 
Initialise a variable `sequence` to reference an empty array
Initialise a variable `counter` to the integer value 1
Until `counter` is greater than `input_integer`
	Add the value of `counter` to `sequence`
	Increment `counter` by 1
Return `sequence`
=end

def sequence(input_int)
  (1..input_int).each_with_object([]) do |num, sequence|
    sequence << num
  end
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
