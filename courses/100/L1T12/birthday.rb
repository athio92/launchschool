birth_dates={}
filename = "birthdays.txt"

File.readlines(filename).each do |line|
  name, date, year = line.split(', ')
  birth_dates[name]=Time.gm(year,*(date.split))
end
puts birth_dates["Christopher Lee"]