
board = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ',
        6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}

def draw_board(board)
  system 'clear'
  puts "  1  |  2  |  3  "
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "-----+-----+-----"
  puts "  4  |  5  |  6  "
  puts "     |     |     "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "-----+-----+-----"
  puts "  7  |  8  |  9  "
  puts "     |     |     "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
end

def get_empty_cells(board)
  board.keys.select { |cell| board[cell] == ' '}
end

def player_select(board)
  begin
    puts "Please choose a position to mark (1-9)."
    selection = gets.chomp.to_i
  end until get_empty_cells(board).include?(selection)
  board[selection] = 'X'
end

def computer_select(board)
  comp_selection = get_empty_cells(board).sample
  board[comp_selection] = 'O'
end

def three_in_a_row(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |row|
    if board[row[0]] == 'X' && board[row[1]] == 'X' && board[row[2]] == 'X'
      puts "You won!"
      exit
    elsif board[row[0]] == 'O' && board[row[1]] == 'O' && board[row[2]] == 'O'
      puts "Computer won!"
      exit
    end
  end
end

def board_full?(board)
  get_empty_cells(board) == []
end

begin
  draw_board(board)
  player_select(board)
  draw_board(board)
  computer_select(board)
  draw_board(board)
  three_in_a_row(board)
end until board_full(board)
puts "It's a tie."