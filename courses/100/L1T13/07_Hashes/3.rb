h = {name: "Bob", occupation:"Developer", hobbies: "painting"}

h.each_key {|k| puts k}
h.each_value {|v| puts v}
h.each {|k,v| puts "#{k}, #{v}"}
