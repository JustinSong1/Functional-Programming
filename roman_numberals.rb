#Justin Song, Period 6
#This is the optional extension
def arabic_to_roman(integer)
	converions_helper("", integer)
end

def converions_helper(current_numerals, current_number)
	if(current_number == 0) 
		return current_numerals
	end
	roman_numeral = {   1 => "I", 
						4 => "IV", 
						5 => "V",
						9 => "IX",  
						10 => "X", 
						40 => "XL",  
						50 => "L", 
						90 => "XC", 
						100 => "C", 
						400 => "CD", 
						500 => "D", 
						900 => "CM", 
						1000 => "M"}
	roman_numerals = Hash[roman_numeral.to_a.reverse]
	roman_numerals.each do |number, letter|
		if current_number >= number
			current_numerals += letter
			current_number -= number
			return converions_helper(current_numerals, current_number)
		end
	end
end

puts arabic_to_roman(1999)