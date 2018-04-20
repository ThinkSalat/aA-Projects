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
    if @parent = node
      @parent.children.push(self) unless @parent.children.include?(self)
    end
  end

  def children
    @children
  end

  def add_child(node)
    unless @children.include?(node)
      @children << node
      node.parent = self
    end
  end

  def remove_child(node)
    raise "error" if !(@children.include?(node))
    node.parent = nil
    @children.delete(node)
  end

end
