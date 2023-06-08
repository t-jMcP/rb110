def crunch(input_string)
  crunched_string = ''
  index = 0

  while index < input_string.length
    if index == 0 || input_string[index] != input_string[index - 1]
      crunched_string << input_string[index]
    end
    index += 1
  end  
  crunched_string
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
