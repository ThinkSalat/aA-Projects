require_relative 'polynodetree'

class KnightPathFinder
  attr_accessor :visited_positions, :start_pos, :move_tree
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
  def initialize(pos)
    @start_pos = pos
    @visited_positions = [pos]
    build_move_tree
  end

  def self.valid_moves(pos)
    moves = DELTAS.map do |(dx,dy)|
      [pos[0] + dx, pos[1] + dy]
    end
    moves.select {|move| KnightPathFinder.within_bounds?(move)}
  end

  def self.within_bounds?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def new_move_positions(pos)

    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.reject! { |move| @visited_positions.include?(move)}
    new_moves.each {|move| @visited_positions << move}
    new_moves
  end

  def build_move_tree
    root = PolyTreeNode.new(@start_pos)
    @move_tree = root
    queue = [root]
    until queue.empty?
      this_node = queue.shift
      new_move_positions(this_node.value).each { |pos| this_node.add_child(PolyTreeNode.new(pos)) }
      queue.concat(this_node.children)
    end
    @move_tree
  end

  

end

k = KnightPathFinder.new([0,0])
