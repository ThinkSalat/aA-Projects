class PolyTreeNode
  attr_accessor :value
  def initialize(value)
    @value = value
    @children = []
  end

  def parent
    @parent
  end

  def parent=(node)
    @parent = node
    @parent.children << self if @parent
  end

  def children
    @children
  end

end
