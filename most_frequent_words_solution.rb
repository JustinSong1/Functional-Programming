EXCLUDED_WORDS = ["the", "of", "or", "ref", "and", "in", "to", "is", "a", "as", "that", "with", "pp", "p", "an", "which", "it", "on", "this", "are", "were", "s", "by", "for", "was", "from", "who", "cite", "have", "te", "so", "at", "be", "also", "isbn", "but","bc", "into", "such"]

#Input: String (The name of a text file)
#Output: Hash
#Description: This method takes the name of a text file (.txt) as an argument and 
#             returns a hash where the keys are each word and the values are how
#             many times the word occurs in the file. Do not count the excluded 
#             words (as listed above). Make all words lowercase so that the upper-
#             case and lowercase versions are counted as the same word.
#Resources: Check out this description of how to access the text from a text file
#           and iterate through each line:
#               http://stackoverflow.com/questions/5545068/what-are-all-the-common-ways-to-read-a-file-in-ruby

def count_words(filename)
  words = {}
  File.open(filename) do |file|
    file.each_line do |line|
      line.scan(/\w+/) do |word|
        word.downcase!
        if !EXCLUDED_WORDS.include?(word)   #Make sure I don't count any of the excluded words
          if words.has_key?(word)
            words[word] += 1
          else
            words[word] = 1
          end
        end
      end
    end
  end
  return words
end


#Input: String (the name of a text file)
#Output: An array of arrays   Ex: [["hello", 112], ["bears", 95], ["kittens", 82]]
#Description: This method takes a filename and returns an array of arrays. Each sub-array
#             stores a word and how frequently it occurs. The arrays should be ordered
#             from most frequent to least frequent word. In this case an array of arrays
#             makes more sense than a hash because a hash is not ordered, and we need
#             to have the words ordered in order of frequency and also know what those
#             frequencies are.
#Tip: Use the count_words method you wrote above to get the hash of words and their frequencies.
#     Then convert the hash into the format shown above
#Resources: Check out the Enumerable class methods. These work for arrays and hashes.
#           Take a look at the method called sort_by and see how it works.

def most_frequent_words(filename)
  words = count_words(filename)
  words = words.sort_by {|word, count| count}.reverse
end


#Input: String (the name of a text file), Integer (How many words you want to display)
#Output: None
#Description: This method is only for displaying results to the user, so there is no return
#             value. When you call this method, it displays the top most frequent words and
#             their word count.
#Sample output: print_most_frequent_words("osiris_myth.txt", 5)

  # The 5 most frequent words are:
  # osiris:   111
  # horus:    108
  # set:    84
  # egyptian: 75
  # myth:   70
  # his:    59

def print_most_frequent_words(filename, max_number_of_words)
  puts "The #{max_number_of_words} most frequent words are:"
  words = most_frequent_words(filename)
  last_index = words[max_number_of_words] ? max_number_of_words : -1
  words[0..last_index].each do |word_and_count|
    word = word_and_count[0]
    count = word_and_count[1]
    tabs = word.length < 7 ? "\t\t" : "\t"  #Do this to line up tabs correctly with one tab or two.
    puts "#{word}:" + "#{tabs}" + "#{count}"
  end
end

#Driver code
print_most_frequent_words("osiris_myth.txt", 5)



