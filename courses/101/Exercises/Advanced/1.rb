ADJECTIVES = %w(big tall yellow black cool shiny new crazy)
NOUNS = %w(dog cat lizard pig girl guy pole TV)
ADVERBS = %w(stealthily lazily deftly bravely swiftly secretly boldly)
VERBS = %w(kiss kick smack throw stab discard)

File.open("1.txt") do |file|
  file.each do |line|
    puts format(line, noun: NOUNS.sample, verb: VERBS.sample,
      adjective: ADJECTIVES.sample, adverb: ADVERBS.sample)
  end
end
