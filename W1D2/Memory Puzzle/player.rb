
class Player

  def initialize
    @already_revealed = []
  end

  def get_guess_one
    get_input
  end

  def get_guess_two(guess)
    guess1 = guess
    guess1 = get_input until guess1 != guess
  end

  def get_input
    guess = -1
    until valid_guess(guess)
      puts "enter an index to reveal"
      guess = gets.chomp.to_i
    end
    guess
  end

  def valid_guess(guess)
    (guess.between?(0,7)) && (!@already_revealed.include?(guess))
  end

  def update_revealed(guesses)
    @already_revealed.concat(guesses)
  end
  def update_guesses(_,_)
  end


end

class ComputerPlayer < Player

  def initialize
    @known_cards = Hash.new(4) {|h,k| h[k] = [] }
    @matched_cards = []
    @guess_queue = []

  end

  def get_input
    if match_possible? && @guess_queue.empty?
      unseen = get_unseen_cards
      @guess_queue.concat(@known_cards.values.select?{|el| el.length==2}) #come back to this
    end
    if @guess_queue.empty?
      get_unseen_cards.sample
    else
      @guess_queue.pop
    end
  end

  def get_unseen_cards
    guesses = (0..7).to_a.reject{|card| @matched_cards.include?(card)}
    guesses = guesses.reject{|card| @known_cards.values.flatten.include?(card)}
    guesses
  end

  def match_possible?
    @known_cards.values.any?{|el| el.length==2}
  end

  def update_revealed(guesses)
    @matched_cards.concat(guesses)
  end

  def update_guesses(guess, value)

    @known_cards[value] << guess
  end
end
