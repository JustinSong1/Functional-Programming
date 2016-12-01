#Name: Justin Song
#Period: 6

def factorial_iterative(number)
	result = number
	until number == 1
		result *= number
		number -= 1
	end
	return result 
end


def factorial_recursive(number)
	if number == 0
		return 1
	end 
	if number == 1
		return number
	end
	return number * (factorial_recursive(number - 1))
end
