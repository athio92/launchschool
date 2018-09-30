def raise_and_rescue
  puts "I'm before the Raise Error"
  raise(NoMethodError,"This is custom error")
  puts "I'm after the Raise Error"
rescue StandardError => e
  p e
end

raise_and_rescue
