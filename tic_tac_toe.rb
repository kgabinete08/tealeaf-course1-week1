# 1. board
# 2. player puts mark X if empty
# 3. player 2 marks O if empty
# 4. three marks in a row wins
# 5. horizontal, vertical, diagonal.

def set_board
  board = {}
  (1..9).each { |cell| board[cell] = ' ' }
  board
end

def check_empty_cell(board)
  board.keys.select { |cell| board[cell] == ' '}
end

def player_select(board)
  begin
    puts "Please choose a position to mark (1-9)."
    selection = gets.chomp.to_i
    if selection <= 0 || selection >= 10
      puts "That is not a valid position."
    end
  end until check_empty_cell(board).include?(selection)
  board[selection] = 'X'
end

def computer_select
  comp_selection = check_empty_cell(board).sample
  board[comp_selection]
end

def check_winner(board)
  winning_lines = [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]
  
end


  puts "  1  |  2  |  3  "
  puts "     |     |"
  puts "  #{c[1]}  |  #{c[2]}  |  #{c[3]}  "
  puts "-----+-----+-----"
  puts "  4  |  5  |  6  "
  puts "     |     |"
  puts "  #{c[4]}  |  #{c[5]}  |  #{c[6]}  "
  puts "-----+-----+-----"
  puts "  7  |  8  |  9  "
  puts "  #{c[7]}  |  #{c[8]}  |  #{c[9]}  "
  puts "     |     |     "




