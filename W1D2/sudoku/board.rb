require_relative "tile"
require "colorize"
require "colorized_string"

class Board
  attr_accessor :grid 
  def initialize(grid)
    @grid = grid
    switch_to_tiles
  end
  
  def switch_to_tiles
    @grid = @grid.map do |row|
      row.map do |el|
        Tile.new(el.to_i, el.to_i !=0 )
      end 
    end
  end 
  
  def self.from_file(filename)
    file = File.open(filename)
    rows = file.readlines.map(&:chomp)
    grid = rows.map do |row|
      row.chars.map do |char|
        char
      end 
    end
    Board.new(grid)
  end
  
  def render
    system("clear")
    display = ''
    @grid.each_with_index do |row,idx|
      row_display = ''
      row.each_with_index do |tile,idx2|
        if tile.given 
          row_display += tile.value.to_s.colorize(:red)
        else 
          row_display += tile.value.to_s
        end 
        row_display += "|" if (idx2 + 1)% 3 == 0
      end
      display += row_display + "\n"
      display += "------------\n" if (idx + 1)% 3 == 0
    end
    puts display
  end 
  
  def solved?
    return false if @grid.flatten.any? {|el| el.value == 0}
    @grid.each do |row|
      return false if row.map(&:value).uniq.length == 9
    end
      
  end 
  
end 