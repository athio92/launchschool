# Recreate swapcase function (upper to lower case & vice-versa)

def swapcase(str)
  swapped_chars = str.split('').map do |char|
    case char.ord
    when 65..90 then (char.ord + 32).chr
    when 97..122 then (char.ord - 32).chr
    else char
    end
  end
  swapped_chars.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'