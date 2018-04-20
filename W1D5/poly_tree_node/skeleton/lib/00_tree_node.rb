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
    @parent.children.delete(self) if @parent
    @parent = node
    if @parent
      @parent.children << self unless @parent.children.include?(self)
    end
  end

  def children
    @children
  end

  def add_child(node)
  end

  def remove_child()
  end

end
