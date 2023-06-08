ALPHABETIC_CHARACTERS = 'a'..'z'

def staggered_case(input_string)
  staggered_case_string = ''

  input_string.chars.each_with_index do |char, index|
    char.upcase! if ALPHABETIC_CHARACTERS.include?(char.downcase) && index.even?
    char.downcase! if ALPHABETIC_CHARACTERS.include?(char.downcase) && index.odd?
    staggered_case_string << char
  end

  staggered_case_string
end
      
puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
