#Name: Justin Song	
#Period: 6

def fibonacci_iterative(number)
	current_number = 1
	previous_number = 1
	current_pos = 3
	current_number_place = current_number
	previous_number_place = previous_number
	while current_pos < number 
		current_number += previous_number_place
		previous_number = current_number_place
		previous_number_place = previous_number
		current_number_place = current_number
		current_pos += 1
	end
	return current_number
end


def fibonacci_recursive(number)
	return fibonacci_recursive_helper(number-2, 1, 0)
end

def fibonacci_recursive_helper(number, current_number, previous_number)
	return current_number if number == 0
	return fibonacci_recursive_helper(number-1, current_number + previous_number, current_number)
end

p fibonacci_recursive(10)