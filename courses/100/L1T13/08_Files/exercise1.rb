simple = File.read("simple_file.txt") # file already exists and contains text files
original = File.new("original_file.txt","a")

File.open(original,"a") do |file|
  file.puts simple
end

puts File.read(original)