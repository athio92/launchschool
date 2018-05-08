# Question 1
10.times { |num| puts((" " * num) + "The Flintstones Rock!")}

# Question 10
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end