DECK_SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds']
FACE_CARDS = ['Jack', 'Queen', 'King']

FACE_CARD_VALUE = 10
ACE_VALUES = [1, 11]
DEALER_STAY_LIMIT = 17
BUST_THRESHOLD = 21
WINNING_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

def initialise_deck
  deck = DECK_SUITS.each_with_object([]) do |suit, cards|
    add_numeric_cards(suit, cards)
    add_face_cards(suit, cards)
    add_ace(suit, cards)
  end

  deck.shuffle!
end

def add_numeric_cards(suit, cards)
  (2..10).each do |num|
    cards.push({
                 name: "#{num} of #{suit}",
                 rank: num.to_s,
                 suit: suit,
                 value: num
               })
  end
end

def add_face_cards(suit, cards)
  FACE_CARDS.each do |face|
    cards.push({
                 name: "#{face} of #{suit}",
                 rank: face,
                 suit: suit,
                 value: FACE_CARD_VALUE
               })
  end
end

def add_ace(suit, cards)
  cards.push({
               name: "Ace of #{suit}",
               rank: 'Ace',
               suit: suit,
               value: ACE_VALUES
             })
end

def deal_first_cards(deck)
  player_hand = deal_cards(deck, 2)
  dealer_hand = deal_cards(deck, 2)
  [player_hand, dealer_hand]
end

def deal_cards(deck, cards_to_deal)
  cards_to_deal == 1 ? deck.pop : deck.pop(cards_to_deal)
end

def show_starting_position(player_hand, dealer_hand, player_total)
  show_all_cards(player_hand, :player)
  show_hand_value(player_total, :player)
  show_one_dealer_card(dealer_hand)
end

def show_all_cards(hand, owner)
  card_names = hand.map { |card| card[:name] }
  card_names_string = joinor(card_names)
  hand_owner = format_hand_owner(owner)
  prompt("#{hand_owner} hand contains #{card_names_string}")
end

def show_hand_value(hand_value, owner)
  hand_owner = format_hand_owner(owner)
  prompt("#{hand_owner} hand's total value is #{hand_value}")
end

def format_hand_owner(owner)
  case owner
  when :player then "Your"
  else "The dealer's"
  end
end

def show_one_dealer_card(hand)
  card_name = hand[0][:name]
  prompt("The dealer has #{card_name} and an unknown card")
end

def joinor(arr, delimiter = ', ', word = 'and')
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

def calculate_hand_value(hand)
  ace_cards, non_ace_cards = hand.partition { |card| card[:rank] == 'Ace' }

  non_ace_value = non_ace_cards.reduce(0) { |sum, card| sum + card[:value] }
  non_ace_value + calculate_aces_value(ace_cards, non_ace_value)
end

def calculate_aces_value(ace_cards, non_ace_value)
  ace_sum = 0

  ace_cards.each_with_index do |ace, index|
    ace_sum += if ace_sum + non_ace_value > 10 || index + 1 < ace_cards.length
                 ace[:value][0]
               else
                 ace[:value][1]
               end
  end

  ace_sum
end

def player_turn(deck, player_hand, player_total)
  loop do
    player_choice = decide_player_choice
    break player_total if player_choice == 'stay'

    prompt("Dealing you one more card...")
    player_hand.push(deal_cards(deck, 1))
    show_all_cards(player_hand, :player)

    player_total = calculate_hand_value(player_hand)
    show_hand_value(player_total, :player)
    break player_total if busted?(player_total)
  end
end

def decide_player_choice
  loop do
    prompt("Would you like to hit or stay?")
    player_choice = gets.chomp

    if player_choice.downcase.start_with?('h')
      break 'hit'
    elsif player_choice.downcase.start_with?('s')
      break 'stay'
    end

    prompt('Invalid choice. Please try again')
  end
end

def busted?(value)
  value > BUST_THRESHOLD
end

def dealer_turn(deck, dealer_hand, dealer_total)
  loop do
    show_all_cards(dealer_hand, :dealer)
    sleep(2)
    break dealer_total if dealer_total >= DEALER_STAY_LIMIT

    prompt("Dealer hits...")
    dealer_hand.push(deal_cards(deck, 1))
    dealer_total = calculate_hand_value(dealer_hand)
  end
end

def check_result(player_total, dealer_total)
  if busted?(player_total)
    :player_bust
  elsif busted?(dealer_total)
    :dealer_bust
  else
    determine_winner(player_total, dealer_total)
  end
end

def determine_winner(player_total, dealer_total)
  if player_total > dealer_total
    :player_closer
  elsif player_total < dealer_total
    :dealer_closer
  else
    :tie
  end
end

def show_result(player_total, dealer_total, result)
  prompt("Your final total is #{player_total} and the dealer's is " \
         "#{dealer_total}")
  sleep(1)
  case result
  when :player_bust then prompt("You're bust! The dealer wins this round")
  when :dealer_bust then prompt("The dealer is bust. You win this round!")
  when :player_closer then prompt("You're closer to #{BUST_THRESHOLD}. " \
                                  "You win this round!")
  when :dealer_closer then prompt("Dealer is closer to #{BUST_THRESHOLD}. " \
                                  "They win this round!")
  else prompt("You and the dealer have the same score. It's a tie!")
  end
end

def update_scores(scores, result)
  if result == :player_closer || result == :dealer_bust
    scores[:player] += 1
  elsif result == :dealer_closer || result == :player_bust
    scores[:dealer] += 1
  end

  prompt("Current score: Player #{scores[:player]} - Dealer " \
         "#{scores[:dealer]}")
end

def game_over?(scores)
  scores[:player] == WINNING_SCORE || scores[:dealer] == WINNING_SCORE
end

def show_final_result(scores)
  if scores[:player] == WINNING_SCORE
    prompt("Game over. You reached #{WINNING_SCORE} rounds first. " \
           "Congratulations!")
  elsif scores[:dealer] == WINNING_SCORE
    prompt("Game over. The dealer reached #{WINNING_SCORE} rounds first. " \
           "Better luck next time!")
  end
end

def reset_scores(scores)
  scores[:player] = 0
  scores[:dealer] = 0
end

def play_again?
  prompt("Do you want to play again? (Press 'Y' to confirm)")
  repeat_choice = gets.chomp
  repeat_choice.downcase.start_with?('y')
end

prompt("Welcome to #{BUST_THRESHOLD}! It's you vs. the dealer. First to " \
       "#{WINNING_SCORE} rounds wins")
prompt("Dealing first cards...")
sleep(1)

scores = {
  player: 0,
  dealer: 0
}

loop do
  deck = initialise_deck
  player_hand, dealer_hand = deal_first_cards(deck)

  player_total = calculate_hand_value(player_hand)
  dealer_total = calculate_hand_value(dealer_hand)
  show_starting_position(player_hand, dealer_hand, player_total)

  player_total = player_turn(deck, player_hand, player_total)
  unless busted?(player_total)
    dealer_total = dealer_turn(deck, dealer_hand, dealer_total)
  end

  result = check_result(player_total, dealer_total)
  show_result(player_total, dealer_total, result)
  update_scores(scores, result)
  if game_over?(scores)
    show_final_result(scores)
    break unless play_again?
    reset_scores(scores)
  end

  prompt('Starting a new round...')
  sleep(3)
end

prompt("Thanks for playing #{BUST_THRESHOLD}!")
