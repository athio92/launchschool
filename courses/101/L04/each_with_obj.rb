original_array = [1, 2, 3, 4, 5]
arbitrary_collector_array = ["Hello", "world"]
w = original_array.each_with_object(arbitrary_collector_array) do |num, array|
  array << num if num.odd?
end
p original_array
p w


original_hash = { a: "antelope", b: "bear", c: "cat" }
x1 = original_hash.each_with_object([]) do |pair, array|
  array << pair
end
p original_hash
p x1

x2 = original_hash.each_with_object([]) do |(key,value), array|
  array << key
  array << value
end
p x2

y = original_hash.each_with_object({}) do |(key,value), hsh|
  hsh[value] = key
end
p y