#Justin Song, Period 6
#This is the optional extension
def arabic_to_roman(integer)
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
	to_roman = ""
	roman_numerals = Hash[roman_numeral.to_a.reverse]

	roman_numerals.map do |number, letter|
		if integer >= number
			integer -= number
			to_roman += letter
			if integer >= 1000
				integer -= 1000
				to_roman += "M"
			end
		end
	end
	return to_roman
end

puts arabic_to_roman(2999)