=begin
1. Initialise a variable `full_name` that reference the return value of joining the elements of the `name_array` with spaces as the delimiter
2. Initialise a variable `title_occupation` that references the return value of concatenating the values in the `details` hash with a space separating them
3. Print a new string object for a greeting message, with the values of `full_name` and `title_occupation` interpolated into the string
=end

def greetings(name_array, details_hash)
  full_name = name_array.join(" ")
  occupation_details = details_hash[:title] + " " + details_hash[:occupation]
  puts "Hello, #{full_name}! Nice to have a #{occupation_details} around."
end


greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# "Hello, John Q Doe! Nice to have a Master Plumber around."
