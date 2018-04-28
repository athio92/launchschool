# https://launchschool.com/exercises/30d5181a

loop do
  puts "Please enter user name:"
  name = gets.chomp
  puts "Please enter your password:"
  password = gets.chomp

  if (name == "admin") && (password == "SecreT")
    puts "Welcome!"
    break
  else
    puts "Authorization failed! Try again"
  end
end

