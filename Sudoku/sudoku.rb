#Name: Justin Song
#Period: 6

# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
NUMBERS_NEEDED = [1,2,3,4,5,6,7,8,9]
def solve(board_string)
	board = parse_board(board_string)
	change_can_be_made = true
	while change_can_be_made
		change_can_be_made = false
		if board != (horizontal_eight(square_solve(board)))
			change_can_be_made = true
			board = horizontal_eight(vertical_eight(square_solve(board)))
		end
	end
	return board
end

def horizontal_eight(board)
	board.each do |line|
		zero_index = []
		index = 0
		while index < 9
			if line[index] == 0
				zero_index << index
			end
			index += 1
		end
		missing_numbers = (NUMBERS_NEEDED - line)
		if missing_numbers.length == 1
			line[zero_index[0]] = missing_numbers[0]
		end
	end
	return board
end

def vertical_eight(board) 

end

def square_solve(board)
	centers = [[1, 1], [4,1], [7,1], [1,4], [1,7], [4,4], [4,7], [7,4], [7,7]]
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
			
			#Error somewhere here
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
		end
	end
	return board
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

def parse_board_string(board_string)
	#Turns the board into a 2d array and it converts the '-' into 0.
	board = Array.new(9) {Array.new(9)}
	outer_index = 0
	inner_index = 0
	while outer_index < 9
		inner_index = 0
		while inner_index < 9
			board[outer_index][inner_index] = board_string[(outer_index*9) + inner_index]
			inner_index += 1
		end
		outer_index += 1
	end
	return board
end
# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
	done = true
	board.each_index do |index|
		if index == 0
			done = false
		else 
			done = true
		end
	end
	return done
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
	board = parse_board_string(board)
	board.each do |line|
		puts line.join(" ")
	end
end

p pretty_board(solve("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--").join())
