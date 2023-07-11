def fizzbuzz(input1, input2)
  numbers = (1..15).to_a

  numbers.each do |num|
    print "Fizz" if num % 3 == 0
    print "Buzz" if num % 5 == 0
    print num if num % 3 != 0 && num % 5 != 0
    print ", " unless num == input2
  end

  print "\n"
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
