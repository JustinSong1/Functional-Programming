CYCLE = {1 => "hundred",
		 2 => "thousand",
		 3 => "million",
		 4 => "billion",
		 5 => "trillion",
		 6 => "quadrillion"}

CASES = {1 => "one",
		 2 => "two",
		 3 => "three", 
		 4 => "four",
		 5 => "five",
		 6 => "six",
		 7 => "seven",
		 8 => "eight",
		 9 => "nine",
		 20 => "twenty",
		 30 => "thirty",
		 40 => "fourty",
		 50 => "fifty", 
		 60 => "sixty",
		 70 => "seventy",
		 80 => "eighty",
		 90 => "ninety",}

SPECIAL_CASES = {10 => "ten",
				 11 => "eleven",
				 12 => "twelve",
				 13 => "thirteen",
				 14 => "fifteen",
				 16 => "sixteen",
				 17 => "seventeen", 
				 18 => "eighteen", 
				 19 => "nineteen"}

def number_in_words(integer)
	if integer.to_s.length % 3 != 0
		first_numbers = integer.to_s[0..integer.to_s.length % 3-1]
	end
	split_number = integer.to_s.split("").reverse.join.scan(/\d{3}/).map! {|group_of_strings| group_of_strings.reverse.to_i}
	if first_numbers != nil
		split_number = split_number.unshift(first_numbers)
	end
	p split_number
	full_word = ""
	index = 0
	number_of_groups = split_number.size
	split_number.each do |group_of_three| 
		full_word << CASES[group_of_three[0]]
		full_word << " "
		full_word << "hundred"
		if SPECIAL_CASES.has_value? group_of_three[1..2].to_i
			full_word << SPECIAL_CASES[group_of_three[1..2].to_i]
		else 
			full_word << CASES[group_of_three[1].to_i * 10]
			full_word << " "
			full_word << CASES[group_of_three[2].to_i]
		end
	end
	return full_word
end

def find_index(integer, indexes_of_zeroes)

end

p number_in_words(5712)