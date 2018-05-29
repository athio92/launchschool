NUMBERS_HASH = {
  "zero" => "0",
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
}

def word_to_digit(words)
  NUMBERS_HASH.each do |k, v|
    words.gsub!(/\b#{k}\b/i, v)
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')