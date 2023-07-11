def repeater(input_string)
  input_string.chars.each_with_object("") do |char, doubled_string|
    2.times { doubled_string << char }
  end
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''
