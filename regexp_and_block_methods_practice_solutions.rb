##########################################
    #Regexp and Block Methods Practice
##########################################

#happy_maker
#Input: String
#Output: String
#Description: This method replaces every occurance of the word 'sad' and
#             replaces it with the word 'happy'

def happy_maker(sentence)
  sentence.gsub(/sad/, "happy")
end


#team_sorter
#Input: Hash, Integer  
#Output: Hash
#Description: The first arguement this method takes is a hash where the keys are team
#             names and the values are arrays containing the names of the members of
#             each team. The second argument is an integer. This represents how many
#             team members you want. Your method returns a hash containing only teams
#             with that many members or fewer.

def team_sorter(teams, max_members)
  teams.delete_if {|team_name, members| members.length > max_members}
end


#number_scrambler
#Input: Array
#Output: Array
#Description:  This method takes an array of numbers. If the number is odd, then the number
#              is multiplied by two. If it is even, it gets turned into the number 100.

def number_scrambler(numbers)
  numbers.map {|number| number.odd? ? number * 2 : 100}
end


#phone_number_counter
#Input: String
#Output: Integer
#Description: This method counts how many times a phone number occurs in a sentence.

def phone_number_counter(string)
  string.scan(/[(]?\d{3}[)-]?\d{3}[-]?\d{4}/).length
end


#happy_maker_2
#Input: String
#Output: String
#Description: Rewrite the happy_maker method from above using while loops, if statements and
#             variables only. You may not use sub, gsub, scan, or any other method that uses
#             a regular expression. You can assume that the word 'sad' is not part of a larger
#             word. You can also assume that no punctuation will be used, such as periods, commas
#             exclamation marks, etc.

def happy_maker_2(sentence)
  result = ""
  words = sentence.split(" ")
  words.each do |word|
    if word == "sad"
      result << "happy "
    else
      result << word << " "
    end
  end
  result.rstrip
end


