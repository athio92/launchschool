# Listing files with .txt extensions: method 1
d = Dir.new(".")
while file = d.read do
  puts "#{file} has extension .txt" if File.extname(file) == ".txt"
end

# Method 2 (this time looking for .rb extension)
require "pathname"
pn = Pathname.new(".")
pn.entries.each {|f| puts "#{f} has extension .rb" if f.extname == ".rb"}