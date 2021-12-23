require_relative 'node'
require 'pry-byebug'

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.sort.uniq)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = (arr.size - 1) / 2
    root_node = Node.new(arr[mid])

    root_node.left = build_tree(arr[0...mid])
    root_node.right = build_tree(arr[(mid + 1)..-1])

    root_node
  end

  def insert(value, node = root)
    return nil if value == node.data

    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end

  def delete(value, node = root)
    # if node is empty
    return node if node.nil?

    # otherwise, recur down the tree
    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    # if value is same as node.data, then this is the node to be deleted
    else
      # node with only one child or no child
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      # node with two children: get the inorder 
      # successor (smallest in the right subtree)
      node.data = min_value(node.right)

      # delete the inorder successor
      node.right = delete(node.right, node.data)
    end
    node
  end

  def min_value(node)
    min_v = node.data
    while node.left.nil? == false do
      min_v = node.left.data
      node = node.left
    end
    min_v
  end

  def find(value, node = root)
    return node if node.nil? || node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  def level_order(node = root, queue = [])
    print "#{node.data} "
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    return if queue.empty?

    level_order(queue.shift, queue)
  end

  # visualize binary search tree, method by student on Discord
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
