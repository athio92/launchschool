def contains?(str)
  /lab/.match(str) ? (puts str) : (puts "Not found")
end

["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"].each do |str|
  contains?(str)
end
