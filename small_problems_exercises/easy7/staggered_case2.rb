ALPHABETIC_CHARACTERS = 'a'..'z'

def staggered_case(input_string)
  staggered_case_string = ''
  counter = 0

  input_string.chars.each do |char|
    if ALPHABETIC_CHARACTERS.include?(char.downcase) && counter.even?
      char.upcase!
      counter += 1
    elsif ALPHABETIC_CHARACTERS.include?(char.downcase) && counter.odd?
      char.downcase!
      counter += 1
    end

    staggered_case_string << char
  end  
  staggered_case_string
end
      
puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
  