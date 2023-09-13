=begin
1. Print an empty line
2. Initialise a variable `stars_to_print` to reference the integer value 1
3. Initialise a variable `spaces_to_print` to reference the return value of `(n - 1) / 2` 
4. For every number between `1` and `n`
   1. Print `" "` `spaces_to_print` many times
   2. Print `"*"` `stars_to_print` many times
   3. Print `" "` `spaces_to_print` many times
   4. If `stars_to_print` is equal to `n`
      1. Reduce `stars_to_print` by 2
      2. Increase `spaces_to_print` by 1
   5. Else
      1. Increase `stars_to_print` by 2
      2. Reduce `spaces_to_print` by 1
   6. Print a newline   
=end

def diamond(n)
  puts "\n"

  stars_to_print = 1
  spaces_to_print = (n - 1)/2

  n.times do |row|
    spaces_to_print.times { print " " }
    stars_to_print.times { print "*" }
    print "\n"

    if row < n / 2
      stars_to_print += 2
      spaces_to_print -= 1
    else
      stars_to_print -= 2
      spaces_to_print += 1
    end
  end
end


diamond(1)
diamond(3)
diamond(9)
