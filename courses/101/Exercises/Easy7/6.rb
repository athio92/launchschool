# Modification of previous exercise: this time, non-alphabet characters 
# does not count in toggling desired case

def staggered_case(sentence)
  need_upcase = true
  result = ""
  sentence.chars.each do |char|
    if char.match?(/[a-zA-Z]/)
      if need_upcase == true
        result << char.upcase
      else
        result << char.downcase
      end
      need_upcase = !need_upcase
    else
      result << char  
    end
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'