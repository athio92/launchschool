# Write a method that returns an Array that contains every other element
# of an Array that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities1(arr)
  (arr.map.with_index { |element,i| element if i.even? }).compact
end

def oddities2(arr)
  result = []
  index = 0
  while index < arr.length
    result << arr[index]
    index +=2
  end
  result
end

def oddities3(arr)
  result = []
  arr.each_with_index { |element, i| result << element if i.even?}
  result
end

p oddities1([1,2,3,4,5])
p oddities2([1,2,3,4,5])
p oddities3([1,2,3,4,5])