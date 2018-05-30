# 1. Display initial empty 3x3 board
# 2. Ask user to mark a square
# 3. Computer marks a square
# 4. Any winner? If yes -> display winner -> ask if user wants to play again 
#   -> stop if no, reset if yes
# 5. If no winner, is board full? If yes, display tie -> ask if user wants to play again
# 6. If no winner / no tie, repeat from step 2
WINNING_PATTERNS = 
  [ 
    [1, 2, 3], [4, 5, 6], [7, 8, 9], 
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |i| new_board[i] = " " }
  new_board
end

def display_board(brd)

  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "

end

def player_places_piece(brd)
  loop do
    prompt "Choose a square (1-9):"
    square = gets.chomp.to_i
    if brd[square] == " "
      brd[square] = "X"
      break
    else
      prompt "That square is already filled. Choose again"
    end
  end
end

def computer_places_piece(brd)
  computer_choice = (brd.select { |_, v| v == " "}).keys.sample
  p computer_choice
  brd[computer_choice] = "O"
end

def evaluate_winner(brd)
  x_positions = (brd.select { |_, v| v == "X"} ).keys
  o_positions = (brd.select { |_, v| v == "O"} ).keys
  WINNING_PATTERNS.each do |win_pattern|
    if (win_pattern & x_positions) == win_pattern
      return "Player" # Player wins
    elsif (win_pattern & o_positions) == win_pattern
      return "Computer" # Computer wins
    end
  end
  nil # no winner
end

def board_full?(brd)
  !brd.values.include?(" ")
end

def play_again?
  loop do
    prompt "Do you want to play again? (Y/N)"
    answer = gets.chomp
    if answer.match?(/y[es]*/i)
      return true
    elsif answer.match?(/n[o]*/i)
      return false
    else
      prompt "Invalid answer. Please try again"
    end
  end
end

# Main Program
loop do
  board = initialize_board # hash, like { 1 => "X", 2 => "O", 3 => " ", etc}
  winner = nil
  display_board(board)
  
  until winner || board_full?(board)
    player_places_piece(board)
    computer_places_piece(board)
    display_board(board)
    winner = evaluate_winner(board)
  end

  if winner
    prompt "#{winner} wins!"
    break unless play_again?
  elsif board_full?(board)
    prompt "Board is full. It's a tie!"
    break unless play_again?
  end
  prompt "Let's play one more round!"
end

prompt "Thank you for playing!"