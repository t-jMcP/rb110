def word_sizes(string)
  words = string.split

  words.each_with_object({}) do |word, sizes|
    word.delete!('^A-z')
    size = word.length

    if sizes.key?(size)
      sizes[size] += 1
    else
      sizes[size] = 1
    end
  end
end


puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
