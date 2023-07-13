INITIAL_MARKER = ' '
USER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [7, 5, 3]]

WINNING_SCORE = 5
MIDDLE_SQUARE = 5

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def play_round(board, current_player)
  loop do
    display_board(board)
    mark_player_square(board, current_player)
    current_player = alternate_player(current_player)
    break if winner?(board) || board_full?(board)
  end
end

def decide_turn_order
  turn_choice = ""
  prompt("Who should move first? (Options: User, Computer, Random)")

  loop do
    turn_choice = convert_turn_choice(gets.chomp.downcase)
    break if turn_choice == 'User' || turn_choice == 'Computer'
    prompt('Invalid option. Please choose User, Computer or Random')
  end

  prompt("#{turn_choice} moving first")
  turn_choice
end

def convert_turn_choice(turn_choice)
  if turn_choice.start_with?('r')
    ['User', 'Computer'].sample
  elsif turn_choice.start_with?('u')
    'User'
  elsif turn_choice.start_with?('c')
    'Computer'
  else
    turn_choice
  end
end

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  prompt("You're #{USER_MARKER}. Computer is #{COMPUTER_MARKER}")
  prompt("Current board:")
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end

# rubocop:enable Metrics/AbcSize
def empty_squares(board)
  board.select { |_, marker| marker == INITIAL_MARKER }.keys
end

def mark_player_square(board, current_player)
  case current_player
  when 'User' then mark_user_square(board)
  else mark_computer_square(board)
  end
end

def mark_user_square(board)
  square = get_user_square(board)
  update_board(board, square, USER_MARKER)
end

def get_user_square(board)
  square = 0

  loop do
    prompt("Please choose a square (valid options: " \
           "#{joinor(empty_squares(board))})")

    square = gets.chomp
    break if empty_squares(board).include?(square.to_i) && valid_int?(square)
    prompt("That's not a valid option, please try again")
  end

  square.to_i
end

def valid_int?(input_string)
  input_string.to_i.to_s == input_string
end

def joinor(arr, delimiter = ', ', word = 'or')
  arr.each_with_object("") do |element, text|
    if element == arr.last
      last_delimiter = arr.length > 2 ? delimiter + word : " #{word}"
      text << "#{last_delimiter} "
    elsif element != arr.first
      text << delimiter
    end

    text << element.to_s
  end
end

def update_board(board, square, player_marker)
  board[square] = player_marker
end

def threatened_lines(board, player_marker)
  WINNING_LINES.select do |line|
    board.values_at(*line).count(player_marker) == 2 &&
      board.values_at(*line).count(INITIAL_MARKER) == 1
  end
end

def choose_computer_square(board, computer_threats, user_threats)
  if computer_threats.length > 0
    computer_threats[0].find { |num| board[num] == INITIAL_MARKER }
  elsif user_threats.length > 0
    user_threats[0].find { |num| board[num] == INITIAL_MARKER }
  elsif board[MIDDLE_SQUARE] == INITIAL_MARKER
    MIDDLE_SQUARE
  else
    empty_squares(board).sample
  end
end

def mark_computer_square(board)
  computer_threats = threatened_lines(board, COMPUTER_MARKER)
  user_threats = threatened_lines(board, USER_MARKER)

  square = choose_computer_square(board, computer_threats, user_threats)
  update_board(board, square, COMPUTER_MARKER)
end

def alternate_player(current_player)
  current_player == 'User' ? 'Computer' : 'User'
end

def check_result(board, scores)
  if winner?(board)
    winner = determine_winner(board)
    prompt("#{winner} won this round!")
    increment_scores(scores, winner)
  else
    prompt("This round is a tie")
  end

  prompt("Current score: User #{scores['User']} - Computer " \
         "#{scores['Computer']}")
end

def winner?(board)
  !!determine_winner(board)
end

def determine_winner(board)
  WINNING_LINES.each do |line|
    squares = board.values_at(*line)

    if squares.count(USER_MARKER) == 3
      return 'User'
    elsif squares.count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end

def increment_scores(scores, winner)
  scores[winner] += 1
end

def board_full?(board)
  empty_squares(board).empty?
end

def game_over?(scores)
  scores['User'] == WINNING_SCORE || scores['Computer'] == WINNING_SCORE
end

def display_final_result(scores)
  if scores['User'] == WINNING_SCORE
    prompt("Game over. You reached #{WINNING_SCORE} rounds first. " \
           "Congratulations!")
  elsif scores['Computer'] == WINNING_SCORE
    prompt("Game over. The computer reached #{WINNING_SCORE} rounds first. " \
           "Better luck next time!")
  end
end

def play_again?
  prompt("Do you want to play again? (Press 'Y' to confirm)")
  repeat_choice = gets.chomp
  repeat_choice.downcase.start_with?('y')
end

def reset_scores(scores)
  scores['User'] = 0
  scores['Computer'] = 0
end

prompt("Welcome to Tic Tac Toe! First to #{WINNING_SCORE} rounds wins")
first_mover = decide_turn_order

scores = {
  'User' => 0,
  'Computer' => 0
}

loop do
  board = initialise_board
  play_round(board, first_mover)
  display_board(board)
  check_result(board, scores)

  if game_over?(scores)
    display_final_result(scores)
    break unless play_again?
    first_mover = decide_turn_order
    reset_scores(scores)
  else
    first_mover = alternate_player(first_mover)
    prompt("New round. #{first_mover} moving first")
  end
end

prompt("Thanks for playing Tic Tac Toe!")
