dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  # Initialize a hash to keep count of each dictionary word found as a substring
  substring_list = dictionary.each_with_object({}) { |key, h| h[key] = 0 }

  # Convert the string to lowercase for case-insensitive matching
  string = string.downcase

  # Split the string into individual words
  words = string.split(' ')

  words.each do |word|
    word_substrings = []

    # Generate all possible substrings of each word
    (0...word.length).each do |start_index|
      (start_index...word.length).each do |end_index|
        word_substrings.push word[start_index..end_index]
      end
    end

    # Count each substring if it matches a dictionary word
    word_substrings.each do |substring|
      if dictionary.include?(substring)
        substring_list[substring] += 1
        return substring_list.filter{|key,value| value>0}
      end
    end
  end
  
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
