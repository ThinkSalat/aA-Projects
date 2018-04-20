class PolyTreeNode
  attr_accessor :value
  def initialize(value)
    @value = value
    @children = []
  end

  def inspect
    # "#{@parent.value} is parent" if @parent
    # "No parent!" unless @parent
    "#{@value} #{@children.count} children"
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

  def dfs(target)
    return self if target == @value
    @children.each do |child|
      dfs_node = child.dfs(target)
      return dfs_node unless dfs_node.nil?
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target
      queue.concat(node.children)
    end
    nil
  end

end
