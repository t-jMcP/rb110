=begin 
1. Split input string into an array of words using a single space as delimiter
2. For each word in the words array
   1. Calculate the word length
   2. Append a space and the value of the word length onto the word string
3. Return the words array
=end

def word_lengths(string)
  words = string.split

  words.map do |word|
    length = word.length
    word << " #{length}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]


p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
