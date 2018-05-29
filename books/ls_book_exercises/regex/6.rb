# Challenge: write a method that changes dates in the format 2016-06-17 
# to the format 17.06.2016. You must use a regular expression and should use
# methods described in this section

def format_date(original_date_str)
  original_date_str.sub(/\A(\d{4})-(\d{2})-(\d{2})\z/,'\3.\2.\1')
end

p format_date('2016-06-17')
p format_date('2016/06/17')