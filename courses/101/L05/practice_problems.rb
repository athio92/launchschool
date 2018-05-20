# https://launchschool.com/lessons/c53f2250/assignments/f524e910
# Practice Problem 3: find 'g'
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]  
# arr1.last.last.last
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2.last[:third][0]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3.last[:third][0][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# hsh1['b'][1]
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# hsh2[:third].key(0)

# Practice Problem 4: change value of 3 to 4

arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[["a"]][:a][2] = 4

p arr1
p arr2
p hsh1
p hsh2

# Practice Problem 5: calculate total age of male members

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# `select` returns hash consisting entries for which block returns true.
# `map` returns array
total_male_age = munsters.select{ |_, v| v["gender"] == "male"}.map{ |_, v| v["age"]}.sum
# alternative method:
total_male_age = 0
munsters.each_value do |hsh|
  total_male_age += hsh["age"] if hsh["gender"] == "male"
end
p total_male_age

# Practice Problem 6: Using munsters' data, print out name, age, gender of each member.
munsters.each do |k, hsh|
  puts "#{k} is a #{hsh['age']}-year-old #{hsh['gender']}"
end

# Practice Problem 8: output all the vowels from the strings
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each do | _, arr|
  arr.each do |word|
    word.chars.each{|ch| print ch if %w(a i u e o).include?(ch)}
  end
end

# Practice Problem 9: return a new array of the same structure but 
# with the sub arrays being ordered (alphabetically or numerically 
# as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
new_arr =
  arr.map do |inner_arr|
    inner_arr.sort{|a,b| b <=> a}
  end
p new_arr

# Practice Problem 10: use `map` to return new array with all integer incremented by 1
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_arr = 
  arr.map do |hsh|
    hsh.transform_values{ |v| v + 1 }
  end
p new_arr

# Practice Problem 11: return a new array identical in structure to the original
# but containing only the integers that are multiples of 3
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_arr = 
  arr.map do |inner_arr|
    inner_arr.select{|i| i % 3 == 0}
  end
p new_arr


# Practice Problem 12: without using the Array#to_h method, write some code
# that will return a hash where the key is the first item in each sub array 
# and the value is the second item
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = {}
arr.each do |inner_arr|
  hsh[inner_arr[0]] = inner_arr[1]
end

# Practice Problem 13: Return a new array containing the same sub-arrays as the original 
# but ordered logically according to the numeric value of the odd integers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
new_arr = 
  arr.sort_by do |inner_arr|
    inner_arr.select {|i| i.odd? }
  end
p new_arr

# Practice Problem 14: return an array containing the colors of the fruits and the sizes 
# of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.map do |_, inner_hash|
  if inner_hash[:type] == "fruit"
    inner_hash[:colors].map(&:capitalize)
  elsif inner_hash[:type] == "vegetable"
    inner_hash[:size].upcase
  end
end
p result

# Practice Problem 15: Return an array which contains only hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
new_arr = arr.select do |hsh|
  hsh.values.flatten.all?(&:even?) 
end
p new_arr

# Practice Problem 16: Generate UUID
def create_uuid
  characters = []
  (0..9).each{|i| characters << i.to_s}
  ('a'..'f').each{|c| characters << c}
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |target_length, index|
    target_length.times{ uuid << characters.sample }
    uuid << '-' if index <= sections.size - 2
  end
  uuid
end

puts create_uuid
