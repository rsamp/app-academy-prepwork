$vowels = ["a", "e", "i", "o", "u"]

def translate(phrase)
  phrase_arr = phrase.split
  phrase_arr.map! { |word| translate_word(word) }
  phrase_arr.join(" ")
end

def translate_word(word)
  "#{word}ay" if $vowels.include?(word[0])      # First letter is vowel

  consonants_count = 0
  consonants = ""

  word.chars.each_with_index do |char, i|
    # Break out of loop at first vowel (unless part of a "qu" sequence)
    break if $vowels.include?(char) && (word[i-1,2] != "qu")
    consonants_count+=1
    consonants += char
  end

  "#{word[consonants_count..word.length]}#{consonants}ay"
end
