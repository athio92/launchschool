MOVES_LIST = ["Choose", "Player", "Computer"]
FIRST_MOVE = MOVES_LIST[0]
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

def joinor(arr, delimiter = ", ", last_separator = "or" )
  return arr[0].to_s if arr.length <= 1
  return "#{arr[0]} #{last_separator} #{arr[1]}" if arr.length == 2
  "#{arr[0..arr.length - 2].join(delimiter)}#{delimiter}#{last_separator} #{arr.last}"
end

def find_first_turn
  if FIRST_MOVE == MOVES_LIST[0]
    loop do
      prompt "Who shall go first? (1 = Player, 2 = Computer)"
      selection = gets.chomp.to_i
      return MOVES_LIST[selection] if [1, 2].include?(selection)
      puts "Invalid input"
    end
  else
    return FIRST_MOVE
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |i| new_board[i] = INITIAL_MARKER }
  new_board
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  # system "clear"
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

def find_at_risk_square(brd, marker)
  # Loop through WINNING_LINES. For each line, count number of PLAYER_MARKER inside.
  WINNING_LINES.each do |winning_line|
    # If PLAYER_MARKER count == 2, and the remaining slot is empty, that is the at-risk square.
    if brd.values_at(*winning_line).count(marker) == 2
      winning_line.each do |square|
        return square if brd[square] == INITIAL_MARKER
      end
    end
  end
  nil
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose an empty square: #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  # Offense first
  square = find_at_risk_square(brd, COMPUTER_MARKER)
  if !square
    # Then defense
    square = find_at_risk_square(brd, PLAYER_MARKER)
    if !square
      # Pick square #5 if empty, otherwise pick random square
      square = if brd[5] == INITIAL_MARKER
                 5
               else
                 empty_squares(brd).sample
               end
    end
  end
  brd[square] = COMPUTER_MARKER
end

def places_piece!(brd, current_turn)
  if current_turn == "Player"
    player_places_piece!(brd)
  elsif current_turn == "Computer"
    computer_places_piece!(brd)
  end
end

def alternate_turn(current_turn)
  return MOVES_LIST[1] if current_turn == MOVES_LIST[2]
  return MOVES_LIST[2] if current_turn == MOVES_LIST[1]
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

# Main Program
player_score = 0
computer_score = 0
loop do
  # returns hash w. keys 1-9, values = " ". { 1 => " ", ... , 9 => " "}
  board = initialize_board
  winner = nil
  current_turn = find_first_turn

  loop do
    display_board(board)
    places_piece!(board, current_turn)
    current_turn = alternate_turn(current_turn)
    winner = evaluate_winner(board)
    break if winner || board_full?(board)
    # computer_places_piece!(board)
    # winner = evaluate_winner(board)
    # break if winner || board_full?(board)
  end
  display_board(board)

  if winner
    player_score += 1 if winner == "Player"
    computer_score += 1 if winner == "Computer"
    prompt "#{winner} wins! Player: #{player_score}, Computer: #{computer_score}"
    break if player_score == 5 || computer_score == 5
  elsif board_full?(board)
    prompt "Board is full. It's a tie!"
  end
  prompt "The game continues until 5 consecutive wins!"
end

prompt "Game ends. Thank you for playing!"
