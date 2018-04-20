require_relative 'polynodetree'
DELTAS = [
  [1,2],
  [1,-2],
  [-1,2],
  [-1,-2],
  [2,1],
  [2,-1],
  [-2,1],
  [-2,-1]
]
class KnightPathFinder

  def initialize(pos)
    @position = pos
    @visited_positions = [pos]
    build_move_tree
  end

  def self.valid_moves(pos)
    moves = DELTAS.map do |(dx,dy)|
      [pos[0] + dx, pos[1] + dy]
    end
    moves.select! {|move| within_bounds?(move)}
  end

  def within_bounds(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def new_move_positions
    new_moves = KnightPathFinder.valid_moves(@position).reject! { |move| @visited_positions.include?(move)}
    @visited_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree
    root = @position
  end


end


no moves out of bounds
moves.select do |move|

end
