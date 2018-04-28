def do_self_importantly some_proc
  puts "I'm doing something..."
  some_proc.call "Suzy"
  puts "OK I'm done."
end

say_hello = proc do |name|
  puts "Hello #{name}!"
end

say_goodbye = proc do
  puts "Goodbye!"
end

do_self_importantly say_hello
do_self_importantly say_goodbye
