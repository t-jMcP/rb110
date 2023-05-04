def short_long_short(string1, string2)
  short_string = shortest(string1, string2)
  long_string = longest(string1, string2)
  short_string + long_string + short_string
end

def shortest(string1, string2)
  string1.length < string2.length ? string1 : string2
end

def longest(string1, string2)
  shortest(string1, string2) == string1 ? string2 : string1
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
