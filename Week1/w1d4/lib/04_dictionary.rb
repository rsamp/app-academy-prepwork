class Dictionary
  # TODO: your code goes here!
  def initialize
    @dictionary = {}
  end

  def entries
    @dictionary
  end

  def add(definition)
    @dictionary.merge!(definition) if definition.class == Hash
    @dictionary[definition] = nil if definition.class == String
  end

  def keywords
    @dictionary.keys
  end

  def include?(word)
    return true if @dictionary.include?(word)
    false
  end

  def find(letters)
    matching_definitions = {}
    @dictionary.each_key do |word|
      if word.start_with?(letters)
        matching_definitions.merge!({word => @dictionary[word]})
      end
    end
    matching_definitions
  end

  def keywords
    @dictionary.keys.sort
  end

  def printable
    printed = ""
    keywords.each do |word|
      printed+="[#{word}] \"#{@dictionary[word]}\"\n"
    end
    printed.chomp
  end
end
