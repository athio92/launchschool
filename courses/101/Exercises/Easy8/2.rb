print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

sentence1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence1, sentence2, sentence3].sample
