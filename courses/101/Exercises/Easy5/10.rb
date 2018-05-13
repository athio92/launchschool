# Bannerizer

def print_in_box(text)
  inner_width = text.length + 2
  puts "+#{'-'*inner_width}+"
  puts "|#{' '*inner_width}|"
  puts "| #{text} |"
  puts "|#{' '*inner_width}|"
  puts "+#{'-'*inner_width}+"
end

print_in_box('')