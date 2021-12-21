require_relative 'node'

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.sort.uniq)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = (arr.size - 1) / 2
    node = Node.new(arr[mid])

    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[(mid + 1)..-1])

    # node

    p arr
    p mid
    p node
    p node.left
    p node.right
  end

  def insert(value, node)
    
  end
end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# 10.times do
#   array << rand(10)
# end
Tree.new(array)