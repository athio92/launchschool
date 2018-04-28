result = {}
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

words.each do |word|
  # creates key
  key = word.split(//).sort.join.to_sym
  # Store each word into result hash. 
  if !result.has_key?(key)
    # If key doesnt exist, create new array. 
    result[key] = [word]
  else
    # If key exist, push to array.
    result[key].push(word)
  end
end

result.each_value {|v| puts v.to_s}
