require 'pp'
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
	f = File.open(filename)
	list_of_words = {}
	f.each_line do |line|
		word_array = line.scan(/[a-zA-Z]+/)
		word_array.map! {|x| x.downcase}
		index = 0
		while index < word_array.length
			if !EXCLUDED_WORDS.include?word_array[index]
				if list_of_words[word_array[index]] == nil
					list_of_words[word_array[index]] = 1
				else
					list_of_words[word_array[index]] += 1
				end
			end
			index += 1
		end			
	end
	return list_of_words
end


# pp count_words('osiris_myth.txt')

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
	array_of_arrays = []
	index = 0
	return count_words(filename).to_a.sort_by { |occurence| occurence[1]}
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
	number_of_times = 0
	most_frequent_words(filename).reverse_each do |stuff|
		if max_number_of_words > number_of_times
			puts "#{stuff[0]}: #{stuff[1]}"
		else
			return 
		end
		number_of_times += 1
	end
end

print_most_frequent_words('osiris_myth.txt', 7)