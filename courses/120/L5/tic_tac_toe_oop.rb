module TTTGameUtils
  def prompt(msg)
    puts "=> #{msg}"
  end

  def joinor(arr, delimiter = ", ", last_separator = "or" )
    return arr[0].to_s if arr.length <= 1
    return "#{arr[0]} #{last_separator} #{arr[1]}" if arr.length == 2
    "#{arr[0..arr.length - 2].join(delimiter)}#{delimiter}#{last_separator} #{arr.last}"
  end
end

class TTTGame
  include TTTGameUtils
  TARGET_SCORE = 5
  WINNING_LINES =
  [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
    [1, 5, 9], [3, 5, 7]             # diagonals
  ]

  def initialize
    @board = Board.new
    @current_player_index = 0
    @game_winner = nil
    @match_winner = nil
  end

  def play
    display_welcome_message
    register_players
    loop do
      set_first_mover
      loop do
        display_board if @current_player_index == 0
        current_player_moves
        update_game_winner_and_score
        break if someone_won? || board_full?
      end
      display_board
      display_game_winner
      display_score
      update_match_winner
      @match_winner ? break : reset_game
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    prompt("Welcome to Tic Tac Toe!")
  end

  def register_players
    prompt "Please enter your name"
    name = gets.chomp
    marker = nil
    loop do
      prompt "Please enter your marker (a single character besides 'X')"
      marker = gets.chomp
      if marker.empty? || marker[0].downcase == "x"
        prompt "Invalid marker. Please use another marker."
      else
        break
      end
    end
    @players = [Player.new(name, marker[0]), Player.new("Captain Computer","X", true)]
    @players_scores = { @players[0] => 0, @players[1] => 0 }
  end

  def set_first_mover
    loop do
      prompt("Choose '1' to move first, '2' to move second.")
      answer = gets.chomp.to_i
      if [1, 2].include?(answer)
        @first_mover_player_index = answer - 1
        @current_player_index = @first_mover_player_index
        break
      else
        prompt("Invalid choice.")
      end
    end
  end

  def display_board
    @board.print
  end

  def current_player_moves
    current_player = @players[@current_player_index]
    # alternates index between 0 and 1 to change turns
    @next_player_index = (@current_player_index + 1) % 2 
    next_player = @players[@next_player_index]
    current_player.mark(@board,next_player.marker)
    @current_player_index = @next_player_index
  end

  def update_game_winner_and_score
    player_positions = @board.positions_containing_marker(@players[0].marker)
    computer_positions = @board.positions_containing_marker(@players[1].marker)
    WINNING_LINES.each do |winning_line|
      if (winning_line & player_positions) == winning_line
        @game_winner = @players[0] # Player wins
        @players_scores[@game_winner] += 1
      elsif (winning_line & computer_positions) == winning_line
        @game_winner = @players[1]
        @players_scores[@game_winner] += 1
      end
    end
  end

  def someone_won?
    !@game_winner.nil?
  end

  def board_full?
    @board.full?
  end

  def display_game_winner
    if @game_winner.nil?
      prompt "No winner!"
    else
      prompt "Winner is #{@game_winner}!"
    end
  end

  def display_score
    @players.each do |player|
      print "#{player.name}'s score is #{@players_scores[player]}. "
    end
    puts ""
  end

  def update_match_winner
    @match_winner = @players_scores.select{ |_, score| score >= TARGET_SCORE }.keys[0]
  end

  def reset_game
    @board.reset_squares
    @game_winner = nil
  end

  def display_goodbye_message
    prompt "#{@match_winner.name} won the match with #{@players_scores[@match_winner]} wins."
    prompt "Thank you for playing! Goodbye!"
  end

end

class Board
  attr_reader :squares_hash

  def initialize
    @squares_hash = {}
    # {1 => square_1, 2=> square_2...}
    (1..9).each{ |i| @squares_hash[i] = Square.new }
  end

  def print
    puts ""
    puts "     |     |     "
    puts "  #{@squares_hash[1]}  |  #{@squares_hash[2]}  |  #{@squares_hash[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares_hash[4]}  |  #{@squares_hash[5]}  |  #{@squares_hash[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares_hash[7]}  |  #{@squares_hash[8]}  |  #{@squares_hash[9]}  "
    puts "     |     |     "
  end

  def marker_value_at(position)
   @squares_hash[position].marker
  end

  def marker_count_at_positions(positions, marker)
    count = 0
    positions.each { |position| count += 1 if marker_value_at(position) == marker}
    count
  end

  def positions_containing_marker(marker)
    @squares_hash.select{ |_, square| square.marker == marker}.keys
  end

  def empty_square_positions
    positions_containing_marker(" ")
  end

  def full?
    empty_square_positions.empty?
  end

  def reset_squares
    @squares_hash.values.each { |square| square.marker = " " }
  end

end

class Square
  attr_accessor :marker
  
  def initialize
    @marker = " "
  end

  def to_s
    @marker.to_s
  end

end

class Player
  include TTTGameUtils
  attr_reader :name, :marker

  def initialize(name, marker, is_computer = false)
    @name = name
    @marker = marker
    @is_computer = is_computer
  end

  def mark(board, opponents_marker = nil)
    @is_computer ? auto_mark(board, opponents_marker) : manual_mark(board)
  end

  private

  def find_at_risk_position(board, marker)
    TTTGame::WINNING_LINES.each do |line|
      if board.marker_count_at_positions(line, marker) == 2
        line.each do |position|
          return position if board.marker_value_at(position) == " "
        end
      end
    end
    nil
  end

  def auto_mark(board, opponents_marker)
    
    # Offense first
    position = find_at_risk_position(board, @marker)
    if !position
      # Defense, since no offensive position found
      position = find_at_risk_position(board, opponents_marker)
      if !position
        position = if board.marker_value_at(5) == " "
                     5
                   else
                     board.empty_square_positions.sample
                   end
      end
    end
    mark_board(board, position)
  end

  def manual_mark(board)
    empty_square_positions = board.empty_square_positions
    loop do
      prompt("Choose #{joinor(empty_square_positions)}")
      chosen_position = gets.chomp.to_i
      if empty_square_positions.include?(chosen_position)
        mark_board(board, chosen_position)
        break
      else
        prompt("Invalid choice.")
      end
    end
  end

  def mark_board(board, position)
    board.squares_hash[position].marker = @marker
  end

  def to_s
    @name
  end
end

game = TTTGame.new
game.play
