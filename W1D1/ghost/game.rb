require 'set'
require 'byebug'
require_relative 'player'

class Game

  def initialize(player1,player2)
    @current_player, @previous_player = player1, player2
    @fragment = ''
    @dictionary = File.readlines('dictionary.txt').map(&:chomp).to_set
    @losses = Hash.new(0)
  end

  def play
    set_up
    until @losses.any? {|k,v| v == 5}
      play_round
    end
    puts "Game Over! \n#{@previous_player.name} LOSES! \n The word was '#{@fragment}'"
  end

  def play_round
    until over?
      puts "The current fragment is #{@fragment}"
      take_turn(@current_player)
    end
  end

  def display_standings
    @losses.each do |player, loss_record|
      print "#{player.name}: #{record(player)} "
    end
  end

  def record(player)
    case @losses[player]
    when 0 then 'No losses'
    when 1 then "G"
    when 2 then "GH"
    when 3 then "GHO"
    when 4 then "GHOS"
    when 5 then "GHOST"
    end
  end

  def set_up
    @losses[@current_player] = 0
    @losses[@previous_player] = 0
    puts "#{@current_player.name}, please choose a beginning letter."
    @fragment = @current_player.guess.downcase
    next_player!
  end

  def over?
    @dictionary.each { |word| return true if word == @fragment}
    false
  end


  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    puts "#{player.name} it's your turn. Add your letter to the fragment."
    guess = player.guess.downcase
    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess.downcase
    end
    @fragment += guess
    next_player!
  end

  def valid_play?(string)
    return false unless ('a'..'z').to_a.include?(string.downcase)
    length = (@fragment + string).length
    @dictionary.each { |word| return true if word[0...length] == @fragment+string }
    false
  end



end

if $PROGRAM_NAME == __FILE__

  p1 = Player.new('Shawn')
  p2 = Player.new('Carey')
  g= Game.new(p1,p2)
  g.play
end
