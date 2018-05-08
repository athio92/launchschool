#Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.gsub!("important","urgent")

#Question 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)  #deletes index 1
puts numbers.inspect
numbers = [1, 2, 3, 4, 5]
numbers.delete(1) #deletes number 1 at index 0
puts numbers.inspect

#Question 5
puts (10..100).cover?(42)

#Question 7
def add_eight(number)
  number + 8
end

number = 2
how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)")}
p how_deep
p eval(how_deep)

#Question 9
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
arr = flintstones.assoc("Barney")
puts arr.inspect
