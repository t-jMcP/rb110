LOWER_CASE = 'a'..'z'
UPPER_CASE = 'A'..'Z'

def letter_case_count(string)
  case_counters = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if LOWER_CASE.include?(char)
      case_counters[:lowercase] += 1
    elsif UPPER_CASE.include?(char)
      case_counters[:uppercase] += 1
    else
      case_counters[:neither] += 1
    end
  end
  
  case_counters
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
