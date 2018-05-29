# https://launchschool.com/exercises/41e03303

def block_word?(word)
  spelling_blocks = {
    "B" => "O",
    "G" => "T",
    "V" => "I",
    "X" => "K",
    "R" => "E",
    "L" => "Y",
    "D" => "Q",
    "F" => "S",
    "Z" => "M",
    "C" => "P",
    "J" => "W",
    "N" => "A",
    "H" => "U"
  }

  word.chars.each do |char|
    char = char.upcase
    if spelling_blocks.key?(char)
      spelling_blocks.delete(char)
    elsif spelling_blocks.value?(char)
      key = spelling_blocks.key(char)
      spelling_blocks.delete(key)
    else
      return false
    end
  end
  true
end

p block_word?('BATCH')
p block_word?('BUTCH')
p block_word?('jest')

