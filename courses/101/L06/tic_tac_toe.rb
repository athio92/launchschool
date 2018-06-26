INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"

WINNING_LINES =
  [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
    [1, 5, 9], [3, 5, 7]             # diagonals
  ]

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |i| new_board[i] = INITIAL_MARKER }
  new_board
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system "clear"
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
# rubocop: enable Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose an empty square (#{empty_squares(brd).join(',')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def evaluate_winner(brd)
  player_positions = brd.select { |_, v| v == PLAYER_MARKER }.keys
  computer_positions = brd.select { |_, v| v == COMPUTER_MARKER }.keys
  WINNING_LINES.each do |winning_line|
    if (winning_line & player_positions) == winning_line
      return "Player" # Player wins
    elsif (winning_line & computer_positions) == winning_line
      return "Computer" # Computer wins
    end
  end
  nil # no winner
end

def board_full?(brd)
  !brd.values.include?(INITIAL_MARKER)
end

def play_again?
  loop do
    prompt "Do you want to play again? (y/n)"
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
  # returns hash w. keys 1-9, values = " ". { 1 => " ", ... , 9 => " "}
  board = initialize_board
  winner = nil
  display_board(board)
  loop do
    display_board(board)
    player_places_piece!(board)
    winner = evaluate_winner(board)
    break if winner || board_full?(board)
    computer_places_piece!(board)
    winner = evaluate_winner(board)
    break if winner || board_full?(board)
  end
  display_board(board)

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
