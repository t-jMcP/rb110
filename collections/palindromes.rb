# Algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array


# Initialise an array named substrings to store the substrings
# For each character in the string, up to the second last character
	# For each substring from the character's index of length 2 or more through to the end 	of the string
		# Append the substring to the substrings array
# Return the substring array


def substrings(str)
  substrings = []
  start_index = 0

  while start_index < str.length - 1
    substring_length = 2
    while start_index + substring_length <= str.length
      substrings << str[start_index, substring_length]
      substring_length += 1
    end
    start_index += 1
  end  
substrings
end

def palindrome_substrings(str)
  result = []
  substring_arr = substrings(str)
  for substring in substring_arr
    result << substring if is_palindrome?(substring)
  end
  result
end
