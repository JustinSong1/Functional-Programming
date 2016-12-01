#Name: Justin Song
#Period: 6

#Write your code below. Feel free to write multiple helper methods to
#support your prime_factors method. Remember, each method should only
#do one thing. So if you start to see that your prime_factors method
#is doing too much, break some of your code out into a different method.

def prime_factors(number)
	return prime_factors_helper(number, 2, [])
end

def prime_factors_helper(number, start, curr_array)
	if number == 1
		return curr_array
	end
	if number % start == 0
		return prime_factors_helper(number/start, start, curr_array << start)
	else 
		return prime_factors_helper(number, start+1, curr_array)
	end
end
