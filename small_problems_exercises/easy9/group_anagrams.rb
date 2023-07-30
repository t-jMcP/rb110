=begin
1. Create a new variable `already_covered_words` to reference an empty array
2. For each `word` in `words`
   1. Create a new variable `sorted_word` to reference the return value of sorting the characters in `word` alphabetically
   2. Create a new variable `anagrams` to reference an array containing `word`
   3. For each `second_word` in `words`
      1. If `second_word` is the same as `word`, skip to the next iteration
      2. Create a new variable `sorted_second_word` to reference the return value of sorting the characters in `second_word` alphabetically
      3. If `sorted_second_word` is identical to `sorted_word` AND `second_word` is not in `already_covered_words`
         1. Add `second_word` to `anagrams`
   4. If `anagrams` is longer than 1
      1. Print `anagrams`
      2. For each `anagram` in `anagrams`
         1. Add `anagram` to `already_covered_words`
=end

def print_anagrams(words)
  already_covered_words = []

  words.each do |word|
    sorted_word = word.chars.sort.join
    anagrams = [word]

    words.each do |second_word|
      next if second_word == word || already_covered_words.include?(second_word)
      sorted_second_word = second_word.chars.sort.join
      anagrams << second_word if sorted_second_word == sorted_word
    end

    if anagrams.length > 1
      p anagrams
      anagrams.each { |anagram| already_covered_words << anagram}
    end
  end
end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)
