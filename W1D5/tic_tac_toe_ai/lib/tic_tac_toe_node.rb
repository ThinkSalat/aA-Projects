require_relative 'tic_tac_toe'

class TicTacToeNode
  #next_mover_mark = current player
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos =
      board, next_mover_mark, prev_move_pos
  end

  def losing_node?(evaluator)
    return board.won? && board.winner != evaluator if board.over?
    if next_mover_mark == evaluator
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    return board.won? && board.winner == evaluator if board.over?
    if next_mover_mark == evaluator
      children.any? {|child| child.winning_node?(evaluator)}
    else
      children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_nodes = []
    grid_size = board.rows.length
    (0...grid_size).to_a.repeated_permutation(2).each do |pos|
      if board.empty?(pos)
        this_board = board.dup
        this_board[pos] = next_mover_mark
        next_next_mover_mark = next_mover_mark == :x ? :o : :x
        new_node = TicTacToeNode.new(this_board,next_next_mover_mark,pos)
        child_nodes << new_node
      end
    end
    child_nodes
  end
end
