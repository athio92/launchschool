require "pry"

def old_roman_numeral num

  raise 'Must use positive integer' if num<=0

  roman=''

  roman << 'M'* (num/1000)
  roman << 'D' * (num%1000 / 500)
  roman << 'C' * (num%500 / 100)
  roman << 'L' * (num%100/50)
  roman << 'X' * (num%50 / 10)
  roman << 'V' * (num % 10 / 5)
  roman << 'I' * (num%5)
end

def roman_numeral num
  roman = ''
  # M=1000, D=500, C=100, L=50, X=10, V=5, I=1
  # Exceptions: 4=IV. 9=IX. 40=XL. 90=XC. 400=CD, 900=CM
  
  thousands = num/1000
  hundreds = (num%1000)/100
  tens = (num%100)/10
  ones = (num%10)

  #Add thousands
  roman << 'M'*thousands
  #Add hundreds
  case hundreds
    when 9
      roman <<'CM'
    when 4
      roman <<'CD'
    else
      #adds regular D and C
      roman <<'D' * (hundreds/5)
      roman <<'C' * (hundreds%5)
  end    
  
  #Add tens
  case tens
    when 9
      roman <<'XC'
    when 4
      roman <<'XL'
    else
      #adds regular L and X
      roman <<'L' * (tens/5)
      roman <<'X' * (tens%5)
  end

  #Add ones
  case ones
    when 9
      roman <<'IX'
    when 4
      roman <<'IV'
    else
      #adds regular L and X
      roman <<'V' * (ones/5)
      roman <<'I' * (ones%5)
  end


end

def roman_to_integer roman
  digit_vals = {'i' => 1,
                'v' => 5,
                'x' => 10,
                'l' => 50,
                'c' => 100,
                'd' => 500,
                'm' => 1000}
  total = 0
  prev  = 0
  roman.reverse.each_char do |c_or_C|
    c  = c_or_C.downcase
    val = digit_vals[c]
    binding.pry # for pry gem to inspect 
    if !val
      puts "This is not a valid roman numeral!"
      return
    end

    if val < prev
      val *= -1
    else
      prev = val
    end

    total += val
  end

  total
end


puts (old_roman_numeral(1989))

puts (roman_numeral (1989))

puts(roman_to_integer('MCMXLXV'))
