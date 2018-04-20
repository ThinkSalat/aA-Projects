require_relative "card"
class Board
  def initialize()
    @grid = []
  end

  def []=(index,val)
    @grid[index] = val
  end

  def [](index)
    @grid[index]
  end

  def populate
    deck = []
    ('a'..'d').each do |card|
      deck << Card.new(card)
      deck << Card.new(card)
    end
    deck.shuffle!

    until deck.empty?
      @grid << deck.pop
    end
  end

  def render
    display = ""
    row_length = 4
    display_grid = @grid.dup
    current_idx = 0
    until display_grid.empty?
      idx = 0
      until idx == row_length
        display += current_idx.to_s + "."
        display += display_grid.shift.to_s
        display.concat(' ')
        idx += 1
        current_idx += 1
      end
      display += "\n"
    end
    puts display
  end

  def won?
    @grid.all? {|card| card.hidden == false}
  end

  def reveal(guessed_pos)
    @grid[guessed_pos].reveal
  end

  def hide(guessed_pos)
    @grid[guessed_pos].hide
  end

end
