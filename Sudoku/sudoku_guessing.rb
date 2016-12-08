
def solve(board_string)
	return square_solve(parse_board(board_string))
end

def check_board(board)
	inner_index = 0
	solved = true
	outer_index = 0
	while outer_index < 9
		inner_index = 0
		while inner_index < 9
			numbers_square = numbers_in_square([outer_index][inner_index], board)
			possible_numbers = [1,2,3,4,5,6,7,8,9] - numbers_square
			row = position[0]
			column = position[1]
			numbers_in_column = []
			numbers_in_row = []
			x = 0

			while x < 9
				numbers_in_column << board[column][x]
				x += 1
			end

			x = 0

			while x < 9
				numbers_in_row << board[x][row]
				x += 1
			end

			numbers_in_row.each do |number|
				possible_numbers.delete(number)
			end

			numbers_in_column.each do |number|
				possible_numbers.delete(number)
			end
			if possible_numbers.include? board[outer_index][inner_index]
				solved = true 
			else
				return false
			end
			inner_index += 1
		end
		outer_index += 1
	end
	return solved
end

def numbers_in_square(board_position, board)
	starting_center = closest_center(board_position)
	outer_index = -1
	empty_places = []
	numbers_in_square = []
	while outer_index <= 1
		inner_index = -1
		while inner_index <= 1
			if board[starting_center[0] - outer_index][starting_center[1] - inner_index] == 0
				empty_places << [starting_center[0] - outer_index, starting_center[1] - inner_index]
			end 	
			numbers_in_square << board[starting_center[0] - outer_index][starting_center[1] - inner_index]
			inner_index += 1
		end
		outer_index += 1
	end
	return numbers_in_square
end

def closest_center(board_position)
	current_closest_center = []
	centers = [[1, 1], [4,1], [7,1], [1,4], [1,7], [4,4], [4,7], [7,4], [7,7]]
	closest_distance = 1000000
	centers.each do |center|		
		x_coordinate = center[0]
		y_coordinate = center[1]
		x_distance = x_coordinate - board_position[0]
		y_distance = y_coordinate - board_position[1]
		total_distance = (x_distance * x_distance) + (y_distance * y_distance)
		if total_distance < closest_distance
			current_closest_center = center
			closest_distance = total_distance
		end
	end
	return current_closest_center
end
def square_solve(board)
	centers = [[1, 1], [4,1], [7,1], [1,4], [1,7], [4,4], [4,7], [7,4], [7,7]]
	original_board = board
	solved_board = true
	while solved_board
		solved_board = false
		centers.each do |starting_center|
			outer_index = -1
			empty_places = []
			numbers_in_square = []
			while outer_index <= 1
				inner_index = -1
				while inner_index <= 1
					if board[starting_center[0] - outer_index][starting_center[1] - inner_index] == 0
						empty_places << [starting_center[0] - outer_index, starting_center[1] - inner_index]
					end 	
					numbers_in_square << board[starting_center[0] - outer_index][starting_center[1] - inner_index]
					inner_index += 1
				end
				outer_index += 1
			end
			empty_places.each do |position|
				possible_numbers = [1,2,3,4,5,6,7,8,9] - numbers_in_square
				row = position[0]
				column = position[1]
				numbers_in_column = []
				numbers_in_row = []
				x = 0

				while x < 9
					numbers_in_column << board[column][x]
					x += 1
				end

				x = 0

				while x < 9
					numbers_in_row << board[x][row]
					x += 1
				end

				numbers_in_row.each do |number|
					possible_numbers.delete(number)
				end

				numbers_in_column.each do |number|
					possible_numbers.delete(number)
				end
				if possible_numbers.length == 1
					board[starting_center[0]][starting_center[1]] = possible_numbers[0]
				end
				number_of_possible_numbers = possible_numbers.length
				r = Random.new
				position = possible_numbers[r.rand(0..number_of_possible_numbers - 1)]
			end
			if check_board(board)
				return board
			else 
				board = original_board
			end
		end
	end
end

def parse_board(board_string)
	#Turns the board into a 2d array and it converts the '-' into 0.
	board = Array.new(9) {Array.new(9)}
	outer_index = 0
	inner_index = 0
	while outer_index < 9
		inner_index = 0
		while inner_index < 9
			board[outer_index][inner_index] = board_string[(outer_index*9) + inner_index].to_i
			inner_index += 1
		end
		outer_index += 1
	end
	return board
end

def pretty_board(board)
	board.each do |line|
		puts line.join(" ")
	end
end

p solve("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")