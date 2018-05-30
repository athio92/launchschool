# Write a method that returns the number of Friday the 13ths in a given year.

def friday_13th(year)
  count = 0
  (1..12).each do |month|
    if Time.new(year,month,13).friday? 
      count +=1
    end
  end
  count
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2