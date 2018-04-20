require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark = board, next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    oppo_mark = (evaluator == :x) ? :o : :x
    return true if @board.over? && @board.winner == oppo_mark
    return false if @board.winner.nil? || @board.winner == evaluator

    
  end

  def winning_node?(evaluator)
    oppo_mark = (evaluator == :x) ? :o : :x
    return true if @board.over? && @board.winner == evaluator
    return false if @board.winner.nil? || @board.winner == oppo_mark

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
