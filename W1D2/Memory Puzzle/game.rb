require_relative 'board'
require_relative 'player'

class Game
  def initialize(player)
    @player = player
    @board = Board.new
    @board.populate
    @valid_moves = (0..7).to_a
  end

  def play
    until @board.won?
      play_turn
    end
    puts "You Won!!!!!!!!!"
  end

  def play_turn
    system("clear")
    @board.render
    guess1 = @player.get_guess_one
    @board.reveal(guess1)
    @player.update_guesses(guess1, @board[guess1])
    system("clear")
    @board.render
    puts 'try to remember the match!'
    guess2 = @player.get_guess_two(guess1)
    @board.reveal(guess2)
    system("clear")
    @board.render

    @player.update_guesses(guess2, @board[guess2])

    if @board[guess1] != @board[guess2]
      sleep(3)
      @board.hide(guess1)
      @board.hide(guess2)
    else
      @player.update_revealed([guess1,guess2])
    end
  end

end
